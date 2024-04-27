library(googlesheets4)
test_that("The correct message and value are returned when there's an error in read_google_sheet().", {
  # Checking that a null value is returned on error.
  expect_null(read_google_sheet("hi"))
  # Checking for the correct error message being printed to the console.
  expect_output(
    read_google_sheet("hi"),
    "Error accessing Google Sheet:  Client error: \\(404\\) NOT_FOUND \\nFailed to access Google Sheet\\. Check the URL or authentication\\."
    )
})

test_that("read_google_sheet() returns an object with the correct structure", {
  # Indicating to the Google sheets 4 api that we don't need authorization (using public sheet)
  gs4_deauth()
  # Output should be of type "list"
  expect_type(
    read_google_sheet("1HO3e_VCqdbyRGbKOgzt57aLLlhVCP7YQGmy411tqGNc"),
    "list")
  # Output should be of classes "tbl_df", "tbl", and "data.frame".
  expect_equal(class(read_google_sheet("1HO3e_VCqdbyRGbKOgzt57aLLlhVCP7YQGmy411tqGNc")),
               c("tbl_df", "tbl", "data.frame")
    )
  # Output should have dimensions [599, 9]. This is what the actual google sheet's dimensions are.
  expect_equal(dim(read_google_sheet("1HO3e_VCqdbyRGbKOgzt57aLLlhVCP7YQGmy411tqGNc")),
               c(599, 9))
})
