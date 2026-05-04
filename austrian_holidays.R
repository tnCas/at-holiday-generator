# at-holiday-generator
# Logic for calculating movable Austrian feasts and business calendars

# Required Libraries
if (!require("timeDate")) install.packages("timeDate")
if (!require("bizdays")) install.packages("bizdays")

library(timeDate)
library(bizdays)

# 1. Calculation Functions for Movable Feasts
get_easter_date    <- function(year) as.Date(Easter(year))
get_easter_monday  <- function(year) get_easter_date(year) + 1
get_ascension      <- function(year) get_easter_date(year) + 39
get_whit_monday    <- function(year) get_easter_date(year) + 50
get_corpus_christi <- function(year) get_easter_date(year) + 60

# 2. Configuration
# Sets the range for holiday generation
start_year <- as.numeric(format(Sys.Date(), "%Y"))
end_year   <- start_year + 10

# 3. Generate Holiday List
holiday_list <- lapply(start_year:end_year, function(yr) {
  c(
    as.Date(paste0(yr, "-01-01")), # New Year's Day
    as.Date(paste0(yr, "-01-06")), # Epiphany
    get_easter_monday(yr),         # Easter Monday
    as.Date(paste0(yr, "-05-01")), # Labour Day
    get_ascension(yr),             # Ascension Day
    get_whit_monday(yr),           # Whit Monday
    get_corpus_christi(yr),        # Corpus Christi
    as.Date(paste0(yr, "-08-15")), # Assumption of the Virgin Mary
    as.Date(paste0(yr, "-10-26")), # Austrian National Holiday
    as.Date(paste0(yr, "-11-01")), # All Saints' Day
    as.Date(paste0(yr, "-12-08")), # Immaculate Conception
    as.Date(paste0(yr, "-12-24")), # Christmas Eve
    as.Date(paste0(yr, "-12-25")), # Christmas Day
    as.Date(paste0(yr, "-12-26")), # St. Stephen's Day
    as.Date(paste0(yr, "-12-31"))  # New Year's Eve
  )
})

# Flatten and restore Date class
AT_HOLIDAYS <- as.Date(unlist(holiday_list), origin = "1970-01-01")

# 4. Initialize Custom Calendar
create.calendar(
  name = "Austria", 
  holidays = AT_HOLIDAYS, 
  weekdays = c("saturday", "sunday")
)
