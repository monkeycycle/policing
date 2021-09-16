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
    "prettydoc", "plotly"
    # 'sf', 'tidymodels',
    # 'gganimate', 'tgamtheme',
    # 'cansim', 'cancensus'
  )
)


wps_releases_2018_2021.raw.file <- dir_data_raw("WFP - WPS Missing PIO - wps-press-releases.csv")
wps_pressers_2018_2021.raw.file <- dir_data_raw("WFP - WPS Missing PIO - wps-press-conferences.csv")
