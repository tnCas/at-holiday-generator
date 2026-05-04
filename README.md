# Austrian Public Holiday Generator for R

![Language](https://img.shields.io/badge/Language-R-blue.svg)
![License](https://img.shields.io/badge/License-OpenSource-green.svg)
![Status](https://img.shields.io/badge/Status-Functional-brightgreen.svg)

A specialized R utility to programmatically identify Austrian public holidays. This tool supports analysts requiring precise date arithmetic for time-series forecasting by accurately determining fixed and movable holidays based on the Christian liturgical calendar.

---

## Core Functionality

The script handles the complexity of **Computus** (Easter date calculation) to determine movable feasts:

- **Easter Monday**
- **Ascension Day** (Easter + 39 days)
- **Whit Monday** (Easter + 50 days)
- **Corpus Christi** (Easter + 60 days)

It also includes all fixed national holidays and initializes a `bizdays` calendar object for business day calculations.

---

## Project Structure

---

## Setup

Ensure R is installed along with the following packages:

```r
install.packages(c("timeDate", "bizdays"))


Holiday Logic Overview
The following fixed national holidays are included by default:

Date	Holiday
January 1	New Year's Day
January 6	Epiphany
May 1	Labour Day
August 15	Assumption of Mary
October 26	Austrian National Holiday
November 1	All Saints' Day
December 8	Immaculate Conception
December 24–26	Christmas Period (Eve, Day, Saint Stephen's Day)
December 31	New Year's Eve
The utility dynamically calculates the following movable feasts relative to Easter Sunday for each year in the specified range:

Holiday	Date Calculation
Easter Monday	Easter Sunday + 1 day
Ascension Day	Easter Sunday + 39 days
Whit Monday	Easter Sunday + 50 days
Corpus Christi	Easter Sunday + 60 days

Usage
Load the core logic and initialize the business calendar:

source("R/core_logic.R")

# Initialize the Austrian business calendar for desired years
init_at_calendar(start_yr = 2024, end_yr = 2035)
Copy
Once initialized, use the bizdays package for business day calculations:

library(bizdays)

# Check if a specific date is a working day
is.workingday("2026-10-26", "Austria") 

# Calculate the number of business days between two dates
bizdays("2026-05-01", "2026-06-01", "Austria")
