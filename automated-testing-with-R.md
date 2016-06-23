# Automated Testing with R

## Central Iowa R User Group
### June 23, 2016

How do you know if your R code works? By testing it, of course. That's what we do when we work with R interactively. We write some code, run it in the console, and check the results. If the results aren't right, we change the code and run it again. That's the standard and productive workflow R users know and love.

But...

What happens when you come back to a project a few weeks later and want to make some changes? Do you remember how you tested the code so you can repeat the process? How do you know your new changes won't have unintended consequences? What happens when someone else wants to use or modify your code?

This talk will introduce automated testing of R code using Hadley Wickam's [`testthat`](https://github.com/hadley/testthat), "an R package to make testing fun." We'll cover how to get started, how to write tests, and how to run tests. We'll see how easy it can be to take some code you've just run interactively and turn it into an automated test that you or anyone else can run again and again. We'll also discuss the kinds of things you might want to test or not test.

We'll see that automated testing can deliver benefits such as greater confidence that code is correct, communication (documentation) of the intent of code through examples, and even improved code design.

[David W. Body](https://twitter.com/david_body) is an independent software developer who is currently accepting contract and freelance work.
