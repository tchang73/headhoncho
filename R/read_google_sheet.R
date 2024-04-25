#' @title A function to read a Google Sheet by URL
#'
#' This function authenticates the user, if not already authenticated, accesses a Google Sheet using the provided URL, and reads its contents. It requires the user to have appropriate permissions to view the Google Sheet.

#' @param sheet_url A string containing the URL of the Google Sheet to be accessed. The URL should be in the standard format provided in the Google Sheets browser address bar.
#'
#' @return A data frame containing the contents of the Google Sheet if successful. If the function encounters an error while accessing or reading the sheet, it returns `NULL` and prints an error message to the console.
#'
#' @importFrom googlesheets4 read_sheet gs4_auth
#'
#' @examples
#' \dontrun{
#'   sheet_url <- "https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID_HERE/edit"
#'   data <- read_google_sheet(sheet_url)
#'   if (!is.null(data)) {
#'     print(data)
#'   } else {
#'     cat("Failed to read data from Google Sheet.\n")
#'   }
#' }
#' @export

# Function to authenticate and access a Google Sheet
access_google_sheet_by_url <- function(sheet_url) {
  # Attempt to authenticate using any available cached token
  # If no token is available, this will prompt the user to authenticate via browser
  googlesheets4::gs4_auth(cache = TRUE)

  # Try to access the Google Sheet to verify if authentication is successful
  sheet <- tryCatch({
    googlesheets4::gs4_get(ss = sheet_url)
    error = function(e) {
      cat("Error accessing Google Sheet: ", e$message, "\n")
      NULL  # Return NULL on error
    }
  })

  if (!is.null(sheet)) {
    cat("Access to Google Sheet successful!\n")
    return(sheet)  # Return the sheet object
  } else {
    cat("Failed to access Google Sheet. Check the URL or authentication.\n")
  }
}

#######

# Function to authenticate, access, and read contents of a Google Sheet by URL
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

