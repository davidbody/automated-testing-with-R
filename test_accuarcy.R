library(testthat)

source("accuracy.R")
source("confusion.R")

context("Accuracy measures for binary classification")

## Example from Practical Data Science with R, p. 93
confusion_matrix <- make_table(c(264, 14,
                                 22, 158))
test_data <- fake_inputs(confusion_matrix)
predicted <- test_data$predicted
actual <- test_data$actual
am <- accuracy_measures(predicted, actual)

test_that("spam detection example", {
    expect_equal(am$confusion_matrix, confusion_matrix)
    expect_equal(am$accuracy, 0.92139738)
    expect_equal(am$precision, 0.918604651)
    expect_equal(am$recall, 0.877777778)
    expect_equal(am$sensitivity, 0.877777778)
    expect_equal(am$specificity, 0.949640288)
    expect_equal(am$F1, 0.897727273)
})

## Example from An Introduction to Stastical Learning, p. 145
confusion_matrix <- make_table(c(9644, 23,
                                 252, 81))
test_data <- fake_inputs(confusion_matrix)
predicted <- test_data$predicted
actual <- test_data$actual
am <- accuracy_measures(predicted, actual)

test_that("credit card default example", {
    expect_equal(am$confusion_matrix, confusion_matrix)
    expect_equal(am$accuracy, 0.972500000)
    expect_equal(am$precision, 0.778846154)
    expect_equal(am$recall, 0.243243243)
    expect_equal(am$sensitivity, 0.243243243)
    expect_equal(am$specificity, 0.997620772)
    expect_equal(am$F1, 0.370709382)
})
