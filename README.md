# prime_multiplication_table_test
This is the solution to the problem posed in the "prime_challenge.pdf" file in this repo.  

To get code up and running, install ruby 2.2.2, and run bundle.  Execute the tests with 'rspec'.  And run the code with ./prime_cli.rb -h.

This code has a big O of N^2.  To speed up processing, the prime finding section could be done with multiple threads by: breaking up the search area in to chucks, computing the result of each chuck, and then merging the results back together at the end.
