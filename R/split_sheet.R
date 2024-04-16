#' @title Split a data frame based on one or more variables
#'
#' @description
#' This function returns a list of data frames that have been split from the original data frame
#' based on one or more variables(s).
#'
#' @export
split_sheet <- function(sheet, keep = FALSE, ...) {
  split_on <- list(...)
  new_data <- split(sheet, split_on)
  if (length(split_on) > 1 & keep == FALSE) {
    combo <- sapply(new_data, nrow) > 0
    warning(paste("Combination", names(new_data[-combo]), "has no observations. Empty data frame has been removed.\n"),
            call. = FALSE)
    new_data <- new_data[combo]
  }
  return(new_data)
}
