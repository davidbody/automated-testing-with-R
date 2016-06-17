library(testthat)

rm(list = ls())

source("confusion.R")

context("Reading attributes")

test_that("factor lists", {
    predicted <- c(T, T, T, F)
    actual <- c(T, F, T, F)
    t <- table(predicted, actual)
    expect_equal(factor_lists(t), c("predicted", "actual"))
})

test_that("factor names", {
    predicted <- c(T, T, T, F)
    actual <- c(T, F, T, F)
    t <- table(predicted, actual)
    expect_equal(factor_names(t), c("FALSE", "TRUE"))
})

context("Creating inputs")

test_that("inputs", {
    predicted <- c(T, T, T, F)
    actual <- c(T, F, T, F)
    t <- table(predicted, actual)
    i <- inputs(t)
    expect_equal(class(i), "list")
    expect_equal(names(i), c("predicted", "actual"))
    expect_equal(i$predicted, c(F, T, T, T))
    expect_equal(i$actual, c(F, F, T, T))
})

context("make_table")

test_that("making table", {
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

context("round trip")

test_that("table -> inputs -> table works", {
    t <- make_table(c(90, 4,
                      5, 82))
    i <- inputs(t)
    t2 <- table(i)
    expect_equal(t, t2)
})
