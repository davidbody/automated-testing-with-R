accuracy_measures <- function(predicted, actual) {
    ctable <- table(predicted, actual)
    accuracy <- sum(diag(ctable)) / sum(ctable)
    list(accuracy = accuracy)
}
