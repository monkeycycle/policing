# =================================================================
# This file configures the project by specifying filenames, loading
# packages and setting up some project-specific variables.
# =================================================================

initialize_startr(
  title = 'policing',
  author = 'Michael Pereira <mpereira@freepress.mb.ca>',
  timezone = 'America/Winnipeg',
  should_render_notebook = TRUE,
  should_process_data = TRUE,
  should_timestamp_output_files = FALSE,
  packages = c(
    'tidyverse', 'glue', 'lubridate', 'readxl', 'feather',
    'scales', 'knitr', 'rvest', 'janitor', 'zoo',
    "readr", "DT", "dotenv",
    "prettydoc", "plotly", "splitstackshape",
    "ggtext", "showtext", "stringr"
    # 'sf', 'tidymodels',
    # 'gganimate', 'tgamtheme',
    # 'cansim', 'cancensus'
  )
)

time_pause <- .5
font_add_google("Open Sans")
last_update_timestamp <- Sys.Date()

# Data files
wps_releases_2018_2021.raw.file <- dir_data_raw("WFP - WPS Missing PIO - wps-press-releases.csv")
wps_pressers_2018_2021.raw.file <- dir_data_raw("WFP - WPS Missing PIO - wps-press-conferences.csv")
wps_annual_reports.raw.file <- dir_data_raw("wps_annual_reports.xlsx")
wps_release_headings.raw.file <- dir_data_raw("wps_releases_headings.csv")

ottawa_police_pressers.raw.file <- dir_data_raw("WFP - WPS Missing PIO - ottawa-police-releases.csv")
calgary_police_pressers.raw.file <- dir_data_raw("WFP - WPS Missing PIO - calgary-press-releases.csv")
regina_police_pressers.raw.file <- dir_data_raw("WFP - WPS Missing PIO - regina-police-releases.csv")
saskatoon_police_pressers.raw.file <- dir_data_raw("WFP - WPS Missing PIO - saskatoon-police-releases.csv")
