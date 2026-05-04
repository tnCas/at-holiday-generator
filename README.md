A specialized R utility designed to programmatically identify Austrian public holidays. This is particularly useful for analysts requiring high-accuracy date arithmetic for time-series forecasting.

## Core Functionality
The script addresses the complexity of the **Computus** (Easter calculation) to determine movable feasts:
* **Easter Monday**
* **Ascension** (Easter + 39 days)
* **Whit Monday** (Easter + 50 days)
* **Corpus Christi** (Easter + 60 days)

It also includes all fixed national holidays and initializes a `bizdays` calendar object.

## Setup
Ensure the following packages are installed:
```R
install.packages(c("timeDate", "bizdays"))

## Logic Overview
The script calculates the following dates relative to the Western Easter Sunday:
* **Easter Monday**: Easter + 1 day
* **Ascension Day**: Easter + 39 days
* **Whit Monday**: Easter + 50 days
* **Corpus Christi**: Easter + 60 days

## Usage
source("at_holidays.R")

# Example: Calculate working days between two dates
bizdays("2026-05-01", "2026-06-01", "Austria")
