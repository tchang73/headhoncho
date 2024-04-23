
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
```

## General workflow

The `headhoncho` package allows you to read a Google sheet into R, split
it based on specified variable(s), and export it into multiple,
separate, Google sheets. It is built on functionality from `tidyverse`’s
`googlesheets4` package. The general workflow looks like this:

![Graphic of headhoncho package
workflow](man/figures/README-workflow_graphic.jpg) \## Loading in the
package

Like most R packages, it is best to load the `headhoncho` package in
with the `library()` function.

``` r
library(headhoncho)
```

## Reading in sheets

The `login_function` can be used to read in data from a URL. It will
also check for read and write authentication for a Google account.

``` r
login_function("https://docs.google.com/spreadsheets/d/1U6Cf_qEOhiR9AZqTqS3mbMF3zt2db48ZP5v3rkrAEJY/edit#gid=780868077")
```

## Splitting data

The `split_data` function splits a data frame into a list of smaller
data frames based on groupings from given variable(s). The provided
`pokeacademy_data` data set will be used to demonstrate. We’ll split on
two variables to show the functionality.

``` r
head(pokeacademy_data)
#>   Last_Name First_Name   Student_Type           Hall Room Room_Type
#> 1     Hardy  Rosalinda Ent First Year   Togepi House  508 Quadruple
#> 2    Pierce    Christa Ent First Year Squirtle House  209    Single
#> 3   Patrick  Heriberto Ent First Year    Ho-Oh House  306 Quadruple
#> 4     Mason     Stefan Ent First Year  Umbreon House  212    Triple
#> 5     Booth       Mike Ent First Year   Gengar House  302    Triple
#> 6  Mitchell     Janice Ent First Year  Bayleef House  212    Single
#>   Citizenship_DESC        DOB                     Email
#> 1         Domestic  6/15/1994    rhardy@pokéacademy.edu
#> 2         Domestic  8/10/2001   cpierce@pokéacademy.edu
#> 3         Domestic   3/6/1993  hpatrick@pokéacademy.edu
#> 4         Domestic   6/9/1994    smason@pokéacademy.edu
#> 5         Domestic 10/30/2003    mbooth@pokéacademy.edu
#> 6         Domestic 11/20/2006 jmitchell@pokéacademy.edu

split_data <- split_sheet(pokeacademy_data, pokeacademy_data$Hall, pokeacademy_data$Student_Type)
#> Warning: Combination Bayleef House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Bulbasaur House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Caterpie House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Charmander House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Clefairy House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Cubone House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Cyndaquil House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Ditto House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Farfetch'd House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Gengar House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Ho-Oh House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Ivysaur House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Leafeon House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Lickitung House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Luxio House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Mew House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Moltres House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Mudkip House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Muk House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Oddish House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Pidgey House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Pikachu Hall.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Piplup House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Raichu House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Regice House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Rowlet House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Spoink House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Squirtle House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Sylveon House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Togepi House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Torterra House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Umbreon House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Vulpix House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Wailord House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Zapdos House.Ent First Year has no observations. Empty data frame has been removed.
#> Combination Articuno House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Bayleef House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Bulbasaur House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Caterpie House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Charmander House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Clefairy House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Cubone House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Cyndaquil House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Ditto House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Farfetch'd House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Gengar House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Ho-Oh House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Ivysaur House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Leafeon House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Lickitung House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Luxio House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Mew House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Moltres House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Mudkip House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Muk House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Oddish House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Pidgey House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Pikachu Hall.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Piplup House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Raichu House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Regice House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Rowlet House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Spoink House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Squirtle House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Sylveon House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Togepi House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Torterra House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Umbreon House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Vulpix House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Wailord House.Ent Transfer has no observations. Empty data frame has been removed.
#> Combination Zapdos House.Ent Transfer has no observations. Empty data frame has been removed.

