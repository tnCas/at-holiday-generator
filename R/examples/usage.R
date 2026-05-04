source("R/core_logic.R")
init_at_calendar(2024, 2030)

library(bizdays)
bizdays("2026-01-01", "2026-12-31", "Austria")
