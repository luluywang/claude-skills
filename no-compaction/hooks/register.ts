import { atom, read, update } from 'claude-code'
import type { Register } from 'claude-code'

// Kept in $.state so a mod reload mid-session still knows where the log is.
const transcriptPath = atom({ plugin: 'no-compaction', key: 'transcriptPath' } as const, '')

function resumeMessage(path: string): string {
  return (
    'No-compaction workflow: your context filled up and was cleared. ' +
    `Read ${path} like any normal file to find what you were working on, ` +
    'and resume as seamlessly as possible from where you left off.\n\n' +
    'Tips:\n' +
    '- Each line is one JSON message, some with huge tool results: never cat or tail it raw, ' +
    'cap each block to a few hundred chars.\n' +
    '- The end shows where you stopped; the first user messages show the goal.\n' +
    '- The last few lines are this new request, so skip them.'
  )
}

export const register: Register = on => {
  // Only classic events carry transcript_path; record it as early and as often as we can.
  on('classic.SessionStart', async ($, e, next) => {
    await update($, transcriptPath, () => e.transcript_path)
    return next(e)
  }).catch(($, e, next) => next(e))
  on('classic.UserPromptSubmit', async ($, e, next) => {
    await update($, transcriptPath, () => e.transcript_path)
    return next(e)
  }).catch(($, e, next) => next(e))

  // Nothing to precompute: the replacement is free.
  on('session.compact', { trigger: 'precompute' }, () => ({ skip: 'no-compaction mod' }))

  on('session.compact', async ($, e, next) => {
    // Subagents keep their own transcript files we can't locate; let them compact normally.
    if (e.trigger === 'precompute' || e.agentId !== undefined) {
      return next(e)
    }
    const path = await read($, transcriptPath)
    if (path === '') {
      $.ui.toast('no-compaction: transcript path unknown, using normal compaction')
      return next(e)
    }
    return {
      messages: [{ role: 'user', text: resumeMessage(path), toolUses: [] }],
    }
  }).catch(($, e, next) => next(e))
}
