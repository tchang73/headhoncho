library(googlesheets4)
library(tibble)
tryCatch(googlesheets4::gs4_auth(cache = "../../.secrets", email = "*@smith.edu"),
         error = function(e) {
           gs4_deauth()
         }
)
test_that("export_data() writes to google sheets correctly", {
  skip_if(gs4_has_token() == FALSE)
  skip_if_offline()

  df1 <- tibble(a = c("a", "b", "c"),
                    b = c(1, 2, 3),
                    c = c(TRUE, FALSE, TRUE))
  df2 <- tibble(one = c("d", "e", "f"),
                    two = c(4, 5, 6),
                    three = c(FALSE, TRUE, FALSE))

  export_data(list(df1, df2),
  sheet_id = c("1_kSNg_P_AcLNCBhxud5MpF66ye9GGspeEmkOWepNm20",
               "1o0Waa1QYwTmEylyFvtM91CEM20iSPL2z2TbbLdgQ6kk"))

  expect_equal(read_google_sheet("1_kSNg_P_AcLNCBhxud5MpF66ye9GGspeEmkOWepNm20"),
               df1)

  expect_equal(read_google_sheet("1o0Waa1QYwTmEylyFvtM91CEM20iSPL2z2TbbLdgQ6kk"),
               df2)
})

test_that("export_data() returns a character vector", {
  skip_if(gs4_has_token() == FALSE)
  skip_if_offline()

  df1 <- tibble(a = c("a", "b", "c"),
                b = c(1, 2, 3),
                c = c(TRUE, FALSE, TRUE))
  df2 <- tibble(one = c("d", "e", "f"),
                two = c(4, 5, 6),
                three = c(FALSE, TRUE, FALSE))

  sheet_ids <- export_data(list(df1, df2),
                           sheet_id = c("1_kSNg_P_AcLNCBhxud5MpF66ye9GGspeEmkOWepNm20",
                                        "1o0Waa1QYwTmEylyFvtM91CEM20iSPL2z2TbbLdgQ6kk"))

  expect_equal(class(sheet_ids), "character")
})

