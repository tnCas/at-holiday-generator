#' @title Austrian Holiday Generator
#' @description Generates a vector of Austrian holidays and initializes a bizdays calendar.

# Load required libraries
if (!require("timeDate")) install.packages("timeDate")
if (!require("bizdays")) install.packages("bizdays")

library(timeDate)
library(bizdays)

# Calculation Functions
get_easter_monday  <- function(y) as.Date(Easter(y)) + 1
get_ascension      <- function(y) as.Date(Easter(y)) + 39
get_whit_monday    <- function(y) as.Date(Easter(y)) + 50
get_corpus_christi <- function(y) as.Date(Easter(y)) + 60

# Define Year Range
start_year <- 2020
end_year   <- 2030

# Generate Holiday Vector
AT_HOLIDAYS <- as.Date(unlist(lapply(start_year:end_year, function(yr) {
  c(
    as.Date(paste0(yr, "-01-01")), # New Year
    as.Date(paste0(yr, "-01-06")), # Epiphany
    get_easter_monday(yr),
    as.Date(paste0(yr, "-05-01")), # Labour Day
    get_ascension(yr),
    get_whit_monday(yr),
    get_corpus_christi(yr),
    as.Date(paste0(yr, "-08-15")), # Assumption
    as.Date(paste0(yr, "-10-26")), # National Holiday
    as.Date(paste0(yr, "-11-01")), # All Saints
    as.Date(paste0(yr, "-12-08")), # Immaculate Conception
    as.Date(paste0(yr, "-12-24")), # Christmas Eve
    as.Date(paste0(yr, "-12-25")), # Christmas Day
    as.Date(paste0(yr, "-12-26")), # St. Stephen's
    as.Date(paste0(yr, "-12-31"))  # New Year's Eve
  )
})), origin = "1970-01-01")

# Create Calendar Object
create.calendar(
  name = "Austria", 
  holidays = AT_HOLIDAYS, 
  weekdays = c("saturday", "sunday")
)
