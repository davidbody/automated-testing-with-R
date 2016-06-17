library(testthat)

source("accuracy.R")

context("Binary classification")

test_that("basic accuarcy measures", {
    predicted <- c(T, T, F, F)
    actual <- c(T, F, T, F)
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$accuracy, 0.5)
})
