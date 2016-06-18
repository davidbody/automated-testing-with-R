library(testthat)

source("accuracy.R")
source("confusion.R")

context("Binary classification")

confusion_matrix <- make_table(c(264, 14,
                                 22, 158))
test_data <- fake_inputs(confusion_matrix)
predicted <- test_data$predicted
actual <- test_data$actual

test_that("confustion matrix is correct", {
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$confusion_matrix, confusion_matrix)
})

test_that("accuarcy is correct", {
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$accuracy, 0.92139738)
})

test_that("precision is correct", {
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$precision, 0.918604651)
})

test_that("recall is correct", {
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$recall, 0.877777778)
})

test_that("sensitivity is correct", {
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$sensitivity, 0.877777778)
})

test_that("specificty is correct", {
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$specificity, 0.949640288)
})

test_that("F1 is correct", {
    am <- accuracy_measures(predicted, actual)
    expect_equal(am$F1, 0.897727273)
})
