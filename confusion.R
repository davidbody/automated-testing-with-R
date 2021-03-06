## Utility functions to generate test data from confusion matrices

## Returns a list of factors from a table generated by the
## table function.
factors_list <- function(t) {
    names(attr(t, "dimnames"))
}

## Returns a list of factor names from a table generated by
## the table function.
factor_names <- function(t) {
    attr(t, "dimnames")[[1]]
}

## Returns a generated set of "predicted" and "actual"
## binary classification data based on a confusion
## matrix. Use the make_table fuction (below) to create
## a confusion matrix in the proper format.
fake_inputs <- function(t) {
    n <- factor_names(t)

    predicted <-              rep(as.logical(n[1]), t[1, 1])
    actual    <-              rep(as.logical(n[1]), t[1, 1])

    predicted <- c(predicted, rep(as.logical(n[1]), t[1, 2]))
    actual    <- c(actual,    rep(as.logical(n[2]), t[1, 2]))

    predicted <- c(predicted, rep(as.logical(n[2]), t[2, 1]))
    actual    <- c(actual,    rep(as.logical(n[1]), t[2, 1]))

    predicted <- c(predicted, rep(as.logical(n[2]), t[2, 2]))
    actual    <- c(actual,    rep(as.logical(n[2]), t[2, 2]))

    # Randomize order while keeping predicted and actual aligned
    order     <- sample(1:length(predicted))
    predicted <- predicted[order]
    actual    <- actual[order]

    l <- list(predicted, actual)
    names(l) <- factors_list(t)
    l
}

## Creates and returns a confusion matrix in the same
## format as tables returned by the table function.
## Useful as input to the fake_inputs function (above).
make_table <- function(values) {
    dn <- list(c("FALSE", "TRUE"), c("FALSE", "TRUE"))
    names(dn) <- c("predicted", "actual")
    a <- t(array(values, dim = c(2, 2), dimnames = dn))
    class(a) <- "table"
    a
}
