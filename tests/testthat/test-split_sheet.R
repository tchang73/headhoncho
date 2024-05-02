test_df <- data.frame(
  Group = c("A", "A", "B", "B"),
  Subgroup = c(1, 2, 1, 2),
  Value = c(10, 20, 30, 40)
)

test_that("split_sheet()'s basic functionality", {
  # Using split_sheet to split by 'Group'
  result <- split_sheet(test_df, test_df$Group)
  # Expect that the list has two elements
  expect_length(result, 2)
  # Expect that the names of the list are the unique values of Group
  expect_equal(names(result), unique(test_df$Group))
})

test_that("split_sheet() works with multiple grouping variables", {
  # Using split_sheet to split by 'Group' and 'Subgroup'
  result <- split_sheet(test_df, test_df$Group, test_df$Subgroup)

  # Expect that the list has four elements (two groups, each with two subgroups)
  expect_equal(length(result), 4, info = "There should be four groups resulting from splitting by 'Group' and 'Subgroup'.")
})
