# Project Spec: Testing Suite Audit for Payment Network Competition Model

I want to make sure the testing suite @code/model_unit_tests.jl for @code/model_functions.jl is healthy.

There's really three main categories of tests that I want to explain. For the simpler functions, it's good enough to focus on if they are mechanically giving the right answer? And this is kind of more traditional software engineering programming tests.

For the more sophisticated functions that are closer to moment conditions, the key thing to focus on is the economic correctness of the mapping between the parameter values and then the moments. For inspiration, see the kinds of moments we study in @code/estimate_model_current_eqm_foc.jl. An example of a test here might be something like increasing the variance of the random coefficients means that consumers are more likely to substitute to products with similar characteristics.

The third category when thinking about a really big equilibrium are then accounting identities, things like making sure the total dollar spent equals the total baseline income plus average rewards.

Feel free to design additional categories if these are not sufficient.

I would like you to go through the @code/model_functions.jl file and make sure each test has each function has a corresponding test that matches one of these categories or potentially multiple categories, depending on the nature of the function.

At the end, come back to me with a report on just the architecture of the entire testing suite and potentially any additional tests that you want to implement for functions that you think are not adequately tested.
