#' @title Austrian Holiday Generator
#' @description Functions to calculate movable feasts and initialize calendars.

# Function 1: Logic to get holiday dates
get_at_holidays <- function(start_yr, end_yr) {
  if (!requireNamespace("timeDate", quietly = TRUE)) stop("Please install 'timeDate'")
  
  years <- start_yr:end_yr
  
  hols <- lapply(years, function(y) {
    easter <- as.Date(timeDate::Easter(y))
    c(
      as.Date(paste0(y, c("-01-01", "-01-06", "-05-01", "-08-15", "-10-26", "-11-01", "-12-08", "-12-24", "-12-25", "-12-26", "-12-31"))),
      easter + 1,  # Easter Monday
      easter + 39, # Ascension
      easter + 50, # Whit Monday
      easter + 60  # Corpus Christi
    )
  })
  
  as.Date(unlist(hols), origin = "1970-01-01")
}

# Function 2: Logic to create the bizdays calendar
init_at_calendar <- function(start_yr, end_yr) {
  if (!requireNamespace("bizdays", quietly = TRUE)) stop("Please install 'bizdays'")
  
  at_hols <- get_at_holidays(start_yr, end_yr)
  bizdays::create.calendar(name = "Austria", holidays = at_hols, weekdays = c("saturday", "sunday"))
}
