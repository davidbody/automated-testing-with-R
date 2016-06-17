factor_lists <- function(t) {
    names(attr(t, "dimnames"))
}

factor_names <- function(t) {
    attr(t, "dimnames")[[1]]
}

inputs <- function(t) {
    n <- factor_names(t)

    predicted <-              rep(as.logical(n[1]), t[1, 1])
    actual    <-              rep(as.logical(n[1]), t[1, 1])

    predicted <- c(predicted, rep(as.logical(n[1]), t[1, 2]))
    actual    <- c(actual,    rep(as.logical(n[2]), t[1, 2]))

    predicted <- c(predicted, rep(as.logical(n[2]), t[2, 1]))
    actual    <- c(actual,    rep(as.logical(n[1]), t[2, 1]))

    predicted <- c(predicted, rep(as.logical(n[2]), t[2, 2]))
    actual    <- c(actual,    rep(as.logical(n[2]), t[2, 2]))

    l <- list(predicted, actual)
    names(l) <- factor_lists(t)
    l
}

make_table <- function(values) {
    dn <- list(c("FALSE", "TRUE"), c("FALSE", "TRUE"))
    names(dn) <- c("predicted", "actual")
    a <- t(array(values, dim = c(2, 2), dimnames = dn))
    class(a) <- "table"
    a
}
