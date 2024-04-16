#' @title A function to export data frames to separate Google sheets
#'
#' @description This function exports a list of data frames into their own Google sheets. It can
#'   either create new Google sheets or write into pre-existing ones.
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
}
