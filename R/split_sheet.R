#' @title Split a Data Frame into Groups
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
#' @param keep A logical vector of length one indicating whether to keep all data frames (`TRUE`) or
#'   discard data frames for groups where there are no observations, particularly if more than one
#'   variable is specified for splitting (TRUE).
#'
#' @return A list of data frames that have been split on one or more specified variables. The
#'   components are named after the categories they have been split on (as seen in the
#'   [`base::split`] method.)
#'
#' @examples
#' df <- data.frame (A = c("a", "a", "b", "b"),
#'                   B = c(1, 2, 2, 3),
#'                   C = c(TRUE, TRUE, TRUE, FALSE))
#' ## Don't keep data frames with no observations (ex: group formed by df$A == "a" and df$B == 3)
#' data_list <- split_sheet(df, df$A, df$B)
#'
#' ## Keep all data frames regardless of if they are empty.
#' data_list_2 <- split_sheet(df, df$A, df$B, keep = TRUE)
#'
#'
#' @export
split_sheet <- function(sheet, ..., keep = FALSE) {
  if (!is.data.frame(sheet)) {
    stop(paste("The sheet argument must be a data frame, not a",
               class(sheet)),
         call. = FALSE)
  }
  split_on <- list(...)
  new_data <- split(sheet, split_on)
  if (length(split_on) > 1 & keep == FALSE) {
    combo <- sapply(new_data, nrow) > 0
    warning(paste("Combination",
                  names(new_data[-combo]),
                  "has no observations. Empty data frame has been removed.\n"),
            call. = FALSE)
    new_data <- new_data[combo]
  }
  return(new_data)
}
