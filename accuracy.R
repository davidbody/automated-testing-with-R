## Compute accuracy measures from predicted and actual
## binary classification values. Parameters `predicted`
## and `actual` are vectors of logical (T/F) values.

accuracy_measures <- function(predicted, actual) {

    confusion_matrix <- t(table(predicted, actual))

    TN <- confusion_matrix[1, 1]
    FP <- confusion_matrix[1, 2]
    FN <- confusion_matrix[2, 1]
    TP <- confusion_matrix[2, 2]

    accuracy    <- (TN + TP) / (TN + FP + FN + TP)
    precision   <- TP / (TP + FP)
    recall      <- TP / (TP + FN)
    sensitivity <- TP / (TP + FN)
    specificity <- TN / (TN + FP)
    F1          <- (2 * precision * recall) / (precision + recall)

    list(confusion_matrix = confusion_matrix,
         accuracy         = accuracy,
         precision        = precision,
         recall           = recall,
         sensitivity      = sensitivity,
         specificity      = specificity,
         F1               = F1)
}
