% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_google_sheet.R
\name{read_google_sheet}
\alias{read_google_sheet}
\title{A function to read a Google Sheet by ID}
\usage{
read_google_sheet(sheet_url)
}
\arguments{
\item{sheet_url}{A string containing the id of the Google Sheet to be accessed. The ID should be in the standard format provided in the Google Sheets browser address bar. It can be provided via a URL, or anything else accepted by the \code{\link{read_sheet}} function.}
}
\value{
Returns a tibble containing the contents of the Google Sheet if successful. If the function encounters an error while accessing or reading the sheet, it returns NULL and prints an error message to the console.
}
\description{
This function accesses a Google Sheet using the provided ID, and reads its contents. It requires the user to have appropriate permissions to view the Google Sheet.
}
\examples{
\dontrun{
  sheet_url <- "https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID_HERE/edit"
  data <- read_google_sheet(sheet_url)
}
}
