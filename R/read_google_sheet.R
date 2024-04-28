#' @title A function to read a Google Sheet by ID
#'
#' @description This function accesses a Google Sheet using the provided ID, and reads its contents. It requires the user to have appropriate permissions to view the Google Sheet.

#' @param sheet_url A string containing the id of the Google Sheet to be accessed. The ID should be in the standard format provided in the Google Sheets browser address bar. It can be provided via a URL, or anything else accepted by the [`read_sheet`] function.
#'
#' @return Returns a tibble containing the contents of the Google Sheet if successful. If the function encounters an error while accessing or reading the sheet, it returns NULL and prints an error message to the console.
#' @importFrom googlesheets4 read_sheet gs4_auth
#'
#' @examples
#' \dontrun{
#'   sheet_url <- "https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID_HERE/edit"
#'   data <- read_google_sheet(sheet_url)
#' }
#' @export
read_google_sheet <- function(sheet_url) {
  # Try to access the Google Sheet
  sheet <- tryCatch({
    # Access the sheet using its URL
    googlesheets4::read_sheet(ss = sheet_url)},
    error = function(e) {
      cat("Error accessing Google Sheet: ", e$message, "\n")
      NULL  # Return NULL on error
    }
  )

  # If the sheet is accessed successfully, read its contents
  if (!is.null(sheet)) {
    cat("Access to Google Sheet successful! Reading contents...\n")

    return(sheet)  # Return the extracted data
  } else {
    cat("Failed to access Google Sheet. Check the URL or authentication.\n")
  }
}

