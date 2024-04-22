
<!-- README.md is generated from README.Rmd. Please edit that file -->

# headhoncho

<!-- badges: start -->
<!-- badges: end -->

The headhoncho package aims to help split one Google sheet into multiple
Google sheets based on one (or more) variables. Functions within the
package aim to make a smooth experience with the `googlesheets4` API.

## Installation

You can install the development version of headhoncho from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tchang73/headhoncho")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo tchang73/headhoncho@HEAD
#> rlang   (1.1.1 -> 1.1.3) [CRAN]
#> glue    (1.6.2 -> 1.7.0) [CRAN]
#> cli     (3.6.1 -> 3.6.2) [CRAN]
#> fansi   (1.0.5 -> 1.0.6) [CRAN]
#> openssl (2.1.1 -> 2.1.2) [CRAN]
#> Installing 5 packages: rlang, glue, cli, fansi, openssl
#> Installing packages into 'C:/Users/exmar/AppData/Local/Temp/RtmpKeJAfU/temp_libpath7c281a262ec9'
#> (as 'lib' is unspecified)
#> 
#>   There is a binary version available but the source version is later:
#>         binary source needs_compilation
#> openssl  2.1.1  2.1.2              TRUE
#> 
#> package 'rlang' successfully unpacked and MD5 sums checked
#> package 'glue' successfully unpacked and MD5 sums checked
#> package 'cli' successfully unpacked and MD5 sums checked
#> package 'fansi' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\exmar\AppData\Local\Temp\RtmpoDp1MV\downloaded_packages
#> installing the source package 'openssl'
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\exmar\AppData\Local\Temp\RtmpoDp1MV\remotes2ee835854342\tchang73-headhoncho-b33c859/DESCRIPTION' ...  ✔  checking for file 'C:\Users\exmar\AppData\Local\Temp\RtmpoDp1MV\remotes2ee835854342\tchang73-headhoncho-b33c859/DESCRIPTION' (393ms)
#>       ─  preparing 'headhoncho':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>       ─  building 'headhoncho_0.0.0.9000.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/exmar/AppData/Local/Temp/RtmpKeJAfU/temp_libpath7c281a262ec9'
#> (as 'lib' is unspecified)
```

## Example

The `headhoncho` package allows you to read a Google sheet into R, split
it based on specified variable(s), and export it into multiple,
separate, Google sheets. It is built on functionality from `tidyverse`’s
`googlesheets4` package. The general workflow looks like this:

<figure>
<img src="/man/figures/headhoncho_readme_graphic.jpg"
alt="Image depicting headhoncho package workflow" />
<figcaption aria-hidden="true">Image depicting headhoncho package
workflow</figcaption>
</figure>

``` r
library(headhoncho)

my_data <- pokeacademy_data

head(my_data)

split_data <- split_sheet(my_data, envir = .GlobalEnv, keep = FALSE, Hall, Room_Type)

print(split_data)

export_data(split_data)
```
