#' @title Split a Data Frame by Specified Variables
#'
#' @description
#' This function splits a data frame into a list of smaller data frames based on one or more
#' specified variables.
#'
#' @param sheet A data frame (generally read in from a Google sheet) to be split upon one or more
#'   specified variables.
#' @param ... The groups to be split on. Generally, column names in the `data_frame$variable`
#'   format. When more than one group is provided, the data frame is split on their interaction
#'   (i.e. split into groups resulting from each combination of values of the groups/variables being
#'   split on).
#' @param keep A logical vector of length one indicating whether to keep all data frames (if TRUE) or
#'   discard data frames for groups where there are no observations (if FALSE), particularly if more than one
#'   variable is specified for splitting.
#'
#' @return A list of data frames that have been split on one or more specified variables. The
#'   components are named after the categories they have been split on (as seen in the
#'   [`base::split`] method.)
#'
#' @examples
#' \dontrun{
#'   df <- data.frame (A = c("a", "a", "b", "b"),
#'                     B = c(1, 2, 2, 3),
#'                     C = c(TRUE, TRUE, TRUE, FALSE))
#'   ## Don't keep data frames with no observations (ex: group formed by df$A == "a" and df$B == 3)
#'   data_list <- split_sheet(df, df$A, df$B)
#'
#'   ## Keep all data frames regardless of if they are empty.
#'   data_list_2 <- split_sheet(df, df$A, df$B, keep = TRUE)
#' }
#'
#' @export
split_sheet <- function(sheet, ..., keep = FALSE) {
  split_on <- list(...)
  # Ensure arguments are passed
  if (length(split_on) == 0) {
    stop("Please provide column names for splitting.")
  }
  # Create a single factor from all arguments assuming they are column names
  # split_factor <- interaction(sheet[unlist(split_on), drop = FALSE], drop = TRUE)
  # Split the data frame using the list of specified variable(s)
  new_data <- split(sheet, split_on)
  # Getting rid of empty data frames if keep is set to FALSE.
  if (keep == FALSE) {
    # Finding the indices of non-empty data frames
    combo <- sapply(new_data, nrow) > 0
    # If there are empty data frames, warning the user that they have been removed.
    if (FALSE %in% combo) {
      warning(paste("Combination",
                    names(new_data[-combo]),
                    "has no observations. Empty data frame has been removed.\n"),
              call. = FALSE)
    }
    # Subsetting the data
    new_data <- new_data[sapply(new_data, nrow) > 0]
  }
  # Assign names to the list based on the unique values of the split factor if names do not already
  # exist
  # if (is.null(names(new_data))) {
  #   names(new_data) <- levels(split_factor)
  # }
  # Returning the list of data frames.
  return(new_data)
}
#######
# split_sheet <- function(sheet, envir = .GlobalEnv, keep = FALSE, ...) {
#   split_on <- list(...)
#
#   # Ensure arguments are passed
#   if (length(split_on) == 0) {
#     stop("Please provide column names for splitting.")
#   }
#
#   # Create a single factor from all arguments assuming they are column names
#   split_factor <- interaction(sheet[, unlist(split_on), drop = FALSE], drop = TRUE)
#
#   # Split the data frame using the created factor
#   new_data <- split(sheet, split_factor)
#
#   # Remove empty data frames if 'keep' is FALSE
#   new_data <- new_data[sapply(new_data, nrow) > 0]
#   if (FALSE %in% (sapply(new_data, nrow) > 0)) {
#     warning("Some combinations have no observations and have been removed.")
#   }
#
#   # Assign names to the list based on the unique values of the split factor
#   if (is.null(names(new_data))) {
#     names(new_data) <- levels(split_factor)
#   }
#   return(new_data)
# }
######
