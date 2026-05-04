# at-holiday-calendar
R functions for calculating movable Austrian public holidays and generating custom business calendars for time-series analysis.
# AT Holiday Calendar

This repository provides a programmatic approach to identifying Austrian public holidays, specifically addressing movable feasts based on the Computus (Easter calculation).

## Logic Overview
The script calculates the following dates relative to the Western Easter Sunday:
* **Easter Monday**: Easter + 1 day
* **Ascension Day**: Easter + 39 days
* **Whit Monday**: Easter + 50 days
* **Corpus Christi**: Easter + 60 days

## Usage
The core logic utilizes the `timeDate` package for the base Easter calculation and the `bizdays` package for custom calendar generation. This is particularly useful for energy analysts performing day-ahead market modeling or load forecasting where holiday effects are significant.
