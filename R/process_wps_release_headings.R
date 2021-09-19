
encode_release <-  function(str){


  pr_type = ""
  pr_type = ifelse(grepl("Investigation", str, fixed=TRUE), paste(pr_type, "Investigation", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Update", str, fixed=TRUE), paste(pr_type, "Update", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Arrest", str, fixed=TRUE), paste(pr_type, "Arrest", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Missing Person Located", str, fixed=TRUE), paste(pr_type, "Missing person located", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Public Assistance", str, fixed=TRUE), paste(pr_type, "Public assistance", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Community Notification", str, fixed=TRUE), paste(pr_type, "Community notification", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Public Advisory", str, fixed=TRUE), paste(pr_type, "Public advisory", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Officer Involved Shooting", str, fixed=TRUE), paste(pr_type, "Officer-involved shooting", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Officer-Involved Shooting", str, fixed=TRUE), paste(pr_type, "Officer-involved shooting", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Statement", str, fixed=TRUE), paste(pr_type, "Statement", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Operation", str, fixed=TRUE), paste(pr_type, "Project announcement/update", sep=" - "), pr_type)
  pr_type = ifelse(grepl("OPERATION", str, fixed=TRUE), paste(pr_type, "Project announcement/update", sep=" - "), pr_type)
  pr_type = ifelse(grepl("Project", str, fixed=TRUE), paste(pr_type, "Project announcement/update", sep=" - "), pr_type)
  pr_type = ifelse(grepl("PROJECT", str, fixed=TRUE), paste(pr_type, "Project announcement/update", sep=" - "), pr_type)



  pr_subject = ""
  pr_subject = ifelse(grepl("Drugs", str, fixed=TRUE), paste(pr_subject, "Drugs", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Drug Seizure", str, fixed=TRUE), paste(pr_subject, "Drug seizure", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Homicide", str, fixed=TRUE), paste(pr_subject, "Homicide", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Weapon", str, fixed=TRUE), paste(pr_subject, "Weapon", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Firearms Seizure", str, fixed=TRUE), paste(pr_subject, "Firearm seizure", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Firearm", str, fixed=TRUE), paste(pr_subject, "Firearm", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Theft from Motor Vehicle", str, fixed=TRUE), paste(pr_subject, "Theft from motor vehicle", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Assault with a Weapon", str, fixed=TRUE), paste(pr_subject, "Assault with a weapon", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Break & Enter", str, fixed=TRUE), paste(pr_subject, "Break & enter", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Aggravated Assault", str, fixed=TRUE), paste(pr_subject, "Aggravated assault", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Assault:", str), paste(pr_subject, "Assault", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Assault â", str), paste(pr_subject, "Assault", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Commercial Robbery", str, fixed=TRUE), paste(pr_subject, "Commercial robbery", sep=" - "), pr_subject)

  pr_subject = ifelse(grepl("Scams and Frauds", str, fixed=TRUE), paste(pr_subject, "Fraud", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Fraud", str, fixed=TRUE), paste(pr_subject, "Fraud", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Shooting", str, fixed=TRUE), paste(pr_subject, "Shooting", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Robbery", str, fixed=TRUE), paste(pr_subject, "Robbery", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Serious Assault", str, fixed=TRUE), paste(pr_subject, "Serious assault", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Serious Motor Vehicle Collision", str, fixed=TRUE), paste(pr_subject, "Serious MVC", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Motor Vehicle Collision", str, fixed=TRUE), paste(pr_subject, "MVC", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Police Involved Motor Vehicle Collision", str, fixed=TRUE), paste(pr_subject, "Police-involved MVC", sep=" - "), pr_subject)

  pr_subject = ifelse(grepl("Missing Person", str, fixed=TRUE), paste(pr_subject, "Missing person", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("MISSING PERSON", str, fixed=TRUE), paste(pr_subject, "Missing person", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Arson", str, fixed=TRUE), paste(pr_subject, "Arson", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("High-Risk Sex Offender", str, fixed=TRUE), paste(pr_subject, "High-Risk sex offender", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Convicted Sex Offender", str, fixed=TRUE), paste(pr_subject, "Convicted sex offender", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Child Sexual Abuse", str, fixed=TRUE), paste(pr_subject, "Child sexual abuse", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Sexual Exploitation", str, fixed=TRUE), paste(pr_subject, "Sexual exploitation", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Sexual Assault Suspect", str, fixed=TRUE), paste(pr_subject, "Sexual assault suspect", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Sexual Assaults ", str, fixed=TRUE), paste(pr_subject, "Sexual assaults", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Sexual Assault ", str, fixed=TRUE), paste(pr_subject, "Sexual assault", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Sexual  Assault", str, fixed=TRUE), paste(pr_subject, "Sexual assault", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Sexual Assault:", str, fixed=TRUE), paste(pr_subject, "Sexual assault", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Stabbing", str, fixed=TRUE), paste(pr_subject, "Stabbing", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Suspicious Death", str, fixed=TRUE), paste(pr_subject, "Suspicious death", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Drug Offence", str, fixed=TRUE), paste(pr_subject, "Drug offence", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Stolen Vehicle", str, fixed=TRUE), paste(pr_subject, "Stolen vehicle", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Commercial Robbery", str, fixed=TRUE), paste(pr_subject, "Commercial Robbery", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Assault Peace Officer", str, fixed=TRUE), paste(pr_subject, "Assault peace officer", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Carjacking", str, fixed=TRUE), paste(pr_subject, "Carjacking", sep=" - "), pr_subject)
  pr_subject = ifelse(grepl("Suspicious Incidents", str, fixed=TRUE), paste(pr_subject, "Suspicious incidents", sep=" - "), pr_subject)

  encoded_release = paste(pr_type, ":::", pr_subject, sep="")
  invisible(encoded_release)

}



wps_release_headings.raw <- read_csv(wps_release_headings.raw.file) %>%
  clean_names() %>%
  rename(
    date = heading_2
  ) %>%
  mutate(
    date = gsub(" Media Releases", "", date, fixed=TRUE),
    date = gsub(" Media Release", "", date, fixed=TRUE),
    date = as.Date(date, format="%B %d, %Y"),
    headline_string = paste(heading_3,
                            heading_4,
                            heading_5,
                            heading_6,
                            heading_7,
                            heading_8,
                            heading_9,
                            heading_10,
                            heading_11,
                            heading_12,
                            heading_13,
                            heading_14,
                            sep=" | "),
    headline_string = gsub("| NA", "", headline_string, fixed=TRUE),
    headline_string = gsub(" â ", "", headline_string, fixed=TRUE)
  ) %>%
  mutate(
    multiple_releases = ifelse(grepl("|", headline_string, fixed=TRUE), TRUE, FALSE),
    has_case_number = ifelse(grepl("C([0-9]{2})-", headline_string), TRUE,
                      ifelse(grepl("C([0-9]{2})", headline_string), TRUE,
                      ifelse(grepl("R([0-9]{2})", headline_string), TRUE,
                             FALSE
                             )))
  ) %>%
  mutate(
    release_1 = encode_release(heading_3),
    release_2 = encode_release(heading_4),
    release_3 = encode_release(heading_5),
    release_4 = encode_release(heading_6),
    release_5 = encode_release(heading_7),
    release_6 = encode_release(heading_8),
    release_7 = encode_release(heading_9),
    release_8 = encode_release(heading_10),
    release_9 = encode_release(heading_11),
    release_10 = encode_release(heading_12),
    release_11 = encode_release(heading_13),
    release_12 = encode_release(heading_14),
  ) %>%
  select(
    -heading_3,
    -heading_4,
    -heading_5,
    -heading_6,
    -heading_7,
    -heading_8,
    -heading_9,
    -heading_10,
    -heading_11,
    -heading_12,
    -heading_13,
    -heading_14
  ) %>%
  pivot_longer(
    cols=contains("release_"),
    names_to = "release_number",
    values_to = "encoded_release"
  ) %>%
  filter(
    encoded_release != ":::"
  ) %>%
  mutate(
    encoded_release_ORIG = encoded_release
  ) %>%
  separate(encoded_release, c("type", "subject"), sep=":::") %>%
  mutate(
    type = str_trim(type, side = c("both")),
    type = str_squish(type),
    subject = str_trim(subject, side = "both"),
    subject = str_squish(subject),
    date_month = ifelse(month(date) < 10,
                        paste(year(date), "-0", month(date), "-01", sep=""),
                        paste(year(date), month(date), "-01", sep="")
    ),
    date_year = paste(year(date), "-01-01", sep=""),

    date_month = as.Date(date_month),
    date_year = as.Date(date_year),
    type = ifelse(is.na(type), "Other", type),
    type = ifelse(type == "", "Other", type)
  )


write_feather(wps_release_headings.raw, dir_data_processed('wps_release_headings.feather'))


wps_release_headings <- read_feather(dir_data_processed('wps_release_headings.feather'))


View(wps_release_headings)


wps_release_headings_monthly_type <- wps_release_headings %>%
  group_by(date_month, type) %>%
  summarise(count = n())

wps_release_headings_annual_type <- wps_release_headings %>%
  group_by(date_year, type) %>%
  summarise(count = n())



wps_release_headings_monthly_subject <- wps_release_headings %>%
  group_by(date_month, subject) %>%
  summarise(count = n())

wps_release_headings_annual_subject <- wps_release_headings %>%
  group_by(date_year, subject) %>%
  summarise(count = n())


