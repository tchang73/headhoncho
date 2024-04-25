#' @title A function to export data frames to separate Google sheets
#'
#' @description This function exports a list of data frames into their own Google sheets. It can
#'   either create new Google sheets or write into pre-existing ones.
#'
#' @param data_list A list of data frames to be exported to separate Google sheets.
#' @param sheet_id A vector of existing Google sheet ids, urls to extract sheet ids from or
#'   `googlesheets4` ss objects. Alternatively, "create" in order to write new Google sheets.
#' @param names A vector with the same length as data_list which exported Google sheets will be
#'   named with. Can be `NULL`, in which case the names will be "Untitled_Sheet_i" where `i` is the
#'   numeric index in the list of the data frame being exported.
#' @param sheet_num A numeric value representing the worksheet within the larger Google sheet that
#'   will be written to.
#'
#' @return A character vector of sheet IDs that the function has exported data to. This will be the
#'   input if the data was exported to an existing Google sheet and the new sheet IDs if the data
#'   was exported to new Google sheets.
#'
#' @examples
#' df1 <- data.frame(A = c("a", "a", "b", "b"),
#'                   B = c(1, 2, 2, 3),
#'                   C = c(TRUE, TRUE, TRUE, FALSE))
#' df2 <- data.frame(A = c("a", "a", "b", "b"),
#'                   B = c(1, 2, 2, 3),
#'                   C = c(TRUE, TRUE, TRUE, FALSE))
#' df_list <- list(df1, df2)
#'
#' # Export data to existing Google sheets
#' export_data(df_list, sheet_id = c("export data demo 1", "export data demo 2"))
#'
#' # Export data to new Google sheets
#' export_data(df_list, names = c("Demo_Sheet_1", "Demo_Sheet_2"))
#'
#'
#' @importFrom googlesheets4 sheet_write
#' @importFrom googlesheets4 gs4_create
#'
#' @export
export_data <- function(data_list,
                        sheet_id = "create",
                        names = NULL,
                        sheet_num = 1) {
  state <- "write"
  if (sheet_id[1] == "create") {
    state <- "create"
    if (is.null(names)) {
      names <- paste0("Untitled_Sheet_", seq_along(data_list))
    }
    if (length(data_list) != length(names)) {
      stop(paste("There must be an equal number of data frames and spreadsheet names.
           Instead, there are",
           length(data_list),
           "data frames and",
           length(sheet_names),
           "sheet names"),
           call. = FALSE)
    }
    sheet_id <- vector(mode = "character", length = length(data_list))
    for (i in seq_along(data_list)) {
      ss <- googlesheets4::gs4_create(name = names[i])
      sheet_id[i] <- ss
    }
  }
  for (i in seq_along(data_list)) {
    googlesheets4::sheet_write(data = as.data.frame(data_list[i]),
                               ss = sheet_id[i],
                               sheet = sheet_num)
  }
  return(sheet_id)
}
