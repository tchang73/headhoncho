## code to prepare `pokeacademy_data` dataset goes here
pokeacademy_data <- read.csv("pokeacademy_data.csv")
usethis::use_data(pokeacademy_data, overwrite = TRUE)
