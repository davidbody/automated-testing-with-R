library(testthat)

source("confusion.R")

context("Utility functions to create fake data from confusion matrix")

test_that("factors_list returns the expected list of factors", {
    predicted <- c(T, T, T, F)
    actual <- c(T, F, T, F)
    t <- table(predicted, actual)
    expect_equal(factors_list(t), c("predicted", "actual"))
})

test_that("factor_names returns the expected factor names", {
    predicted <- c(T, T, T, F)
    actual <- c(T, F, T, F)
    t <- table(predicted, actual)
    expect_equal(factor_names(t), c("FALSE", "TRUE"))
})

test_that("we can generate data with fake_inputs", {
    predicted <- c(T, T, T, F)
    actual <- c(T, F, T, F)
    t <- table(predicted, actual)
    data <- fake_inputs(t)
    expect_equal(class(data), "list")
    expect_equal(names(data), c("predicted", "actual"))
    expect_equal(sum(data$predicted), 3)
    expect_equal(sum(data$actual), 2)
    expect_equal(sum(data$predicted == data$actual), 3)
    expect_equal(sum(data$predicted != data$actual), 1)
})

test_that("we can make a confusion matrix with make_table", {
    t <- make_table(c(1, 2,
                      3, 4))
    expect_equal(class(t), "table")

    expect_equal(t[1, 1], 1)
    expect_equal(t[1, 2], 2)
    expect_equal(t[2, 1], 3)
    expect_equal(t[2, 2], 4)

    dn <- attr(t, "dimnames")
    expect_equal(length(dn), 2)
    expect_equal(dn$predicted, c("FALSE", "TRUE"))
    expect_equal(dn$actual, c("FALSE", "TRUE"))
})

test_that("round-trip table -> fake inputs -> table works", {
    t1 <- make_table(c(90, 4,
                       5, 82))
    data <- fake_inputs(t1)
    t2 <- table(data)
    expect_equal(t1, t2)
})