print(split_data)
#> $`Articuno House.Ent First Year`
#>      Last_Name First_Name   Student_Type           Hall Room Room_Type
#> 42      Joseph      Diana Ent First Year Articuno House  412 Quadruple
#> 54   Singleton    Treyvon Ent First Year Articuno House  211    Single
#> 63     Acevedo      Byron Ent First Year Articuno House  204    Double
#> 150   Morrison      Brian Ent First Year Articuno House  510    Triple
#> 184   Callahan      Amina Ent First Year Articuno House  303    Double
#> 188 Stephenson      Fiona Ent First Year Articuno House  402    Double
#> 237       Lamb     Nestor Ent First Year Articuno House  312 Quadruple
#> 287     Rivers     Melvin Ent First Year Articuno House  105    Triple
#> 291     Conway     Gianni Ent First Year Articuno House  301    Triple
#> 333       Cruz      Ellen Ent First Year Articuno House  404 Quadruple
#> 361    Fleming       Reid Ent First Year Articuno House  407    Double
#> 403      Moody       Joel Ent First Year Articuno House  407    Triple
#> 458     Dudley    Kameron Ent First Year Articuno House  213    Double
#> 483        Liu     Hailey Ent First Year Articuno House  407    Triple
#> 497   Bradshaw      Scott Ent First Year Articuno House  509    Triple
#> 498      Yates       Emma Ent First Year Articuno House  102    Single
#> 556    Holland    Braiden Ent First Year Articuno House  409 Quadruple
#>     Citizenship_DESC        DOB                       Email
#> 42          Domestic   6/5/1996     djoseph@pokéacademy.edu
#> 54          Domestic  1/31/2002  tsingleton@pokéacademy.edu
#> 63          Domestic 11/28/1991    bacevedo@pokéacademy.edu
#> 150    International  3/30/2003   bmorrison@pokéacademy.edu
#> 184    International  1/11/2002   acallahan@pokéacademy.edu
#> 188         Domestic  3/26/2006 fstephenson@pokéacademy.edu
#> 237         Domestic   6/7/1996       nlamb@pokéacademy.edu
#> 287         Domestic  2/26/2005     mrivers@pokéacademy.edu
#> 291         Domestic  9/24/2003     gconway@pokéacademy.edu
#> 333         Domestic 11/17/1997       ecruz@pokéacademy.edu
#> 361         Domestic  2/22/2002    rfleming@pokéacademy.edu
#> 403    International   8/6/1992      jmoody@pokéacademy.edu
#> 458         Domestic   2/6/2000     kdudley@pokéacademy.edu
#> 483         Domestic 12/31/1992        hliu@pokéacademy.edu
#> 497    International  8/18/1996   sbradshaw@pokéacademy.edu
#> 498         Domestic 11/29/1996      eyates@pokéacademy.edu
#> 556         Domestic   7/5/1999    bholland@pokéacademy.edu
#> 
#> $`Bayleef House.Ent First Year`
#>      Last_Name First_Name   Student_Type          Hall Room Room_Type
#> 6     Mitchell     Janice Ent First Year Bayleef House  212    Single
#> 17  Hutchinson    Dashawn Ent First Year Bayleef House  415    Single
#> 34        Cain      Daisy Ent First Year Bayleef House  103 Quadruple
#> 89      Hurley      Anita Ent First Year Bayleef House  103    Double
#> 92    Mcintyre      Craig Ent First Year Bayleef House  206    Single
#> 104      Moses      Kaela Ent First Year Bayleef House  216 Quadruple
#> 112     Rangel      Uriel Ent First Year Bayleef House  307    Triple
#> 154  Christian    Annette Ent First Year Bayleef House  312    Triple
#> 163      Stout     Travis Ent First Year Bayleef House  502    Double
#> 241    Whitney      Perry Ent First Year Bayleef House  110    Double
#> 260    Proctor     Vernon Ent First Year Bayleef House  307 Quadruple
#> 285    Watkins     Dontae Ent First Year Bayleef House  109    Double
#> 305      Perry    Melinda Ent First Year Bayleef House  104    Triple
#> 336      Smith       Aldo Ent First Year Bayleef House  312    Triple
#> 340     Norman      Helen Ent First Year Bayleef House  104    Single
#> 454       Park     Alanna Ent First Year Bayleef House  509    Single
#> 493    Gilbert     Lawson Ent First Year Bayleef House  102    Triple
#> 512    Nielsen      Skyla Ent First Year Bayleef House  503    Double
#> 550     Hoover     Hassan Ent First Year Bayleef House  307    Single
#> 554     Kramer       Jane Ent First Year Bayleef House  308 Quadruple
#> 578      Grant      Kevon Ent First Year Bayleef House  410    Double
#>     Citizenship_DESC        DOB                       Email
#> 6           Domestic 11/20/2006   jmitchell@pokéacademy.edu
#> 17          Domestic   5/3/1998 dhutchinson@pokéacademy.edu
#> 34          Domestic  9/24/2005       dcain@pokéacademy.edu
#> 89          Domestic  6/15/1998     ahurley@pokéacademy.edu
#> 92          Domestic 10/29/2001   cmcintyre@pokéacademy.edu
#> 104         Domestic   1/2/2000      kmoses@pokéacademy.edu
#> 112    International   5/4/2001     urangel@pokéacademy.edu
#> 154         Domestic  12/8/1994  achristian@pokéacademy.edu
#> 163         Domestic   8/1/1991      tstout@pokéacademy.edu
#> 241         Domestic   6/7/2002    pwhitney@pokéacademy.edu
#> 260         Domestic  1/10/1990    vproctor@pokéacademy.edu
#> 285    International  4/21/1991    dwatkins@pokéacademy.edu
#> 305         Domestic   4/3/2002      mperry@pokéacademy.edu
#> 336         Domestic 12/24/1994      asmith@pokéacademy.edu
#> 340         Domestic   8/6/1998     hnorman@pokéacademy.edu
#> 454         Domestic 10/22/1993       apark@pokéacademy.edu
#> 493         Domestic  7/15/1996    lgilbert@pokéacademy.edu
#> 512         Domestic   8/8/2004    snielsen@pokéacademy.edu
#> 550         Domestic 11/23/2005     hhoover@pokéacademy.edu
#> 554         Domestic   9/2/1996     jkramer@pokéacademy.edu
#> 578         Domestic   3/6/2005      kgrant@pokéacademy.edu
#> 
#> $`Bulbasaur House.Ent First Year`
#>     Last_Name First_Name   Student_Type            Hall Room Room_Type
#> 43   Woodward     Gloria Ent First Year Bulbasaur House  501    Single
#> 46     Torres     Reagan Ent First Year Bulbasaur House  412 Quadruple
#> 70       Kidd      Edwin Ent First Year Bulbasaur House  203 Quadruple
#> 99     Parker  Nathanial Ent First Year Bulbasaur House  501    Single
#> 120    Maddox       Joan Ent First Year Bulbasaur House  509    Triple
#> 147    Massey      Kavon Ent First Year Bulbasaur House  303    Double
#> 205     Heath      Kiley Ent First Year Bulbasaur House  305    Triple
#> 229  Espinoza   Katarina Ent First Year Bulbasaur House  216    Single
#> 252   Mahoney     Johnny Ent First Year Bulbasaur House  201    Triple
#> 253   Maxwell    Micaela Ent First Year Bulbasaur House  214    Double
#> 315      Best    Branson Ent First Year Bulbasaur House  302    Triple
#> 396     Cross    Dewayne Ent First Year Bulbasaur House  308 Quadruple
#> 584     Lopez      Perla Ent First Year Bulbasaur House  110    Triple
#> 593    Greene      Deion Ent First Year Bulbasaur House  501    Triple
#>     Citizenship_DESC        DOB                     Email
#> 43          Domestic  5/13/2000 gwoodward@pokéacademy.edu
#> 46          Domestic  12/7/1999   rtorres@pokéacademy.edu
#> 70          Domestic   6/8/2002     ekidd@pokéacademy.edu
#> 99          Domestic 10/29/1997   nparker@pokéacademy.edu
#> 120    International 12/15/2002   jmaddox@pokéacademy.edu
#> 147         Domestic  6/29/2001   kmassey@pokéacademy.edu
#> 205         Domestic  12/8/2002    kheath@pokéacademy.edu
#> 229    International  3/15/1990 kespinoza@pokéacademy.edu
#> 252         Domestic  8/21/2004  jmahoney@pokéacademy.edu
#> 253         Domestic  3/28/1990  mmaxwell@pokéacademy.edu
#> 315         Domestic  12/9/2000     bbest@pokéacademy.edu
#> 396    International  12/5/2005    dcross@pokéacademy.edu
#> 584         Domestic  4/16/1999    plopez@pokéacademy.edu
#> 593         Domestic  5/23/1996   dgreene@pokéacademy.edu
#> 
#> $`Caterpie House.Ent First Year`
#>     Last_Name  First_Name   Student_Type           Hall Room Room_Type
#> 11     Harris      Justin Ent First Year Caterpie House  411    Single
#> 31       Luna      Fabian Ent First Year Caterpie House  502    Single
#> 36   Marshall        Erik Ent First Year Caterpie House  306 Quadruple
#> 71       Koch      Kelsie Ent First Year Caterpie House  207    Double
#> 75      Myers       Ramon Ent First Year Caterpie House  109 Quadruple
#> 186    Tanner      Alyssa Ent First Year Caterpie House  102    Triple
#> 212 Blackburn      Tyrell Ent First Year Caterpie House  109    Single
#> 258    Lester Christopher Ent First Year Caterpie House  301    Triple
#> 274     Avila     Donavan Ent First Year Caterpie House  204    Double
#> 385 Maldonado       Oscar Ent First Year Caterpie House  413    Single
#> 467  Carrillo   Kristofer Ent First Year Caterpie House  403 Quadruple
#> 509  Benjamin     Malcolm Ent First Year Caterpie House  511    Single
#> 573    Harper     Emerald Ent First Year Caterpie House  508 Quadruple
#> 583      Peck       Sally Ent First Year Caterpie House  309    Single
#>     Citizenship_DESC        DOB                      Email
#> 11          Domestic 11/22/1991    jharris@pokéacademy.edu
#> 31     International  9/11/1991      fluna@pokéacademy.edu
#> 36     International  3/11/2003  emarshall@pokéacademy.edu
#> 71          Domestic  1/27/1993      kkoch@pokéacademy.edu
#> 75          Domestic  8/12/2001     rmyers@pokéacademy.edu
#> 186    International  9/29/2001    atanner@pokéacademy.edu
#> 212         Domestic  4/22/2001 tblackburn@pokéacademy.edu
#> 258         Domestic  6/24/1994    clester@pokéacademy.edu
#> 274         Domestic   8/6/2004     davila@pokéacademy.edu
#> 385         Domestic   7/3/1994 omaldonado@pokéacademy.edu
#> 467    International  7/11/1999  kcarrillo@pokéacademy.edu
#> 509         Domestic  8/14/2003  mbenjamin@pokéacademy.edu
#> 573         Domestic   8/2/1998    eharper@pokéacademy.edu
#> 583         Domestic  2/21/2003      speck@pokéacademy.edu
#> 
#> $`Charmander House.Ent First Year`
#>     Last_Name First_Name   Student_Type             Hall Room Room_Type
#> 62     Becker     Reanna Ent First Year Charmander House  302    Single
#> 158     Davis     Gordon Ent First Year Charmander House  502    Triple
#> 174     House     Gloria Ent First Year Charmander House  206    Single
#> 183    Haynes     Isaias Ent First Year Charmander House  107    Single
#> 195    Mooney  Remington Ent First Year Charmander House  302    Double
#> 203     Boone        Nia Ent First Year Charmander House  106    Triple
#> 254     Bryan     Steven Ent First Year Charmander House  306    Single
#> 269   Vasquez    Demarco Ent First Year Charmander House  505    Double
#> 322  Bradford      Barry Ent First Year Charmander House  205    Triple
#> 398    Stokes  Valentina Ent First Year Charmander House  309    Double
#> 416   Salazar    Chasity Ent First Year Charmander House  109    Triple
#> 425   Cochran   Kasandra Ent First Year Charmander House  104    Triple
#> 427      Wolf      Tomas Ent First Year Charmander House  302    Double
#> 489     Banks      Lloyd Ent First Year Charmander House  104    Single
#> 494     Pratt    Katlynn Ent First Year Charmander House  309    Triple
#> 519   Skinner     Austyn Ent First Year Charmander House  511    Double
#>     Citizenship_DESC       DOB                     Email
#> 62          Domestic 9/15/1990   rbecker@pokéacademy.edu
#> 158    International 9/27/2001    gdavis@pokéacademy.edu
#> 174         Domestic 2/14/1999    ghouse@pokéacademy.edu
#> 183         Domestic 3/25/2002   ihaynes@pokéacademy.edu
#> 195    International 4/28/1994   rmooney@pokéacademy.edu
#> 203         Domestic 2/18/2005    nboone@pokéacademy.edu
#> 254         Domestic 10/6/1999    sbryan@pokéacademy.edu
#> 269         Domestic  9/1/1997  dvasquez@pokéacademy.edu
#> 322    International 8/17/1992 bbradford@pokéacademy.edu
#> 398         Domestic 5/22/1990   vstokes@pokéacademy.edu
#> 416         Domestic 1/25/2001  csalazar@pokéacademy.edu
#> 425    International 2/10/2003  kcochran@pokéacademy.edu
#> 427         Domestic  5/1/2003     twolf@pokéacademy.edu
#> 489         Domestic  1/3/1992    lbanks@pokéacademy.edu
#> 494    International  1/2/1996    kpratt@pokéacademy.edu
#> 519    International 9/19/2000  askinner@pokéacademy.edu
#> 
#> $`Clefairy House.Ent First Year`
#>     Last_Name First_Name   Student_Type           Hall Room Room_Type
#> 49    Cochran       Luis Ent First Year Clefairy House  303    Double
#> 69      Arias    Darrius Ent First Year Clefairy House  302    Single
#> 175  Franklin      Devyn Ent First Year Clefairy House  412    Single
#> 214     Patel    Devante Ent First Year Clefairy House  306    Triple
#> 235     Avery    Desiree Ent First Year Clefairy House  407    Triple
#> 238    Jarvis      Tevin Ent First Year Clefairy House  203    Double
#> 319      Ross     Aubree Ent First Year Clefairy House  302    Single
#> 351  Espinoza   Giovanni Ent First Year Clefairy House  416 Quadruple
#> 468      Vega     Ismael Ent First Year Clefairy House  414    Single
#> 544    Brewer    Malcolm Ent First Year Clefairy House  204    Double
#>     Citizenship_DESC        DOB                     Email
#> 49     International   1/7/2004  lcochran@pokéacademy.edu
#> 69     International 10/26/1999    darias@pokéacademy.edu
#> 175         Domestic  2/17/2006 dfranklin@pokéacademy.edu
#> 214         Domestic 11/22/1990    dpatel@pokéacademy.edu
#> 235         Domestic  2/16/1996    davery@pokéacademy.edu
#> 238         Domestic 10/17/2004   tjarvis@pokéacademy.edu
#> 319         Domestic   1/9/1994     aross@pokéacademy.edu
#> 351         Domestic   9/5/2002 gespinoza@pokéacademy.edu
#> 468         Domestic  3/20/2004     ivega@pokéacademy.edu
#> 544         Domestic   2/2/2004   mbrewer@pokéacademy.edu
#> 
#> $`Cubone House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 12      Boyer    Mckenna Ent First Year Cubone House  313    Triple
#> 24        Day     Jaiden Ent First Year Cubone House  509    Double
#> 157   Benitez    Shirley Ent First Year Cubone House  205    Single
#> 277     Riley     Chanel Ent First Year Cubone House  406    Triple
#> 309  Mcintosh     Melody Ent First Year Cubone House  110    Double
#> 328 Schneider     Meagan Ent First Year Cubone House  402 Quadruple
#> 341    Monroe     Haylie Ent First Year Cubone House  308    Double
#> 381       Lee    Jessica Ent First Year Cubone House  414    Triple
#> 405    Conley     Darion Ent First Year Cubone House  107    Single
#> 413      Luna      Sonia Ent First Year Cubone House  508 Quadruple
#> 470  Fletcher       Kian Ent First Year Cubone House  416    Single
#> 504     Petty     Adolfo Ent First Year Cubone House  202    Triple
#> 518  Chambers    Emerson Ent First Year Cubone House  104    Double
#> 533     Horne       Kobe Ent First Year Cubone House  106    Double
#>     Citizenship_DESC        DOB                      Email
#> 12          Domestic 10/12/1999     mboyer@pokéacademy.edu
#> 24          Domestic  5/19/1991       jday@pokéacademy.edu
#> 157    International   9/6/1997   sbenitez@pokéacademy.edu
#> 277         Domestic 12/25/1992     criley@pokéacademy.edu
#> 309         Domestic  3/22/2006  mmcintosh@pokéacademy.edu
#> 328    International   8/2/2002 mschneider@pokéacademy.edu
#> 341         Domestic  1/12/1992    hmonroe@pokéacademy.edu
#> 381         Domestic   6/9/1990       jlee@pokéacademy.edu
#> 405         Domestic 11/26/2001    dconley@pokéacademy.edu
#> 413    International  6/16/1995      sluna@pokéacademy.edu
#> 470         Domestic   9/8/2000  kfletcher@pokéacademy.edu
#> 504    International  1/14/1994     apetty@pokéacademy.edu
#> 518         Domestic 11/19/1996  echambers@pokéacademy.edu
#> 533         Domestic  7/25/2005     khorne@pokéacademy.edu
#> 
#> $`Cyndaquil House.Ent First Year`
#>     Last_Name First_Name   Student_Type            Hall Room Room_Type
#> 95       Peck     Aubree Ent First Year Cyndaquil House  405    Single
#> 105     Frost     Shayne Ent First Year Cyndaquil House  502    Single
#> 177      Reed   Emmanuel Ent First Year Cyndaquil House  214    Single
#> 267      Pope  Zechariah Ent First Year Cyndaquil House  510    Double
#> 270 Mccormick     Camila Ent First Year Cyndaquil House  506    Double
#> 289   Woodard     Trevon Ent First Year Cyndaquil House  107    Single
#> 317     Johns     Janiya Ent First Year Cyndaquil House  214    Triple
#> 338    Henson      Caden Ent First Year Cyndaquil House  201    Double
#> 387  Mcintosh    Solomon Ent First Year Cyndaquil House  304    Double
#> 393   Simmons   Cristian Ent First Year Cyndaquil House  507    Double
#> 500     Cohen      Layla Ent First Year Cyndaquil House  207    Double
#> 537        Li    Mariela Ent First Year Cyndaquil House  308    Triple
#> 576   Fuentes      David Ent First Year Cyndaquil House  102    Triple
#>     Citizenship_DESC        DOB                      Email
#> 95          Domestic 11/30/2005      apeck@pokéacademy.edu
#> 105         Domestic  9/12/2006     sfrost@pokéacademy.edu
#> 177    International   8/2/1992      ereed@pokéacademy.edu
#> 267         Domestic   1/1/2005      zpope@pokéacademy.edu
#> 270         Domestic  5/18/1992 cmccormick@pokéacademy.edu
#> 289         Domestic  5/18/1996   twoodard@pokéacademy.edu
#> 317    International  5/26/1997     jjohns@pokéacademy.edu
#> 338         Domestic   2/4/2002    chenson@pokéacademy.edu
#> 387         Domestic   9/6/1994  smcintosh@pokéacademy.edu
#> 393         Domestic   4/1/1991   csimmons@pokéacademy.edu
#> 500         Domestic 12/14/1996     lcohen@pokéacademy.edu
#> 537         Domestic  10/7/1990        mli@pokéacademy.edu
#> 576         Domestic  4/10/2004   dfuentes@pokéacademy.edu
#> 
#> $`Ditto House.Ent First Year`
#>     Last_Name First_Name   Student_Type        Hall Room Room_Type
#> 72      Drake   Graciela Ent First Year Ditto House  106    Single
#> 100     Marsh     Warren Ent First Year Ditto House  411    Double
#> 117     Zhang    Natasha Ent First Year Ditto House  312    Single
#> 121     Stark    Melinda Ent First Year Ditto House  211    Single
#> 176 Frederick     Tyreek Ent First Year Ditto House  416    Triple
#> 209   Daniels  Dominique Ent First Year Ditto House  202    Single
#> 347   Walters       Jace Ent First Year Ditto House  210    Single
#> 376     Tapia        Joy Ent First Year Ditto House  216    Single
#> 417     Cline      Perry Ent First Year Ditto House  201 Quadruple
#> 428    Strong     Raheem Ent First Year Ditto House  302    Double
#> 447      Barr        Ian Ent First Year Ditto House  215    Single
#> 450     Rubio   Valentin Ent First Year Ditto House  107    Double
#>     Citizenship_DESC        DOB                      Email
#> 72          Domestic  5/29/1998     gdrake@pokéacademy.edu
#> 100    International  4/26/1991     wmarsh@pokéacademy.edu
#> 117         Domestic   2/7/2003     nzhang@pokéacademy.edu
#> 121         Domestic  7/13/2004     mstark@pokéacademy.edu
#> 176         Domestic  2/18/2000 tfrederick@pokéacademy.edu
#> 209         Domestic  2/25/2004   ddaniels@pokéacademy.edu
#> 347         Domestic 10/29/2005   jwalters@pokéacademy.edu
#> 376         Domestic  3/28/1991     jtapia@pokéacademy.edu
#> 417         Domestic 12/13/1999     pcline@pokéacademy.edu
#> 428         Domestic  7/17/1990    rstrong@pokéacademy.edu
#> 447    International  6/22/2003      ibarr@pokéacademy.edu
#> 450    International 10/13/1995     vrubio@pokéacademy.edu
#> 
#> $`Farfetch'd House.Ent First Year`
#>      Last_Name First_Name   Student_Type             Hall Room Room_Type
#> 79    Mccarthy       Amos Ent First Year Farfetch'd House  308    Triple
#> 86        Byrd    Adriana Ent First Year Farfetch'd House  505    Single
#> 97        Holt      Ariel Ent First Year Farfetch'd House  310 Quadruple
#> 144   Schaefer    Rebekah Ent First Year Farfetch'd House  508    Double
#> 170   Callahan      Lydia Ent First Year Farfetch'd House  403    Single
#> 198     Suarez      Robin Ent First Year Farfetch'd House  402    Single
#> 232     Hinton    Georgia Ent First Year Farfetch'd House  110 Quadruple
#> 439        Lam   Estrella Ent First Year Farfetch'd House  110    Single
#> 461     Krause  Demetrius Ent First Year Farfetch'd House  406 Quadruple
#> 475     Duncan   Demarcus Ent First Year Farfetch'd House  103    Double
#> 479       Lamb    Nicolas Ent First Year Farfetch'd House  308    Double
#> 480 Strickland     Aubrey Ent First Year Farfetch'd House  304    Double
#> 513      Cross        Ben Ent First Year Farfetch'd House  404    Triple
#> 543     Nguyen      Omari Ent First Year Farfetch'd House  101    Triple
#> 563      Ponce       Baby Ent First Year Farfetch'd House  213    Double
#> 575    Walters      Tessa Ent First Year Farfetch'd House  505    Single
#> 580    Anthony     Braden Ent First Year Farfetch'd House  509    Double
#>     Citizenship_DESC        DOB                       Email
#> 79          Domestic  1/23/1994   amccarthy@pokéacademy.edu
#> 86     International  7/23/1991       abyrd@pokéacademy.edu
#> 97     International 11/11/1992       aholt@pokéacademy.edu
#> 144    International   7/1/2005   rschaefer@pokéacademy.edu
#> 170         Domestic   2/3/2006   lcallahan@pokéacademy.edu
#> 198    International  8/12/2002     rsuarez@pokéacademy.edu
#> 232         Domestic 10/27/1993     ghinton@pokéacademy.edu
#> 439    International   1/6/1999        elam@pokéacademy.edu
#> 461         Domestic  11/1/2004     dkrause@pokéacademy.edu
#> 475         Domestic 10/26/1993     dduncan@pokéacademy.edu
#> 479         Domestic   8/4/1990       nlamb@pokéacademy.edu
#> 480         Domestic  9/19/1990 astrickland@pokéacademy.edu
#> 513         Domestic  7/17/2005      bcross@pokéacademy.edu
#> 543         Domestic 11/20/1997     onguyen@pokéacademy.edu
#> 563         Domestic  4/24/1996      bponce@pokéacademy.edu
#> 575    International 10/30/2003    twalters@pokéacademy.edu
#> 580         Domestic 10/29/2006    banthony@pokéacademy.edu
#> 
#> $`Gengar House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 5       Booth       Mike Ent First Year Gengar House  302    Triple
#> 9     Maxwell     Elyssa Ent First Year Gengar House  310    Single
#> 102 Schneider   Precious Ent First Year Gengar House  410 Quadruple
#> 108  Oconnell        Sky Ent First Year Gengar House  208    Triple
#> 135    Dawson    Joselyn Ent First Year Gengar House  312    Triple
#> 138  Stephens       Rudy Ent First Year Gengar House  501    Single
#> 257 Cervantes      Heidi Ent First Year Gengar House  309    Double
#> 300   Cabrera    Osvaldo Ent First Year Gengar House  415    Triple
#> 316     Stein    Madelyn Ent First Year Gengar House  308    Double
#> 430    Dodson     Jessie Ent First Year Gengar House  107 Quadruple
#> 457   Francis   Terrance Ent First Year Gengar House  511 Quadruple
#> 477    Cooper       Syed Ent First Year Gengar House  406    Double
#>     Citizenship_DESC        DOB                      Email
#> 5           Domestic 10/30/2003     mbooth@pokéacademy.edu
#> 9           Domestic  3/10/2004   emaxwell@pokéacademy.edu
#> 102         Domestic  7/29/1994 pschneider@pokéacademy.edu
#> 108         Domestic  11/2/1994  soconnell@pokéacademy.edu
#> 135         Domestic 10/13/1990    jdawson@pokéacademy.edu
#> 138    International   5/3/2002  rstephens@pokéacademy.edu
#> 257         Domestic  10/6/2003 hcervantes@pokéacademy.edu
#> 300    International  9/17/2002   ocabrera@pokéacademy.edu
#> 316         Domestic  7/17/1997     mstein@pokéacademy.edu
#> 430         Domestic  6/23/1990    jdodson@pokéacademy.edu
#> 457    International  10/5/1997   tfrancis@pokéacademy.edu
#> 477         Domestic  5/26/2003    scooper@pokéacademy.edu
#> 
#> $`Ho-Oh House.Ent First Year`
#>     Last_Name First_Name   Student_Type        Hall Room Room_Type
#> 3     Patrick  Heriberto Ent First Year Ho-Oh House  306 Quadruple
#> 30  Mccormick      Kathy Ent First Year Ho-Oh House  211    Single
#> 40    Mueller      Amaya Ent First Year Ho-Oh House  211    Triple
#> 76     Clarke    Domenic Ent First Year Ho-Oh House  507 Quadruple
#> 255    Rangel       Reid Ent First Year Ho-Oh House  304    Triple
#> 261    Wright    Martina Ent First Year Ho-Oh House  207 Quadruple
#> 295      Tate    Theresa Ent First Year Ho-Oh House  406    Double
#> 362   Stevens    Gerardo Ent First Year Ho-Oh House  312 Quadruple
#> 415      Holt      Devon Ent First Year Ho-Oh House  402    Double
#> 434  Carrillo   Abigayle Ent First Year Ho-Oh House  207 Quadruple
#> 446   Fleming    Antonio Ent First Year Ho-Oh House  504    Triple
#> 501    Reeves      Jamel Ent First Year Ho-Oh House  110    Double
#>     Citizenship_DESC        DOB                      Email
#> 3           Domestic   3/6/1993   hpatrick@pokéacademy.edu
#> 30          Domestic  2/11/1991 kmccormick@pokéacademy.edu
#> 40          Domestic 10/29/2004   amueller@pokéacademy.edu
#> 76          Domestic   6/1/1999    dclarke@pokéacademy.edu
#> 255         Domestic  4/15/2002    rrangel@pokéacademy.edu
#> 261    International  2/17/2005    mwright@pokéacademy.edu
#> 295         Domestic  7/20/2001      ttate@pokéacademy.edu
#> 362         Domestic   2/4/2004   gstevens@pokéacademy.edu
#> 415         Domestic   1/9/1993      dholt@pokéacademy.edu
#> 434         Domestic  12/7/1994  acarrillo@pokéacademy.edu
#> 446         Domestic  9/26/1998   afleming@pokéacademy.edu
#> 501         Domestic  5/23/2006    jreeves@pokéacademy.edu
#> 
#> $`Ivysaur House.Ent First Year`
#>      Last_Name First_Name   Student_Type          Hall Room Room_Type
#> 10       Silva  Elizabeth Ent First Year Ivysaur House  407    Triple
#> 13        Luna     Jordyn Ent First Year Ivysaur House  301 Quadruple
#> 32        Chen    Marcelo Ent First Year Ivysaur House  106    Double
#> 60       Nolan      Perla Ent First Year Ivysaur House  504    Double
#> 215 Harrington   Jennifer Ent First Year Ivysaur House  213    Double
#> 222      Stark     Dalton Ent First Year Ivysaur House  110    Double
#> 325    Donovan     Anissa Ent First Year Ivysaur House  101    Double
#> 420     Riddle     Xavier Ent First Year Ivysaur House  403    Single
#> 476      Flynn    Madyson Ent First Year Ivysaur House  411    Triple
#> 505      Rocha      Lyric Ent First Year Ivysaur House  110    Single
#> 552    Estrada   Catalina Ent First Year Ivysaur House  203 Quadruple
#>     Citizenship_DESC       DOB                       Email
#> 10          Domestic 4/20/2005      esilva@pokéacademy.edu
#> 13          Domestic 2/18/1999       jluna@pokéacademy.edu
#> 32          Domestic  9/1/2006       mchen@pokéacademy.edu
#> 60          Domestic  8/9/1996      pnolan@pokéacademy.edu
#> 215    International 7/25/1994 jharrington@pokéacademy.edu
#> 222         Domestic 6/26/2005      dstark@pokéacademy.edu
#> 325    International 4/29/2002    adonovan@pokéacademy.edu
#> 420    International 5/22/2003     xriddle@pokéacademy.edu
#> 476    International  7/1/1992      mflynn@pokéacademy.edu
#> 505    International 3/25/2006      lrocha@pokéacademy.edu
#> 552         Domestic  6/2/1998    cestrada@pokéacademy.edu
#> 
#> $`Leafeon House.Ent First Year`
#>     Last_Name First_Name   Student_Type          Hall Room Room_Type
#> 59      Banks    Quinton Ent First Year Leafeon House  215    Single
#> 85      Short       Jude Ent First Year Leafeon House  505    Triple
#> 101     Avery     Calvin Ent First Year Leafeon House  415    Single
#> 226    Lozano      Alysa Ent First Year Leafeon House  101    Double
#> 279     Young   Michelle Ent First Year Leafeon House  502    Triple
#> 354    Robles        Mia Ent First Year Leafeon House  209 Quadruple
#> 481   Bradley  Nathaniel Ent First Year Leafeon House  402    Double
#> 485  Alvarado   Kristine Ent First Year Leafeon House  412    Double
#> 521     Curry     Tyrell Ent First Year Leafeon House  214    Triple
#> 540 Schneider      Efren Ent First Year Leafeon House  414    Single
#> 558  Galloway   Brittney Ent First Year Leafeon House  307 Quadruple
#> 572  Oconnell     Alfred Ent First Year Leafeon House  207 Quadruple
#> 596   Baldwin     Carmen Ent First Year Leafeon House  412    Single
#>     Citizenship_DESC        DOB                      Email
#> 59          Domestic  4/20/1995     qbanks@pokéacademy.edu
#> 85          Domestic  8/28/1995     jshort@pokéacademy.edu
#> 101         Domestic   1/2/1994     cavery@pokéacademy.edu
#> 226    International  8/18/2006    alozano@pokéacademy.edu
#> 279         Domestic   9/7/1996     myoung@pokéacademy.edu
#> 354         Domestic   6/5/1997    mrobles@pokéacademy.edu
#> 481         Domestic  1/19/1995   nbradley@pokéacademy.edu
#> 485    International   3/7/2006  kalvarado@pokéacademy.edu
#> 521    International  9/13/1997     tcurry@pokéacademy.edu
#> 540         Domestic   4/6/1998 eschneider@pokéacademy.edu
#> 558         Domestic   6/1/1993  bgalloway@pokéacademy.edu
#> 572         Domestic 12/26/1998  aoconnell@pokéacademy.edu
#> 596    International  7/17/1996   cbaldwin@pokéacademy.edu
#> 
#> $`Lickitung House.Ent First Year`
#>     Last_Name First_Name   Student_Type            Hall Room Room_Type
#> 141     Cowan  Jaqueline Ent First Year Lickitung House  305 Quadruple
#> 152    Baxter     Kareem Ent First Year Lickitung House  405 Quadruple
#> 156    Finley    Juliana Ent First Year Lickitung House  105    Triple
#> 187    Jarvis      Dylon Ent First Year Lickitung House  201 Quadruple
#> 208    Arnold    Melinda Ent First Year Lickitung House  416 Quadruple
#> 218    Gamble     Hayden Ent First Year Lickitung House  501    Single
#> 224   Proctor  Cristobal Ent First Year Lickitung House  103 Quadruple
#> 249      Paul     Destin Ent First Year Lickitung House  502    Double
#> 306      Webb    Phoenix Ent First Year Lickitung House  105    Single
#> 342  Randolph     Summer Ent First Year Lickitung House  202    Double
#> 366   Pittman    Bethany Ent First Year Lickitung House  305    Triple
#> 401      Ryan      Liana Ent First Year Lickitung House  503    Triple
#> 435   Vasquez     Marlee Ent First Year Lickitung House  508    Double
#> 452    Hester       Kane Ent First Year Lickitung House  304    Single
#> 459      Cain     Paxton Ent First Year Lickitung House  101 Quadruple
#> 517     Beard    Jamison Ent First Year Lickitung House  311 Quadruple
#> 546   Barrera     Milton Ent First Year Lickitung House  503    Double
#> 564   Nielsen    Larissa Ent First Year Lickitung House  511    Triple
#>     Citizenship_DESC        DOB                     Email
#> 141         Domestic  9/18/2002    jcowan@pokéacademy.edu
#> 152         Domestic  8/19/2002   kbaxter@pokéacademy.edu
#> 156         Domestic  1/31/1992   jfinley@pokéacademy.edu
#> 187    International 12/21/1993   djarvis@pokéacademy.edu
#> 208    International   1/2/2004   marnold@pokéacademy.edu
#> 218         Domestic  4/28/1999   hgamble@pokéacademy.edu
#> 224         Domestic   7/2/2006  cproctor@pokéacademy.edu
#> 249    International 12/10/1995     dpaul@pokéacademy.edu
#> 306         Domestic  4/17/1999     pwebb@pokéacademy.edu
#> 342    International  6/15/2006 srandolph@pokéacademy.edu
#> 366         Domestic   4/4/2001  bpittman@pokéacademy.edu
#> 401         Domestic  9/26/1997     lryan@pokéacademy.edu
#> 435         Domestic 10/16/1993  mvasquez@pokéacademy.edu
#> 452         Domestic  1/12/1992   khester@pokéacademy.edu
#> 459         Domestic  7/24/1992     pcain@pokéacademy.edu
#> 517         Domestic  1/23/1993    jbeard@pokéacademy.edu
#> 546    International  5/17/2000  mbarrera@pokéacademy.edu
#> 564         Domestic   5/5/1991  lnielsen@pokéacademy.edu
#> 
#> $`Luxio House.Ent First Year`
#>     Last_Name First_Name   Student_Type        Hall Room Room_Type
#> 33    Swanson    Abigale Ent First Year Luxio House  508 Quadruple
#> 39   Morrison      Keven Ent First Year Luxio House  407    Single
#> 179  Bradshaw  Demetrius Ent First Year Luxio House  506    Triple
#> 194      Best    Carlton Ent First Year Luxio House  417    Triple
#> 223     Greer     Jacoby Ent First Year Luxio House  509 Quadruple
#> 248  Chambers      Elise Ent First Year Luxio House  107    Double
#> 326   Beasley     Celina Ent First Year Luxio House  110 Quadruple
#> 474    Hoover    Zachery Ent First Year Luxio House  508    Double
#>     Citizenship_DESC        DOB                     Email
#> 33          Domestic 11/29/1995  aswanson@pokéacademy.edu
#> 39          Domestic  3/18/1992 kmorrison@pokéacademy.edu
#> 179    International  6/21/1994 dbradshaw@pokéacademy.edu
#> 194         Domestic  6/27/1995     cbest@pokéacademy.edu
#> 223    International  5/27/2003    jgreer@pokéacademy.edu
#> 248         Domestic  2/26/1999 echambers@pokéacademy.edu
#> 326         Domestic 10/19/2002  cbeasley@pokéacademy.edu
#> 474         Domestic 10/24/2004   zhoover@pokéacademy.edu
#> 
#> $`Mew House.Ent First Year`
#>     Last_Name First_Name   Student_Type      Hall Room Room_Type
#> 41    Mahoney     Kinsey Ent First Year Mew House  508    Single
#> 44      Crane      Isiah Ent First Year Mew House  209    Triple
#> 56     Davies       Lily Ent First Year Mew House  204 Quadruple
#> 94    Sanchez        Sam Ent First Year Mew House  309    Triple
#> 145      Cobb    Brendan Ent First Year Mew House  107    Single
#> 310      Wall     Gordon Ent First Year Mew House  107    Triple
#> 323     Hobbs    Spencer Ent First Year Mew House  408    Double
#> 374     Chang  Jacquelyn Ent First Year Mew House  201    Double
#> 473       Fox       Leon Ent First Year Mew House  102    Double
#> 514    Hardin     Jarvis Ent First Year Mew House  206    Double
#> 557  Figueroa    Mikaela Ent First Year Mew House  411 Quadruple
#> 559   Sanford      Mateo Ent First Year Mew House  511 Quadruple
#> 561    Carson      Chloe Ent First Year Mew House  403 Quadruple
#> 581    Wilson       Bret Ent First Year Mew House  110    Triple
#>     Citizenship_DESC        DOB                     Email
#> 41          Domestic  9/14/2001  kmahoney@pokéacademy.edu
#> 44          Domestic  11/7/1997    icrane@pokéacademy.edu
#> 56          Domestic 11/20/1998   ldavies@pokéacademy.edu
#> 94          Domestic   9/1/2005  ssanchez@pokéacademy.edu
#> 145         Domestic  6/27/2006     bcobb@pokéacademy.edu
#> 310         Domestic 10/24/1991     gwall@pokéacademy.edu
#> 323         Domestic   1/2/2001    shobbs@pokéacademy.edu
#> 374         Domestic   6/7/2001    jchang@pokéacademy.edu
#> 473         Domestic  3/16/2004      lfox@pokéacademy.edu
#> 514    International 10/29/2004   jhardin@pokéacademy.edu
#> 557         Domestic 12/18/2005 mfigueroa@pokéacademy.edu
#> 559         Domestic  6/26/2000  msanford@pokéacademy.edu
#> 561         Domestic 12/19/1994   ccarson@pokéacademy.edu
#> 581    International  11/8/2002   bwilson@pokéacademy.edu
#> 
#> $`Moltres House.Ent First Year`
#>      Last_Name First_Name   Student_Type          Hall Room Room_Type
#> 7        Boone    Quinten Ent First Year Moltres House  405    Single
#> 91       Irwin     Carson Ent First Year Moltres House  412    Triple
#> 98      Adkins     Marcel Ent First Year Moltres House  306    Double
#> 132     Walker      Isaac Ent First Year Moltres House  103 Quadruple
#> 136  Hernandez      Chase Ent First Year Moltres House  408 Quadruple
#> 296 Stephenson      Aimee Ent First Year Moltres House  301 Quadruple
#> 324    Bentley    Addison Ent First Year Moltres House  508    Single
#> 368    Mccarty     Markus Ent First Year Moltres House  415 Quadruple
#> 369       Rich      Josef Ent First Year Moltres House  411    Double
#> 390      Perez      Keira Ent First Year Moltres House  301    Triple
#> 422      Irwin   Abbigail Ent First Year Moltres House  306    Single
#> 510     Murray      Rylan Ent First Year Moltres House  403 Quadruple
#> 536   Mcdonald      Jadon Ent First Year Moltres House  502    Triple
#> 541       Todd    Sabrina Ent First Year Moltres House  311 Quadruple
#> 562      Weeks       Kale Ent First Year Moltres House  206    Single
#>     Citizenship_DESC        DOB                       Email
#> 7           Domestic 11/17/2004      qboone@pokéacademy.edu
#> 91          Domestic 12/20/2004      cirwin@pokéacademy.edu
#> 98          Domestic  8/26/2000     madkins@pokéacademy.edu
#> 132    International   4/4/2001     iwalker@pokéacademy.edu
#> 136         Domestic 12/21/2003  chernandez@pokéacademy.edu
#> 296    International   4/5/1992 astephenson@pokéacademy.edu
#> 324         Domestic   8/5/1992    abentley@pokéacademy.edu
#> 368    International  6/14/1993    mmccarty@pokéacademy.edu
#> 369    International   3/9/2003       jrich@pokéacademy.edu
#> 390         Domestic  7/19/2004      kperez@pokéacademy.edu
#> 422         Domestic  11/1/2004      airwin@pokéacademy.edu
#> 510         Domestic   8/8/1991     rmurray@pokéacademy.edu
#> 536         Domestic  2/18/2003   jmcdonald@pokéacademy.edu
#> 541         Domestic  1/25/2006       stodd@pokéacademy.edu
#> 562         Domestic 10/22/1999      kweeks@pokéacademy.edu
#> 
#> $`Mudkip House.Ent First Year`
#>      Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 14      Finley    Janelle Ent First Year Mudkip House  104    Triple
#> 80        Carr   Abdullah Ent First Year Mudkip House  402    Triple
#> 84     Webster     Hailee Ent First Year Mudkip House  107    Double
#> 126 Villarreal     Dallas Ent First Year Mudkip House  306 Quadruple
#> 146    Montoya    Estevan Ent First Year Mudkip House  412    Double
#> 202       Chan     Jaylin Ent First Year Mudkip House  214    Double
#> 297    Douglas     Brooks Ent First Year Mudkip House  408    Double
#> 307     Harper      Jaden Ent First Year Mudkip House  501    Single
#> 352     Snyder       Kale Ent First Year Mudkip House  303    Double
#> 423       Dunn      Dasia Ent First Year Mudkip House  507 Quadruple
#> 433     Hughes       Dion Ent First Year Mudkip House  509    Double
#> 478       Hunt       Colt Ent First Year Mudkip House  205    Single
#> 507     Zamora    Dashawn Ent First Year Mudkip House  101    Single
#> 571     Hinton     Annika Ent First Year Mudkip House  203 Quadruple
#>     Citizenship_DESC       DOB                       Email
#> 14          Domestic 2/16/1996     jfinley@pokéacademy.edu
#> 80          Domestic 8/10/2006       acarr@pokéacademy.edu
#> 84     International  6/5/2005    hwebster@pokéacademy.edu
#> 126    International  2/2/1999 dvillarreal@pokéacademy.edu
#> 146    International 4/30/2003    emontoya@pokéacademy.edu
#> 202         Domestic  9/7/2002       jchan@pokéacademy.edu
#> 297         Domestic  4/8/2001    bdouglas@pokéacademy.edu
#> 307         Domestic  6/1/1993     jharper@pokéacademy.edu
#> 352         Domestic 4/29/1999     ksnyder@pokéacademy.edu
#> 423         Domestic 12/1/2003       ddunn@pokéacademy.edu
#> 433         Domestic 1/18/1999     dhughes@pokéacademy.edu
#> 478         Domestic 3/22/1998       chunt@pokéacademy.edu
#> 507         Domestic  9/7/2002     dzamora@pokéacademy.edu
#> 571         Domestic  2/4/1992     ahinton@pokéacademy.edu
#> 
#> $`Muk House.Ent First Year`
#>     Last_Name First_Name   Student_Type      Hall Room Room_Type
#> 82      Keith     Simone Ent First Year Muk House  206    Single
#> 111    Larsen     Alanna Ent First Year Muk House  405    Triple
#> 133      Case      Joana Ent First Year Muk House  215    Triple
#> 137    Becker      Jaden Ent First Year Muk House  309    Single
#> 153      Hale    Nichole Ent First Year Muk House  308 Quadruple
#> 363   Andrade        Lea Ent First Year Muk House  204    Triple
#> 364     Gates    Aryanna Ent First Year Muk House  313    Double
#> 407      Bean      Ellis Ent First Year Muk House  101 Quadruple
#> 437     Ayala   Precious Ent First Year Muk House  403    Double
#> 502   Pearson        Rey Ent First Year Muk House  213 Quadruple
#> 511 Rodriguez    Lindsey Ent First Year Muk House  506 Quadruple
#>     Citizenship_DESC        DOB                      Email
#> 82          Domestic  2/18/1997     skeith@pokéacademy.edu
#> 111         Domestic  12/8/1995    alarsen@pokéacademy.edu
#> 133    International  6/21/1990      jcase@pokéacademy.edu
#> 137         Domestic   7/7/2000    jbecker@pokéacademy.edu
#> 153    International  1/13/2004      nhale@pokéacademy.edu
#> 363         Domestic 10/25/1997   landrade@pokéacademy.edu
#> 364         Domestic 10/15/1991     agates@pokéacademy.edu
#> 407         Domestic   6/1/2005      ebean@pokéacademy.edu
#> 437         Domestic  8/30/1992     payala@pokéacademy.edu
#> 502         Domestic 10/10/2003   rpearson@pokéacademy.edu
#> 511    International   6/3/2004 lrodriguez@pokéacademy.edu
#> 
#> $`Oddish House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 23    Carroll      Samir Ent First Year Oddish House  211    Single
#> 118     Avila    Hillary Ent First Year Oddish House  409    Single
#> 178   Hammond       Elsa Ent First Year Oddish House  204    Double
#> 217    Krause    Latrell Ent First Year Oddish House  416 Quadruple
#> 271    Carney      Wyatt Ent First Year Oddish House  303    Single
#> 462    Massey      Jalon Ent First Year Oddish House  507    Double
#> 488    Bowman     Denise Ent First Year Oddish House  509    Single
#> 566    Morrow       Finn Ent First Year Oddish House  301    Triple
#> 592   Proctor      Kevin Ent First Year Oddish House  211    Triple
#>     Citizenship_DESC        DOB                    Email
#> 23          Domestic  3/30/1996 scarroll@pokéacademy.edu
#> 118         Domestic  6/14/2000   havila@pokéacademy.edu
#> 178    International 11/22/1999 ehammond@pokéacademy.edu
#> 217         Domestic  4/28/1991  lkrause@pokéacademy.edu
#> 271         Domestic  7/26/1999  wcarney@pokéacademy.edu
#> 462         Domestic   6/4/1990  jmassey@pokéacademy.edu
#> 488         Domestic  6/16/1991  dbowman@pokéacademy.edu
#> 566    International  4/25/2000  fmorrow@pokéacademy.edu
#> 592         Domestic  9/18/1999 kproctor@pokéacademy.edu
#> 
#> $`Pidgey House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 19    Burnett     Laurel Ent First Year Pidgey House  510 Quadruple
#> 35      Avery    Armando Ent First Year Pidgey House  414    Triple
#> 106      Hunt    Tyshawn Ent First Year Pidgey House  503    Double
#> 207    Hudson     Cedric Ent First Year Pidgey House  511 Quadruple
#> 240     Scott     Ulises Ent First Year Pidgey House  301    Triple
#> 278   Mercado     Simeon Ent First Year Pidgey House  406 Quadruple
#> 378    French      Elian Ent First Year Pidgey House  213    Double
#> 409      Ross       Noel Ent First Year Pidgey House  203 Quadruple
#> 414    Zavala    Harmony Ent First Year Pidgey House  306 Quadruple
#> 453   Cabrera       Myah Ent First Year Pidgey House  415    Triple
#> 466   Douglas     Khalil Ent First Year Pidgey House  206 Quadruple
#> 496   Bernard     Sydnie Ent First Year Pidgey House  207    Triple
#> 523   Anthony     Carrie Ent First Year Pidgey House  101    Triple
#> 565    Reilly      Alisa Ent First Year Pidgey House  304    Double
#> 599     Moore     Sheila Ent First Year Pidgey House  306    Double
#>     Citizenship_DESC        DOB                    Email
#> 19          Domestic 12/25/1995 lburnett@pokéacademy.edu
#> 35          Domestic 12/16/1997   aavery@pokéacademy.edu
#> 106         Domestic  3/24/2004    thunt@pokéacademy.edu
#> 207         Domestic  8/19/2005  chudson@pokéacademy.edu
#> 240         Domestic  4/16/1996   uscott@pokéacademy.edu
#> 278         Domestic   4/5/2003 smercado@pokéacademy.edu
#> 378         Domestic  3/15/2005  efrench@pokéacademy.edu
#> 409    International   4/3/1997    nross@pokéacademy.edu
#> 414    International   2/5/2005  hzavala@pokéacademy.edu
#> 453         Domestic   5/2/1996 mcabrera@pokéacademy.edu
#> 466    International 11/29/1995 kdouglas@pokéacademy.edu
#> 496         Domestic  9/28/2001 sbernard@pokéacademy.edu
#> 523         Domestic  4/29/2001 canthony@pokéacademy.edu
#> 565         Domestic  5/27/2000  areilly@pokéacademy.edu
#> 599         Domestic  5/28/1997   smoore@pokéacademy.edu
#> 
#> $`Pikachu Hall.Ent First Year`
#>     Last_Name  First_Name   Student_Type         Hall Room Room_Type
#> 51     Landry       Darin Ent First Year Pikachu Hall  303    Single
#> 127  Shepherd     Emanuel Ent First Year Pikachu Hall  101    Single
#> 131   Trevino      Alexis Ent First Year Pikachu Hall  205 Quadruple
#> 211    Suarez        Elsa Ent First Year Pikachu Hall  503    Single
#> 265   Sellers      Willie Ent First Year Pikachu Hall  204 Quadruple
#> 275   Carlson      Marvin Ent First Year Pikachu Hall  410    Single
#> 360  Alvarado       Ellis Ent First Year Pikachu Hall  415    Double
#> 421  Callahan      Darren Ent First Year Pikachu Hall  103    Triple
#> 431     Munoz     Bernard Ent First Year Pikachu Hall  106    Single
#> 530     Olson       Karly Ent First Year Pikachu Hall  415    Double
#> 539   Ramirez      Mariah Ent First Year Pikachu Hall  308    Triple
#> 590    Morton Maximiliano Ent First Year Pikachu Hall  408    Triple
#> 597      Chan      Donnie Ent First Year Pikachu Hall  106    Triple
#>     Citizenship_DESC        DOB                     Email
#> 51          Domestic  6/23/1991   dlandry@pokéacademy.edu
#> 127         Domestic   9/9/1997 eshepherd@pokéacademy.edu
#> 131    International 12/24/1999  atrevino@pokéacademy.edu
#> 211         Domestic  1/12/1992   esuarez@pokéacademy.edu
#> 265         Domestic  7/21/1999  wsellers@pokéacademy.edu
#> 275         Domestic  10/3/2005  mcarlson@pokéacademy.edu
#> 360    International   3/7/2005 ealvarado@pokéacademy.edu
#> 421         Domestic  3/25/2003 dcallahan@pokéacademy.edu
#> 431         Domestic  11/6/1993    bmunoz@pokéacademy.edu
#> 530         Domestic  7/10/1999    kolson@pokéacademy.edu
#> 539    International  8/27/2001  mramirez@pokéacademy.edu
#> 590         Domestic  12/5/1990   mmorton@pokéacademy.edu
#> 597         Domestic   9/1/1996     dchan@pokéacademy.edu
#> 
#> $`Piplup House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 27   Mitchell    Destany Ent First Year Piplup House  504 Quadruple
#> 53     Dorsey      Carlo Ent First Year Piplup House  214    Single
#> 66   Williams    Kameron Ent First Year Piplup House  208    Triple
#> 103      Mack      Donte Ent First Year Piplup House  103    Triple
#> 199     Salas      Katia Ent First Year Piplup House  403    Double
#> 308      Love    Tristen Ent First Year Piplup House  201    Single
#> 311    George       Alec Ent First Year Piplup House  416    Single
#> 331    George      Carlo Ent First Year Piplup House  104 Quadruple
#> 355      Reed     Colten Ent First Year Piplup House  408    Single
#> 464    Nguyen  Estefania Ent First Year Piplup House  308    Double
#> 469     Salas     Harvey Ent First Year Piplup House  209    Single
#>     Citizenship_DESC        DOB                     Email
#> 27          Domestic  7/25/1994 dmitchell@pokéacademy.edu
#> 53          Domestic  6/27/1992   cdorsey@pokéacademy.edu
#> 66     International   8/2/1996 kwilliams@pokéacademy.edu
#> 103    International 12/25/1992     dmack@pokéacademy.edu
#> 199         Domestic  6/27/2001    ksalas@pokéacademy.edu
#> 308         Domestic   1/6/2001     tlove@pokéacademy.edu
#> 311         Domestic 12/17/1991   ageorge@pokéacademy.edu
#> 331         Domestic  7/15/2005   cgeorge@pokéacademy.edu
#> 355         Domestic   2/3/2001     creed@pokéacademy.edu
#> 464    International  1/23/1993   enguyen@pokéacademy.edu
#> 469    International 10/31/2002    hsalas@pokéacademy.edu
#> 
#> $`Raichu House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 25    Woodard    Braeden Ent First Year Raichu House  407    Single
#> 159     Reese      Faith Ent First Year Raichu House  509    Triple
#> 193      Frye     Hadley Ent First Year Raichu House  209 Quadruple
#> 272   Vasquez     Alonso Ent First Year Raichu House  417    Triple
#> 373 Blanchard      Jenna Ent First Year Raichu House  509    Single
#> 377     Nunez     Aniyah Ent First Year Raichu House  510    Double
#> 383    Norris      Marco Ent First Year Raichu House  504    Single
#> 391    Oliver     Jabari Ent First Year Raichu House  310    Single
#> 402     Keith      Brady Ent First Year Raichu House  415    Single
#> 440   Goodman    Maribel Ent First Year Raichu House  212 Quadruple
#> 460     Gould      Tiana Ent First Year Raichu House  410    Single
#> 534    Morton    Britney Ent First Year Raichu House  414    Triple
#>     Citizenship_DESC        DOB                      Email
#> 25          Domestic   8/6/1994   bwoodard@pokéacademy.edu
#> 159         Domestic 11/26/1995     freese@pokéacademy.edu
#> 193    International 12/31/1995      hfrye@pokéacademy.edu
#> 272         Domestic  7/29/1996   avasquez@pokéacademy.edu
#> 373         Domestic  6/18/2000 jblanchard@pokéacademy.edu
#> 377         Domestic 11/23/2003     anunez@pokéacademy.edu
#> 383         Domestic   4/1/1996    mnorris@pokéacademy.edu
#> 391    International   4/3/1993    joliver@pokéacademy.edu
#> 402         Domestic  5/23/2004     bkeith@pokéacademy.edu
#> 440    International 11/20/1993   mgoodman@pokéacademy.edu
#> 460         Domestic 10/12/2000     tgould@pokéacademy.edu
#> 534         Domestic  6/23/1991    bmorton@pokéacademy.edu
#> 
#> $`Regice House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 74    Cabrera    Douglas Ent First Year Regice House  416    Single
#> 122     Rocha       Bret Ent First Year Regice House  102    Triple
#> 167    Bright      Silas Ent First Year Regice House  208 Quadruple
#> 262  Davidson      Kiana Ent First Year Regice House  207    Single
#> 313    Davila   Berenice Ent First Year Regice House  409    Triple
#> 365    Malone      Ashly Ent First Year Regice House  304 Quadruple
#> 367    Bowman    Brianne Ent First Year Regice House  212    Triple
#> 432    Norton     Efrain Ent First Year Regice House  307 Quadruple
#> 508      Kent      Macie Ent First Year Regice House  215    Single
#> 555 Blackburn   Yessenia Ent First Year Regice House  210    Triple
#> 568    Oneill     Sylvia Ent First Year Regice House  507 Quadruple
#>     Citizenship_DESC        DOB                      Email
#> 74          Domestic  6/17/1990   dcabrera@pokéacademy.edu
#> 122         Domestic   1/2/1999     brocha@pokéacademy.edu
#> 167         Domestic   7/3/2002    sbright@pokéacademy.edu
#> 262    International  7/24/1991  kdavidson@pokéacademy.edu
#> 313         Domestic 11/23/1993    bdavila@pokéacademy.edu
#> 365         Domestic  4/24/1997    amalone@pokéacademy.edu
#> 367         Domestic  1/18/2001    bbowman@pokéacademy.edu
#> 432         Domestic   6/2/1996    enorton@pokéacademy.edu
#> 508         Domestic  6/16/1996      mkent@pokéacademy.edu
#> 555         Domestic   3/5/1996 yblackburn@pokéacademy.edu
#> 568         Domestic  7/10/1999    soneill@pokéacademy.edu
#> 
#> $`Rowlet House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 55     Wilson    Giselle Ent First Year Rowlet House  108    Triple
#> 68   Richards     Kaylie Ent First Year Rowlet House  308    Single
#> 173  Odonnell     Melvin Ent First Year Rowlet House  403    Double
#> 201   Aguilar      Ariel Ent First Year Rowlet House  309    Double
#> 243    Willis   Muhammad Ent First Year Rowlet House  408    Triple
#> 251  Sandoval    Stephon Ent First Year Rowlet House  207    Triple
#> 330  Matthews  Esmeralda Ent First Year Rowlet House  102    Triple
#> 389   Harrell    Maranda Ent First Year Rowlet House  504    Single
#> 419 Hernandez       Isai Ent First Year Rowlet House  102    Double
#> 524       Day    Cameron Ent First Year Rowlet House  406 Quadruple
#>     Citizenship_DESC       DOB                      Email
#> 55     International 1/30/1993    gwilson@pokéacademy.edu
#> 68          Domestic 7/27/1991  krichards@pokéacademy.edu
#> 173         Domestic 11/1/2000  modonnell@pokéacademy.edu
#> 201         Domestic 3/28/1994   aaguilar@pokéacademy.edu
#> 243    International  6/5/2002    mwillis@pokéacademy.edu
#> 251         Domestic 8/12/1998  ssandoval@pokéacademy.edu
#> 330         Domestic 5/10/1993  ematthews@pokéacademy.edu
#> 389         Domestic  2/9/2001   mharrell@pokéacademy.edu
#> 419         Domestic 11/8/1993 ihernandez@pokéacademy.edu
#> 524         Domestic 9/19/1990       cday@pokéacademy.edu
#> 
#> $`Spoink House.Ent First Year`
#>      Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 77     Hampton     Skylar Ent First Year Spoink House  107 Quadruple
#> 107       Roth     Joshua Ent First Year Spoink House  409    Triple
#> 151   Matthews      Brian Ent First Year Spoink House  213 Quadruple
#> 181  Singleton     Yazmin Ent First Year Spoink House  312 Quadruple
#> 210    Esparza    Sincere Ent First Year Spoink House  308    Double
#> 239      Duffy    Braedon Ent First Year Spoink House  209    Double
#> 320     Weaver     Claire Ent First Year Spoink House  103    Triple
#> 337       Cole     Peyton Ent First Year Spoink House  403 Quadruple
#> 343 Stephenson       Deja Ent First Year Spoink House  107 Quadruple
#> 408       Moss        Roy Ent First Year Spoink House  311 Quadruple
#> 410    Schmidt     Sophie Ent First Year Spoink House  209 Quadruple
#> 526      Mills      Lloyd Ent First Year Spoink House  204 Quadruple
#> 527 Fitzgerald      Alisa Ent First Year Spoink House  311    Single
#> 574      Black       Aldo Ent First Year Spoink House  212    Triple
#>     Citizenship_DESC        DOB                       Email
#> 77     International  12/5/2006    shampton@pokéacademy.edu
#> 107    International 11/27/2003       jroth@pokéacademy.edu
#> 151         Domestic  1/19/2006   bmatthews@pokéacademy.edu
#> 181         Domestic  6/15/2006  ysingleton@pokéacademy.edu
#> 210         Domestic  5/22/1997    sesparza@pokéacademy.edu
#> 239         Domestic  12/2/2003      bduffy@pokéacademy.edu
#> 320    International  11/3/1999     cweaver@pokéacademy.edu
#> 337         Domestic   5/9/1993       pcole@pokéacademy.edu
#> 343    International   8/4/2004 dstephenson@pokéacademy.edu
#> 408         Domestic 12/15/1999       rmoss@pokéacademy.edu
#> 410    International   9/1/1997    sschmidt@pokéacademy.edu
#> 526         Domestic 10/20/1994      lmills@pokéacademy.edu
#> 527         Domestic  4/18/2004 afitzgerald@pokéacademy.edu
#> 574         Domestic  3/20/2006      ablack@pokéacademy.edu
#> 
#> $`Squirtle House.Ent First Year`
#>      Last_Name First_Name   Student_Type           Hall Room Room_Type
#> 2       Pierce    Christa Ent First Year Squirtle House  209    Single
#> 129   Franklin   Giovanna Ent First Year Squirtle House  412 Quadruple
#> 161     Hughes     Ingrid Ent First Year Squirtle House  414    Double
#> 250      Knapp       Nico Ent First Year Squirtle House  305    Single
#> 318    Lindsey       Amya Ent First Year Squirtle House  410    Double
#> 334 Cunningham   Kasandra Ent First Year Squirtle House  109    Triple
#> 344    Mcclain      Jaren Ent First Year Squirtle House  202 Quadruple
#> 388   Humphrey     Miriam Ent First Year Squirtle House  501    Triple
#> 528      Brown       Drew Ent First Year Squirtle House  502    Double
#> 529    Morales       Alan Ent First Year Squirtle House  416    Double
#>     Citizenship_DESC        DOB                       Email
#> 2           Domestic  8/10/2001     cpierce@pokéacademy.edu
#> 129    International 12/27/1996   gfranklin@pokéacademy.edu
#> 161         Domestic  4/18/1995     ihughes@pokéacademy.edu
#> 250    International  5/28/1996      nknapp@pokéacademy.edu
#> 318         Domestic   1/5/1993    alindsey@pokéacademy.edu
#> 334         Domestic  4/30/2005 kcunningham@pokéacademy.edu
#> 344    International 10/25/1997    jmcclain@pokéacademy.edu
#> 388         Domestic  10/3/2004   mhumphrey@pokéacademy.edu
#> 528         Domestic   2/3/1997      dbrown@pokéacademy.edu
#> 529         Domestic  12/7/2004    amorales@pokéacademy.edu
#> 
#> $`Sylveon House.Ent First Year`
#>     Last_Name First_Name   Student_Type          Hall Room Room_Type
#> 15       Lowe     Iliana Ent First Year Sylveon House  202 Quadruple
#> 58       Clay     Martin Ent First Year Sylveon House  312 Quadruple
#> 83    Andrews     Dallas Ent First Year Sylveon House  109 Quadruple
#> 90     Jordan      Craig Ent First Year Sylveon House  110    Single
#> 110   Herring      Trace Ent First Year Sylveon House  212    Single
#> 166    Waters      Edgar Ent First Year Sylveon House  213    Double
#> 200 Stevenson      Tommy Ent First Year Sylveon House  212    Triple
#> 233    Durham      Heidi Ent First Year Sylveon House  107    Double
#> 264     Stout      Abbie Ent First Year Sylveon House  408    Triple
#> 314     Hayes   Kaitlynn Ent First Year Sylveon House  201    Double
#> 332    Adkins      Rylie Ent First Year Sylveon House  507    Double
#> 418  Gonzales    Deborah Ent First Year Sylveon House  214    Triple
#> 438     Stone     Destin Ent First Year Sylveon House  109    Triple
#> 455     Grant       Ryan Ent First Year Sylveon House  414    Double
#> 545     Riley  Margarita Ent First Year Sylveon House  208    Single
#>     Citizenship_DESC        DOB                      Email
#> 15          Domestic  4/24/1996      ilowe@pokéacademy.edu
#> 58          Domestic  6/10/1993      mclay@pokéacademy.edu
#> 83          Domestic  6/22/2005   dandrews@pokéacademy.edu
#> 90          Domestic  5/13/1994    cjordan@pokéacademy.edu
#> 110    International  11/6/1994   therring@pokéacademy.edu
#> 166    International 12/19/2000    ewaters@pokéacademy.edu
#> 200         Domestic   3/2/2002 tstevenson@pokéacademy.edu
#> 233    International 12/13/2006    hdurham@pokéacademy.edu
#> 264         Domestic   4/6/2000     astout@pokéacademy.edu
#> 314    International  5/15/1997     khayes@pokéacademy.edu
#> 332         Domestic   3/8/2003    radkins@pokéacademy.edu
#> 418         Domestic  6/28/2000  dgonzales@pokéacademy.edu
#> 438         Domestic  6/26/2005     dstone@pokéacademy.edu
#> 455    International  5/20/1999     rgrant@pokéacademy.edu
#> 545         Domestic  8/24/1999     mriley@pokéacademy.edu
#> 
#> $`Togepi House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 1       Hardy  Rosalinda Ent First Year Togepi House  508 Quadruple
#> 28    Pollard    Candice Ent First Year Togepi House  508    Triple
#> 47      Foley  Christian Ent First Year Togepi House  102    Single
#> 48     Gibson      Lesly Ent First Year Togepi House  405 Quadruple
#> 185     Bowen      Isiah Ent First Year Togepi House  107    Single
#> 219     Hines    Shakira Ent First Year Togepi House  511    Triple
#> 259   Pollard  Sebastian Ent First Year Togepi House  216    Double
#> 283  Mckenzie      Lesly Ent First Year Togepi House  310 Quadruple
#> 329   Roberts   Estrella Ent First Year Togepi House  407    Double
#> 346      Bell     Lesley Ent First Year Togepi House  208    Single
#> 499    Rivers     Carlie Ent First Year Togepi House  103    Triple
#> 515     Moody     Raegan Ent First Year Togepi House  416 Quadruple
#> 582  Phillips       Cora Ent First Year Togepi House  414    Double
#>     Citizenship_DESC        DOB                     Email
#> 1           Domestic  6/15/1994    rhardy@pokéacademy.edu
#> 28     International  6/27/2001  cpollard@pokéacademy.edu
#> 47          Domestic 12/31/2002    cfoley@pokéacademy.edu
#> 48          Domestic  6/23/2006   lgibson@pokéacademy.edu
#> 185         Domestic  4/18/1991    ibowen@pokéacademy.edu
#> 219         Domestic  7/17/1996    shines@pokéacademy.edu
#> 259         Domestic  8/14/2002  spollard@pokéacademy.edu
#> 283         Domestic 10/20/2005 lmckenzie@pokéacademy.edu
#> 329         Domestic  7/24/1994  eroberts@pokéacademy.edu
#> 346    International   6/6/2006     lbell@pokéacademy.edu
#> 499         Domestic  9/19/1996   crivers@pokéacademy.edu
#> 515         Domestic  8/13/1992    rmoody@pokéacademy.edu
#> 582         Domestic  12/7/2001 cphillips@pokéacademy.edu
#> 
#> $`Torterra House.Ent First Year`
#>     Last_Name First_Name   Student_Type           Hall Room Room_Type
#> 38    Rodgers      Raven Ent First Year Torterra House  313 Quadruple
#> 73   Mccarthy   Sheridan Ent First Year Torterra House  405 Quadruple
#> 87       Sims       Anya Ent First Year Torterra House  406    Triple
#> 155   Sampson   Danielle Ent First Year Torterra House  305    Single
#> 168 Alexander      Tariq Ent First Year Torterra House  407    Single
#> 172      Mays      Kiara Ent First Year Torterra House  508 Quadruple
#> 221    Fowler       Jack Ent First Year Torterra House  204    Double
#> 242      Ware     Blaine Ent First Year Torterra House  310    Double
#> 429    Juarez   Kiersten Ent First Year Torterra House  203 Quadruple
#> 486    Robles     Marlon Ent First Year Torterra House  308    Double
#> 542    Savage   Kaitlynn Ent First Year Torterra House  509    Double
#> 595    Ramsey      Angel Ent First Year Torterra House  410    Triple
#> 598       Day     Lilian Ent First Year Torterra House  503    Double
#>     Citizenship_DESC        DOB                      Email
#> 38          Domestic  3/24/2006   rrodgers@pokéacademy.edu
#> 73          Domestic 11/21/1992  smccarthy@pokéacademy.edu
#> 87          Domestic  2/24/1995      asims@pokéacademy.edu
#> 155         Domestic 12/21/2006   dsampson@pokéacademy.edu
#> 168         Domestic  8/17/2003 talexander@pokéacademy.edu
#> 172    International  1/30/2000      kmays@pokéacademy.edu
#> 221         Domestic 12/31/2006    jfowler@pokéacademy.edu
#> 242    International 11/23/2006      bware@pokéacademy.edu
#> 429    International  3/25/1994    kjuarez@pokéacademy.edu
#> 486    International  5/12/2004    mrobles@pokéacademy.edu
#> 542         Domestic  1/19/2005    ksavage@pokéacademy.edu
#> 595         Domestic   5/3/1991    aramsey@pokéacademy.edu
#> 598         Domestic  8/23/1990       lday@pokéacademy.edu
#> 
#> $`Umbreon House.Ent First Year`
#>     Last_Name First_Name   Student_Type          Hall Room Room_Type
#> 4       Mason     Stefan Ent First Year Umbreon House  212    Triple
#> 29   Buchanan       Luis Ent First Year Umbreon House  308    Triple
#> 109  Galloway     Ariana Ent First Year Umbreon House  308    Triple
#> 113    Bishop     Hailie Ent First Year Umbreon House  502    Triple
#> 128     Wolfe    Kristin Ent First Year Umbreon House  110 Quadruple
#> 142    Macias    Madisen Ent First Year Umbreon House  404    Single
#> 148      Berg     Rafael Ent First Year Umbreon House  212 Quadruple
#> 160   Cochran      Jared Ent First Year Umbreon House  102 Quadruple
#> 204   Padilla   Mohammad Ent First Year Umbreon House  403    Triple
#> 228       Liu Alessandro Ent First Year Umbreon House  305    Single
#> 280   Andrade     Rickey Ent First Year Umbreon House  313    Single
#> 286     Duffy      Fidel Ent First Year Umbreon House  206    Triple
#> 288    Turner  Jackeline Ent First Year Umbreon House  417    Double
#> 293   Houston    Triston Ent First Year Umbreon House  202    Double
#> 335   Mcbride      Amani Ent First Year Umbreon House  312    Single
#> 394      Meza     Yvette Ent First Year Umbreon House  415    Double
#> 448   Mccarty     Jazmin Ent First Year Umbreon House  208    Single
#> 525    Holmes       Glen Ent First Year Umbreon House  412    Triple
#> 570     Simon      Ellen Ent First Year Umbreon House  511    Double
#>     Citizenship_DESC        DOB                     Email
#> 4           Domestic   6/9/1994    smason@pokéacademy.edu
#> 29          Domestic  9/26/2006 lbuchanan@pokéacademy.edu
#> 109         Domestic 10/20/2000 agalloway@pokéacademy.edu
#> 113    International 12/26/1998   hbishop@pokéacademy.edu
#> 128         Domestic  9/15/1997    kwolfe@pokéacademy.edu
#> 142         Domestic  8/25/2001   mmacias@pokéacademy.edu
#> 148         Domestic   3/9/1992     rberg@pokéacademy.edu
#> 160    International 12/12/2004  jcochran@pokéacademy.edu
#> 204         Domestic  7/22/1998  mpadilla@pokéacademy.edu
#> 228    International  9/14/1995      aliu@pokéacademy.edu
#> 280         Domestic 11/21/1990  randrade@pokéacademy.edu
#> 286         Domestic  7/23/2004    fduffy@pokéacademy.edu
#> 288         Domestic  4/24/1996   jturner@pokéacademy.edu
#> 293         Domestic   1/1/1996  thouston@pokéacademy.edu
#> 335         Domestic   7/8/1998  amcbride@pokéacademy.edu
#> 394         Domestic  4/27/2001     ymeza@pokéacademy.edu
#> 448         Domestic  2/20/2003  jmccarty@pokéacademy.edu
#> 525         Domestic  7/28/2002   gholmes@pokéacademy.edu
#> 570    International  6/17/1998    esimon@pokéacademy.edu
#> 
#> $`Vulpix House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 114   Randall       Lena Ent First Year Vulpix House  509    Single
#> 139     Wyatt       Raul Ent First Year Vulpix House  403    Triple
#> 143   Bradley      Mikel Ent First Year Vulpix House  415 Quadruple
#> 327    Ibarra      Jamel Ent First Year Vulpix House  402    Single
#> 349    Atkins     London Ent First Year Vulpix House  306    Double
#> 356   Sanford      Sonny Ent First Year Vulpix House  211    Single
#> 370      Kidd     Jessie Ent First Year Vulpix House  203    Triple
#> 400    Jordan    Aryanna Ent First Year Vulpix House  403    Triple
#> 441    Lozano     Jaycee Ent First Year Vulpix House  311    Double
#> 449      Ruiz   Caitlynn Ent First Year Vulpix House  201    Double
#> 465  Arellano     Joelle Ent First Year Vulpix House  214    Double
#> 492    Mercer      Davis Ent First Year Vulpix House  408 Quadruple
#> 520    Martin     Kiarra Ent First Year Vulpix House  406 Quadruple
#> 522       Key     Kailyn Ent First Year Vulpix House  502    Triple
#> 538     Ayala      Kelli Ent First Year Vulpix House  210    Triple
#> 548 Wilkerson       Deon Ent First Year Vulpix House  415    Double
#> 553    Fuller      Jesus Ent First Year Vulpix House  303    Double
#> 567  Schaefer    Cameron Ent First Year Vulpix House  402    Triple
#>     Citizenship_DESC        DOB                      Email
#> 114         Domestic   7/5/2000   lrandall@pokéacademy.edu
#> 139         Domestic   6/5/1992     rwyatt@pokéacademy.edu
#> 143         Domestic  4/28/2004   mbradley@pokéacademy.edu
#> 327    International  4/26/1997    jibarra@pokéacademy.edu
#> 349         Domestic  6/26/1996    latkins@pokéacademy.edu
#> 356         Domestic  2/17/1998   ssanford@pokéacademy.edu
#> 370         Domestic  6/17/2000      jkidd@pokéacademy.edu
#> 400         Domestic  4/26/2003    ajordan@pokéacademy.edu
#> 441         Domestic   4/8/1999    jlozano@pokéacademy.edu
#> 449         Domestic  12/3/1996      cruiz@pokéacademy.edu
#> 465         Domestic  1/20/1999  jarellano@pokéacademy.edu
#> 492         Domestic 12/15/2000    dmercer@pokéacademy.edu
#> 520    International  8/19/2002    kmartin@pokéacademy.edu
#> 522         Domestic  10/5/1997       kkey@pokéacademy.edu
#> 538         Domestic   8/3/2002     kayala@pokéacademy.edu
#> 548         Domestic 12/26/1993 dwilkerson@pokéacademy.edu
#> 553         Domestic   4/4/1998    jfuller@pokéacademy.edu
#> 567    International  8/30/2000  cschaefer@pokéacademy.edu
#> 
#> $`Wailord House.Ent First Year`
#>     Last_Name First_Name   Student_Type          Hall Room Room_Type
#> 45        Liu    Brianna Ent First Year Wailord House  310    Single
#> 61       Todd     Sierra Ent First Year Wailord House  109 Quadruple
#> 115    Porter       Bret Ent First Year Wailord House  402 Quadruple
#> 165    Lozano     Nathen Ent First Year Wailord House  412 Quadruple
#> 216  Chandler      Kenya Ent First Year Wailord House  208    Single
#> 225      Hess      Alina Ent First Year Wailord House  209    Triple
#> 247    Gamble     Kolton Ent First Year Wailord House  504    Double
#> 284     Gomez    Anthony Ent First Year Wailord House  205    Single
#> 348   Benitez     Leslie Ent First Year Wailord House  301    Triple
#> 380    Walton         Ty Ent First Year Wailord House  405    Single
#> 384     Munoz     Kellie Ent First Year Wailord House  106    Triple
#> 484   Maxwell      Lloyd Ent First Year Wailord House  312    Single
#> 487     Roman      Ashly Ent First Year Wailord House  416 Quadruple
#> 535   Skinner    Grayson Ent First Year Wailord House  209    Single
#> 547   Mendoza      Greta Ent First Year Wailord House  311    Single
#>     Citizenship_DESC        DOB                     Email
#> 45     International  9/26/1994      bliu@pokéacademy.edu
#> 61          Domestic  2/27/1990     stodd@pokéacademy.edu
#> 115         Domestic  6/24/1992   bporter@pokéacademy.edu
#> 165    International  12/5/2002   nlozano@pokéacademy.edu
#> 216         Domestic  6/14/1993 kchandler@pokéacademy.edu
#> 225         Domestic  2/20/1996     ahess@pokéacademy.edu
#> 247         Domestic 12/31/2003   kgamble@pokéacademy.edu
#> 284         Domestic   2/4/1998    agomez@pokéacademy.edu
#> 348         Domestic  9/15/2003  lbenitez@pokéacademy.edu
#> 380         Domestic  1/11/1990   twalton@pokéacademy.edu
#> 384         Domestic   2/2/2001    kmunoz@pokéacademy.edu
#> 484         Domestic  2/24/2003  lmaxwell@pokéacademy.edu
#> 487         Domestic   5/3/2006    aroman@pokéacademy.edu
#> 535    International 10/16/2005  gskinner@pokéacademy.edu
#> 547         Domestic  7/12/1999  gmendoza@pokéacademy.edu
#> 
#> $`Zapdos House.Ent First Year`
#>     Last_Name First_Name   Student_Type         Hall Room Room_Type
#> 26    Barrera    Kristin Ent First Year Zapdos House  311    Triple
#> 52    Salazar     Hudson Ent First Year Zapdos House  411    Triple
#> 78      Brady     Holden Ent First Year Zapdos House  201 Quadruple
#> 213     Owens     Celina Ent First Year Zapdos House  408 Quadruple
#> 236    Chaney    Rasheed Ent First Year Zapdos House  306    Triple
#> 268     Black Alessandro Ent First Year Zapdos House  412    Triple
#> 382     Myers   Kiersten Ent First Year Zapdos House  215 Quadruple
#> 551     Eaton     Harold Ent First Year Zapdos House  405 Quadruple
#>     Citizenship_DESC        DOB                    Email
#> 26     International  8/14/1997 kbarrera@pokéacademy.edu
#> 52     International  5/31/1996 hsalazar@pokéacademy.edu
#> 78     International 11/13/2005   hbrady@pokéacademy.edu
#> 213         Domestic 10/18/1990   cowens@pokéacademy.edu
#> 236         Domestic 10/29/2003  rchaney@pokéacademy.edu
#> 268         Domestic  1/24/2002   ablack@pokéacademy.edu
#> 382         Domestic   5/2/1998   kmyers@pokéacademy.edu
#> 551         Domestic  7/25/1996   heaton@pokéacademy.edu
#> 
#> $`Articuno House.Ent Transfer`
#>     Last_Name First_Name Student_Type           Hall Room Room_Type
#> 276   Preston    Vicente Ent Transfer Articuno House  308    Double
#> 294      Gray       Dale Ent Transfer Articuno House  302    Triple
#> 304    Horton     Ronald Ent Transfer Articuno House  307    Double
#> 569   Ellison     Tyrone Ent Transfer Articuno House  312 Quadruple
#>     Citizenship_DESC       DOB                    Email
#> 276         Domestic 1/31/1996 vpreston@pokéacademy.edu
#> 294         Domestic 9/20/1995    dgray@pokéacademy.edu
#> 304         Domestic 1/18/1996  rhorton@pokéacademy.edu
#> 569         Domestic 2/22/1998 tellison@pokéacademy.edu
#> 
#> $`Bayleef House.Ent Transfer`
#>     Last_Name First_Name Student_Type          Hall Room Room_Type
#> 192     Cline    Shannon Ent Transfer Bayleef House  511 Quadruple
#> 227    Lucero    Nikolas Ent Transfer Bayleef House  403 Quadruple
#> 273    Graham    Mariano Ent Transfer Bayleef House  214    Double
#>     Citizenship_DESC        DOB                   Email
#> 192         Domestic 12/19/2002  scline@pokéacademy.edu
#> 227         Domestic 12/30/1992 nlucero@pokéacademy.edu
#> 273         Domestic  5/23/2006 mgraham@pokéacademy.edu
#> 
#> $`Bulbasaur House.Ent Transfer`
#>     Last_Name First_Name Student_Type            Hall Room Room_Type
#> 81      Nolan     Meagan Ent Transfer Bulbasaur House  506 Quadruple
#> 406  Woodward     Rafael Ent Transfer Bulbasaur House  313    Triple
#>     Citizenship_DESC       DOB                     Email
#> 81          Domestic  7/8/2004    mnolan@pokéacademy.edu
#> 406    International 6/18/2003 rwoodward@pokéacademy.edu
#> 
#> $`Caterpie House.Ent Transfer`
#>     Last_Name First_Name Student_Type           Hall Room Room_Type
#> 399     Baker      Gaige Ent Transfer Caterpie House  417    Triple
#>     Citizenship_DESC      DOB                  Email
#> 399         Domestic 7/1/1996 gbaker@pokéacademy.edu
#> 
#> $`Charmander House.Ent Transfer`
#>     Last_Name First_Name Student_Type             Hall Room Room_Type
#> 312    Duarte  Jefferson Ent Transfer Charmander House  508    Triple
#> 443    Hebert    Kennedy Ent Transfer Charmander House  108 Quadruple
#> 587     Bruce      Elian Ent Transfer Charmander House  511    Double
#>     Citizenship_DESC        DOB                   Email
#> 312    International   9/1/2000 jduarte@pokéacademy.edu
#> 443    International  1/31/2003 khebert@pokéacademy.edu
#> 587         Domestic 11/16/1996  ebruce@pokéacademy.edu
#> 
#> $`Clefairy House.Ent Transfer`
#>     Last_Name First_Name Student_Type           Hall Room Room_Type
#> 116    Dodson     Stuart Ent Transfer Clefairy House  212 Quadruple
#>     Citizenship_DESC       DOB                   Email
#> 116    International 3/19/2006 sdodson@pokéacademy.edu
#> 
#> $`Cubone House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 134    Hurley     Izaiah Ent Transfer Cubone House  210    Triple
#> 282    Davies     Jessie Ent Transfer Cubone House  109    Triple
#> 560    Mccann        Lea Ent Transfer Cubone House  214    Single
#>     Citizenship_DESC        DOB                   Email
#> 134         Domestic 12/27/1993 ihurley@pokéacademy.edu
#> 282    International  5/23/2001 jdavies@pokéacademy.edu
#> 560         Domestic  2/18/2004 lmccann@pokéacademy.edu
#> 
#> $`Cyndaquil House.Ent Transfer`
#>     Last_Name First_Name Student_Type            Hall Room Room_Type
#> 140    Finley        Eva Ent Transfer Cyndaquil House  507    Double
#> 371 Mcfarland     Tyreek Ent Transfer Cyndaquil House  411    Double
#> 495   Goodwin       Anne Ent Transfer Cyndaquil House  211 Quadruple
#>     Citizenship_DESC       DOB                      Email
#> 140         Domestic 1/25/2000    efinley@pokéacademy.edu
#> 371         Domestic  5/8/2006 tmcfarland@pokéacademy.edu
#> 495         Domestic 9/21/2004   agoodwin@pokéacademy.edu
#> 
#> $`Ditto House.Ent Transfer`
#>      Last_Name First_Name Student_Type        Hall Room Room_Type
#> 8       Ibarra     Lillie Ent Transfer Ditto House  103    Triple
#> 125 Montgomery      Laila Ent Transfer Ditto House  305 Quadruple
#>     Citizenship_DESC        DOB                       Email
#> 8      International  3/23/2000     libarra@pokéacademy.edu
#> 125         Domestic 12/14/1992 lmontgomery@pokéacademy.edu
#> 
#> $`Farfetch'd House.Ent Transfer`
#>     Last_Name First_Name Student_Type             Hall Room Room_Type
#> 345     Horne       Lori Ent Transfer Farfetch'd House  208 Quadruple
#>     Citizenship_DESC       DOB                  Email
#> 345         Domestic 8/29/2003 lhorne@pokéacademy.edu
#> 
#> $`Gengar House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 169    Kelley     Audrey Ent Transfer Gengar House  507    Single
#> 244    Campos   Jennifer Ent Transfer Gengar House  105    Double
#> 256    Zuniga       Alex Ent Transfer Gengar House  402 Quadruple
#> 290    Brooks      Lilly Ent Transfer Gengar House  406    Double
#> 299    Ibarra   Isabelle Ent Transfer Gengar House  502    Triple
#> 358    Ortega       Toni Ent Transfer Gengar House  414    Double
#>     Citizenship_DESC       DOB                   Email
#> 169         Domestic  9/5/2006 akelley@pokéacademy.edu
#> 244    International 3/19/1995 jcampos@pokéacademy.edu
#> 256         Domestic 12/2/1991 azuniga@pokéacademy.edu
#> 290         Domestic 7/27/2006 lbrooks@pokéacademy.edu
#> 299         Domestic 7/12/2001 iibarra@pokéacademy.edu
#> 358         Domestic 2/25/2000 tortega@pokéacademy.edu
#> 
#> $`Ho-Oh House.Ent Transfer`
#>      Last_Name First_Name Student_Type        Hall Room Room_Type
#> 123      Haney     Alayna Ent Transfer Ho-Oh House  309    Double
#> 196    Summers         Bo Ent Transfer Ho-Oh House  306 Quadruple
#> 303      Estes    Raphael Ent Transfer Ho-Oh House  301    Single
#> 350    Hickman    Cecilia Ent Transfer Ho-Oh House  308    Single
#> 395 Montgomery    Jocelyn Ent Transfer Ho-Oh House  201    Triple
#> 445      Wyatt      Zaria Ent Transfer Ho-Oh House  502    Triple
#> 506      Gould      Jaron Ent Transfer Ho-Oh House  310    Double
#>     Citizenship_DESC        DOB                       Email
#> 123         Domestic   1/7/2003      ahaney@pokéacademy.edu
#> 196    International 11/16/1999    bsummers@pokéacademy.edu
#> 303         Domestic  7/26/1993      restes@pokéacademy.edu
#> 350         Domestic   9/3/1999    chickman@pokéacademy.edu
#> 395         Domestic  4/11/2005 jmontgomery@pokéacademy.edu
#> 445         Domestic  9/28/1995      zwyatt@pokéacademy.edu
#> 506         Domestic  11/4/1994      jgould@pokéacademy.edu
#> 
#> $`Ivysaur House.Ent Transfer`
#>     Last_Name First_Name Student_Type          Hall Room Room_Type
#> 164    Brooks    Quintin Ent Transfer Ivysaur House  502 Quadruple
#> 292    Horton      Jacey Ent Transfer Ivysaur House  210    Single
#> 301   Nielsen    Cordell Ent Transfer Ivysaur House  310 Quadruple
#> 503     Avila      Corey Ent Transfer Ivysaur House  310    Triple
#> 531   Ballard    Estevan Ent Transfer Ivysaur House  204    Single
#>     Citizenship_DESC        DOB                    Email
#> 164    International  2/27/2006  qbrooks@pokéacademy.edu
#> 292    International   3/9/1998  jhorton@pokéacademy.edu
#> 301    International  6/16/2003 cnielsen@pokéacademy.edu
#> 503         Domestic 10/14/2005   cavila@pokéacademy.edu
#> 531         Domestic 10/29/2004 eballard@pokéacademy.edu
#> 
#> $`Leafeon House.Ent Transfer`
#>     Last_Name First_Name Student_Type          Hall Room Room_Type
#> 20  Hendricks      Jesse Ent Transfer Leafeon House  109    Triple
#> 456    Robles      Diane Ent Transfer Leafeon House  405    Double
#> 516   Webster     Lauryn Ent Transfer Leafeon House  206    Double
#>     Citizenship_DESC       DOB                      Email
#> 20          Domestic 6/25/1991 jhendricks@pokéacademy.edu
#> 456    International  9/3/1991    drobles@pokéacademy.edu
#> 516         Domestic 4/18/1999   lwebster@pokéacademy.edu
#> 
#> $`Lickitung House.Ent Transfer`
#>      Last_Name First_Name Student_Type            Hall Room Room_Type
#> 353 Mclaughlin    Carlton Ent Transfer Lickitung House  106    Double
#> 424     Davies     Katlyn Ent Transfer Lickitung House  215    Single
#> 585       Long    Katlynn Ent Transfer Lickitung House  110 Quadruple
#>     Citizenship_DESC       DOB                       Email
#> 353         Domestic  5/3/2001 cmclaughlin@pokéacademy.edu
#> 424         Domestic  6/3/1998     kdavies@pokéacademy.edu
#> 585         Domestic 5/24/1997       klong@pokéacademy.edu
#> 
#> $`Luxio House.Ent Transfer`
#>     Last_Name First_Name Student_Type        Hall Room Room_Type
#> 372     Allen       Lexi Ent Transfer Luxio House  110 Quadruple
#> 379  Morrison    Orlando Ent Transfer Luxio House  405 Quadruple
#>     Citizenship_DESC       DOB                     Email
#> 372         Domestic 5/25/1998    lallen@pokéacademy.edu
#> 379         Domestic 4/13/1994 omorrison@pokéacademy.edu
#> 
#> $`Mew House.Ent Transfer`
#>      Last_Name First_Name Student_Type      Hall Room Room_Type
#> 162    Fischer     Juliet Ent Transfer Mew House  209    Double
#> 191      Curry    Brayden Ent Transfer Mew House  206 Quadruple
#> 197 Richardson     Darius Ent Transfer Mew House  214    Single
#> 386      Mckay       Lila Ent Transfer Mew House  106 Quadruple
#>     Citizenship_DESC        DOB                       Email
#> 162         Domestic   2/1/2001    jfischer@pokéacademy.edu
#> 191         Domestic 12/23/1998      bcurry@pokéacademy.edu
#> 197         Domestic   8/9/1994 drichardson@pokéacademy.edu
#> 386         Domestic 11/24/2000      lmckay@pokéacademy.edu
#> 
#> $`Moltres House.Ent Transfer`
#>     Last_Name First_Name Student_Type          Hall Room Room_Type
#> 411   Whitney     Joshua Ent Transfer Moltres House  209 Quadruple
#> 471    Zuniga    William Ent Transfer Moltres House  108    Double
#> 472     Morse    Caitlyn Ent Transfer Moltres House  207 Quadruple
#>     Citizenship_DESC        DOB                    Email
#> 411         Domestic  5/26/1996 jwhitney@pokéacademy.edu
#> 471         Domestic   1/9/2003  wzuniga@pokéacademy.edu
#> 472         Domestic 11/23/1991   cmorse@pokéacademy.edu
#> 
#> $`Mudkip House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 281      Knox   Samantha Ent Transfer Mudkip House  307    Triple
#> 549   Walters    Breonna Ent Transfer Mudkip House  304    Single
#> 594   Leonard    Phoenix Ent Transfer Mudkip House  307    Triple
#>     Citizenship_DESC       DOB                    Email
#> 281    International  3/7/2006    sknox@pokéacademy.edu
#> 549         Domestic 4/11/2006 bwalters@pokéacademy.edu
#> 594    International 1/23/1992 pleonard@pokéacademy.edu
#> 
#> $`Oddish House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 96      Ellis      Jayde Ent Transfer Oddish House  507    Double
#> 586  Phillips     Hailie Ent Transfer Oddish House  304    Double
#>     Citizenship_DESC       DOB                     Email
#> 96     International 4/14/2003    jellis@pokéacademy.edu
#> 586         Domestic 1/14/2003 hphillips@pokéacademy.edu
#> 
#> $`Pidgey House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 22      Gates   Kiersten Ent Transfer Pidgey House  413 Quadruple
#> 246        Li     Donnie Ent Transfer Pidgey House  206    Single
#> 359       Gay      Pablo Ent Transfer Pidgey House  305    Single
#> 397   Herrera       Anna Ent Transfer Pidgey House  505    Double
#>     Citizenship_DESC        DOB                    Email
#> 22     International 11/23/1993   kgates@pokéacademy.edu
#> 246         Domestic  6/29/1997      dli@pokéacademy.edu
#> 359         Domestic  4/29/1992     pgay@pokéacademy.edu
#> 397         Domestic  9/23/1997 aherrera@pokéacademy.edu
#> 
#> $`Pikachu Hall.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 182   Benitez     Damian Ent Transfer Pikachu Hall  106    Double
#> 234   Hickman      Dante Ent Transfer Pikachu Hall  102    Double
#> 588      Lane Alessandro Ent Transfer Pikachu Hall  213    Double
#> 591    Benton     Kelsey Ent Transfer Pikachu Hall  307    Single
#>     Citizenship_DESC       DOB                    Email
#> 182         Domestic  7/1/1991 dbenitez@pokéacademy.edu
#> 234         Domestic  8/3/1994 dhickman@pokéacademy.edu
#> 588         Domestic 3/26/2000    alane@pokéacademy.edu
#> 591    International 3/10/2004  kbenton@pokéacademy.edu
#> 
#> $`Piplup House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 16     Graves    Gabriel Ent Transfer Piplup House  101    Single
#> 392    Strong      Renee Ent Transfer Piplup House  110    Double
#> 404     Walsh   Mercedes Ent Transfer Piplup House  109    Triple
#> 426     Duran     Juliet Ent Transfer Piplup House  104 Quadruple
#> 577    Valdez    Marisol Ent Transfer Piplup House  204 Quadruple
#>     Citizenship_DESC       DOB                   Email
#> 16          Domestic 2/24/2004 ggraves@pokéacademy.edu
#> 392         Domestic 7/19/2002 rstrong@pokéacademy.edu
#> 404         Domestic 9/24/1996  mwalsh@pokéacademy.edu
#> 426    International 3/10/1995  jduran@pokéacademy.edu
#> 577         Domestic 4/27/1990 mvaldez@pokéacademy.edu
#> 
#> $`Raichu House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 65     Forbes      Aliya Ent Transfer Raichu House  502    Double
#> 451     Floyd        Mya Ent Transfer Raichu House  206    Triple
#>     Citizenship_DESC       DOB                   Email
#> 65          Domestic 7/24/1996 aforbes@pokéacademy.edu
#> 451         Domestic  9/2/2005  mfloyd@pokéacademy.edu
#> 
#> $`Regice House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 67     Hudson    Maranda Ent Transfer Regice House  108    Single
#> 119   Proctor     Albert Ent Transfer Regice House  409    Triple
#> 149      Lang     Santos Ent Transfer Regice House  215 Quadruple
#> 220   Gilbert       Eric Ent Transfer Regice House  205    Double
#> 589      Lang     Daisha Ent Transfer Regice House  207    Double
#>     Citizenship_DESC       DOB                    Email
#> 67          Domestic 9/22/1999  mhudson@pokéacademy.edu
#> 119         Domestic 7/14/1996 aproctor@pokéacademy.edu
#> 149    International 6/16/1992    slang@pokéacademy.edu
#> 220         Domestic  2/5/2001 egilbert@pokéacademy.edu
#> 589         Domestic 4/30/1997    dlang@pokéacademy.edu
#> 
#> $`Rowlet House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 263    Savage     Edward Ent Transfer Rowlet House  202 Quadruple
#> 375      Dunn    Chelsea Ent Transfer Rowlet House  306    Triple
#>     Citizenship_DESC       DOB                   Email
#> 263         Domestic 8/13/1991 esavage@pokéacademy.edu
#> 375         Domestic 4/16/1991   cdunn@pokéacademy.edu
#> 
#> $`Spoink House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 490   Stanley    Kirstin Ent Transfer Spoink House  503 Quadruple
#>     Citizenship_DESC       DOB                    Email
#> 490         Domestic 2/22/1999 kstanley@pokéacademy.edu
#> 
#> $`Sylveon House.Ent Transfer`
#>      Last_Name First_Name Student_Type          Hall Room Room_Type
#> 93     Bennett     Sophia Ent Transfer Sylveon House  404    Triple
#> 171 Hutchinson      Maria Ent Transfer Sylveon House  305    Single
#> 189      Welch      Ariel Ent Transfer Sylveon House  213    Triple
#> 230   Phillips      Abril Ent Transfer Sylveon House  302    Double
#> 298       Long       Kaia Ent Transfer Sylveon House  109    Single
#> 302  Maldonado     Darian Ent Transfer Sylveon House  106    Double
#> 442      Joyce     Davion Ent Transfer Sylveon House  206    Double
#>     Citizenship_DESC       DOB                       Email
#> 93          Domestic  3/4/2001    sbennett@pokéacademy.edu
#> 171    International  9/6/2001 mhutchinson@pokéacademy.edu
#> 189    International 3/20/1995      awelch@pokéacademy.edu
#> 230         Domestic  1/1/1992   aphillips@pokéacademy.edu
#> 298         Domestic 1/17/2003       klong@pokéacademy.edu
#> 302    International 7/22/1999  dmaldonado@pokéacademy.edu
#> 442    International 3/10/1990      djoyce@pokéacademy.edu
#> 
#> $`Togepi House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 231    Campos       Kyra Ent Transfer Togepi House  413 Quadruple
#> 357   Charles        Zoe Ent Transfer Togepi House  213 Quadruple
#>     Citizenship_DESC       DOB                    Email
#> 231         Domestic 10/3/1998  kcampos@pokéacademy.edu
#> 357    International  7/9/2003 zcharles@pokéacademy.edu
#> 
#> $`Torterra House.Ent Transfer`
#>     Last_Name First_Name Student_Type           Hall Room Room_Type
#> 18   Gallegos     Ernest Ent Transfer Torterra House  212    Triple
#> 190   Manning    Trenton Ent Transfer Torterra House  307    Double
#> 444    Gaines       Kaia Ent Transfer Torterra House  215    Triple
#>     Citizenship_DESC       DOB                     Email
#> 18     International 11/3/2006 egallegos@pokéacademy.edu
#> 190         Domestic 5/30/1998  tmanning@pokéacademy.edu
#> 444         Domestic 8/28/1992   kgaines@pokéacademy.edu
#> 
#> $`Umbreon House.Ent Transfer`
#>      Last_Name First_Name Student_Type          Hall Room Room_Type
#> 50     Gilmore       Liam Ent Transfer Umbreon House  404    Double
#> 88        Howe    Aryanna Ent Transfer Umbreon House  107    Double
#> 130    Krueger     Travon Ent Transfer Umbreon House  216    Double
#> 339      Stark    Rasheed Ent Transfer Umbreon House  209    Double
#> 482    Benitez       Deon Ent Transfer Umbreon House  308    Single
#> 491  Wilkinson    Emanuel Ent Transfer Umbreon House  304 Quadruple
#> 532 Williamson     Adrian Ent Transfer Umbreon House  414    Double
#>     Citizenship_DESC        DOB                       Email
#> 50          Domestic  1/25/1991    lgilmore@pokéacademy.edu
#> 88     International  5/15/2006       ahowe@pokéacademy.edu
#> 130         Domestic   9/9/2000    tkrueger@pokéacademy.edu
#> 339         Domestic 10/25/1994      rstark@pokéacademy.edu
#> 482         Domestic   5/4/1994    dbenitez@pokéacademy.edu
#> 491         Domestic  8/11/1994  ewilkinson@pokéacademy.edu
#> 532         Domestic  8/26/2001 awilliamson@pokéacademy.edu
#> 
#> $`Vulpix House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 124    Gamble   Giovanny Ent Transfer Vulpix House  404 Quadruple
#> 180    Crosby    Rogelio Ent Transfer Vulpix House  504 Quadruple
#> 321    Rhodes    Kaylynn Ent Transfer Vulpix House  201    Single
#> 412   Stanley    Dominik Ent Transfer Vulpix House  505 Quadruple
#>     Citizenship_DESC        DOB                    Email
#> 124         Domestic  8/25/1993  ggamble@pokéacademy.edu
#> 180         Domestic   7/3/2000  rcrosby@pokéacademy.edu
#> 321         Domestic  8/25/2002  krhodes@pokéacademy.edu
#> 412    International 12/28/1996 dstanley@pokéacademy.edu
#> 
#> $`Wailord House.Ent Transfer`
#>     Last_Name First_Name Student_Type          Hall Room Room_Type
#> 37     Lester     Hayden Ent Transfer Wailord House  304    Single
#> 64    Lindsey      Devon Ent Transfer Wailord House  408    Single
#> 206    Nelson     Lonnie Ent Transfer Wailord House  311    Triple
#> 463  Santiago      Rohan Ent Transfer Wailord House  210    Single
#> 579   Jimenez      Halie Ent Transfer Wailord House  503    Single
#>     Citizenship_DESC        DOB                     Email
#> 37     International 12/21/2005   hlester@pokéacademy.edu
#> 64          Domestic 11/29/2006  dlindsey@pokéacademy.edu
#> 206         Domestic  8/21/1990   lnelson@pokéacademy.edu
#> 463         Domestic 11/27/1990 rsantiago@pokéacademy.edu
#> 579         Domestic  7/26/1991  hjimenez@pokéacademy.edu
#> 
#> $`Zapdos House.Ent Transfer`
#>     Last_Name First_Name Student_Type         Hall Room Room_Type
#> 21     Krause      Daisy Ent Transfer Zapdos House  308    Single
#> 57      Garza    Tiffany Ent Transfer Zapdos House  302    Single
#> 245    Lawson   Lawrence Ent Transfer Zapdos House  410 Quadruple
#> 266      Ford       Alan Ent Transfer Zapdos House  203 Quadruple
#> 436    Zuniga     Ayanna Ent Transfer Zapdos House  408 Quadruple
#>     Citizenship_DESC       DOB                   Email
#> 21     International 6/25/1992 dkrause@pokéacademy.edu
#> 57     International  4/7/2005  tgarza@pokéacademy.edu
#> 245         Domestic 3/30/1993 llawson@pokéacademy.edu
#> 266         Domestic  4/6/2002   aford@pokéacademy.edu
#> 436         Domestic 8/27/1997 azuniga@pokéacademy.edu
```

## Exporting data

The `export_data` function can be used to export a list of data frames
into multiple different Google sheets. The usage can be seen below, but
the code will not be run in order to avoid writing to a ton of different
Google sheets.

``` r
export_data(split_data)
```
