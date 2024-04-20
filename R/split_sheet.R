#' @title Split a data frame based on one or more variables
#'
#' @description
#' This function returns a list of data frames that have been split from the original data frame
#' based on one or more variables(s).
#'
#' @export
# split_sheet <- function(sheet, keep = FALSE, ...) {
#   split_on <- list(...)
#   new_data <- split(sheet, split_on)
#   if (length(split_on) > 1 & keep == FALSE) {
#     combo <- sapply(new_data, nrow) > 0
#     warning(paste("Combination", names(new_data[-combo]), "has no observations. Empty data frame has been removed.\n"),
#             call. = FALSE)
#     new_data <- new_data[combo]
#   }
#   return(new_data)
# }

#######
split_sheet <- function(sheet, envir = .GlobalEnv, keep = FALSE, ...) {
  split_on <- list(...)

  # Ensure arguments are passed
  if (length(split_on) == 0) {
    stop("Please provide column names for splitting.")
  }

  # Create a single factor from all arguments assuming they are column names
  split_factor <- interaction(sheet[, unlist(split_on), drop = FALSE], drop = TRUE)

  # Split the data frame using the created factor
  new_data <- split(sheet, split_factor)

  # Remove empty data frames if 'keep' is FALSE
  new_data <- new_data[sapply(new_data, nrow) > 0]
  if (FALSE %in% (sapply(new_data, nrow) > 0)) {
    warning("Some combinations have no observations and have been removed.")
  }

  # Assign names to the list based on the unique values of the split factor
  if (is.null(names(new_data))) {
    names(new_data) <- levels(split_factor)
  }
  return(new_data)
}
