#' Access a Google Sheet
#'
#' This function accesses a Google Sheet for reading or further manipulation
#' based on the provided Google Sheets URL.
#' @param sheet_url A string containing the URL of the Google Sheet to be accessed. The URL should be in the standard format provided in the Google Sheets browser address bar.
#'
#' @return Returns a tibble containing the contents of the Google Sheet if successful. If the function encounters an error while accessing or reading the sheet, it returns NULL and prints an error message to the console.
#' @importFrom googlesheets4 read_sheet gs4_auth
#' @export
read_google_sheet <- function(sheet_url) {
  # Ensure authentication; prompt in browser if not already authenticated
  googlesheets4::gs4_auth(cache = TRUE)

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

    # Print and return the extracted data
    print(sheet)
    return(sheet)  # Return the extracted data
  } else {
    cat("Failed to access Google Sheet. Check the URL or authentication.\n")
  }
}

