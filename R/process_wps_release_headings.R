
encode_release <-  function(str){

  pr_type = case_when(
    grepl("Investigation", str, fixed=FALSE) ~  "Investigation",
    grepl("Update", str, fixed=FALSE) ~  "Update",
    grepl("Arrest", str, fixed=FALSE) ~  "Arrest",
    grepl("Warning", str, fixed=FALSE) ~  "Warning",
    grepl("Missing Person Located", str, fixed=FALSE) ~  "Missing person located",
    grepl("Public Assistance", str, fixed=FALSE) ~  "Public assistance",
    grepl("Community Notification", str, fixed=FALSE) ~  "Community notification",
    grepl("Public Advisory", str, fixed=FALSE) ~  "Public advisory",
    grepl("Officer Involved Shooting", str, fixed=FALSE) ~  "Officer-involved shooting",
    grepl("Officer-Involved Shooting", str, fixed=FALSE) ~  "Officer-involved shooting",
    grepl("Statement", str, fixed=FALSE) ~  "Statement",
    grepl("Operation", str, fixed=FALSE) ~  "Operation/project announcement/update",
    grepl("OPERATION", str, fixed=FALSE) ~  "Operation/project announcement/update",
    grepl("Project", str, fixed=FALSE) ~  "Operation/project announcement/update",
    grepl("PROJECT", str, fixed=FALSE) ~  "Operation/project announcement/update",
    grepl("Charges", str, fixed=FALSE) ~  "Charges",
    TRUE ~  "Other"
  )



  pr_subject = case_when(
    grepl("Drugs", str, fixed=FALSE) ~ "Drugs",
    grepl("Drug Seizure", str, fixed=FALSE) ~ "Drugs",
    grepl("Drug Offence", str, fixed=FALSE) ~ "Drugs",
    grepl("Homicide", str, fixed=FALSE) ~ "Homicide",
    grepl("Weapon", str, fixed=FALSE) ~ "Weapon",
    grepl("Firearms Seizure", str, fixed=FALSE) ~ "Firearms",
    grepl("Firearm", str, fixed=FALSE) ~ "Firearms",
    grepl("Theft from Motor Vehicle", str, fixed=FALSE) ~ "Theft from motor vehicle",
    grepl("Assault with a Weapon", str, fixed=FALSE) ~ "Assault with a weapon",
    grepl("Break & Enter", str, fixed=FALSE) ~ "Break & enter",
    grepl("Aggravated Assault", str, fixed=FALSE) ~ "Aggravated assault",
    grepl("Assault:", str) ~ "Assault",
    grepl("Assault â", str) ~ "Assault",
    grepl("Commercial Robbery", str, fixed=FALSE) ~ "Commercial robbery",
    grepl("Scams and Frauds", str, fixed=FALSE) ~ "Fraud",
    grepl("Fraud", str, fixed=FALSE) ~ "Fraud",
    grepl("Shooting", str, fixed=FALSE) ~ "Shooting",
    grepl("Robbery", str, fixed=FALSE) ~ "Robbery",
    grepl("Serious Assault", str, fixed=FALSE) ~ "Serious assault",
    grepl("Serious Motor Vehicle Collision", str, fixed=FALSE) ~ "MVC",
    grepl("Motor Vehicle Collision", str, fixed=FALSE) ~ "MVC",
    grepl("Police Involved Motor Vehicle Collision", str, fixed=FALSE) ~ "Police-involved MVC",
    grepl("Missing Person", str, fixed=FALSE) ~ "Missing person",
    grepl("MISSING PERSON", str, fixed=FALSE) ~ "Missing person",
    grepl("Arson", str, fixed=FALSE) ~ "Arson",
    grepl("High-Risk Sex Offender", str, fixed=FALSE) ~ "High-Risk sex offender",
    grepl("Convicted Sex Offender", str, fixed=FALSE) ~ "Convicted sex offender",
    grepl("Child Sexual Abuse", str, fixed=FALSE) ~ "Child sexual abuse",
    grepl("Sexual Exploitation", str, fixed=FALSE) ~ "Sexual exploitation",
    grepl("Sexual Assault Suspect", str, fixed=FALSE) ~ "Sexual assault suspect",
    grepl("Sexual Assaults ", str, fixed=FALSE) ~ "Sexual assault",
    grepl("Sexual Assault ", str, fixed=FALSE) ~ "Sexual assault",
    grepl("Sexual  Assault", str, fixed=FALSE) ~ "Sexual assault",
    grepl("Sexual Assault:", str, fixed=FALSE) ~ "Sexual assault",
    grepl("Stabbing", str, fixed=FALSE) ~ "Stabbing",
    grepl("Suspicious Death", str, fixed=FALSE) ~ "Suspicious death",
    grepl("Stolen Vehicle", str, fixed=FALSE) ~ "Stolen vehicle",
    grepl("Commercial Robbery", str, fixed=FALSE) ~ "Commercial Robbery",
    grepl("Assault Peace Officer", str, fixed=FALSE) ~ "Assault peace officer",
    grepl("Carjacking", str, fixed=FALSE) ~ "Carjacking",
    grepl("Suspicious Incidents", str, fixed=FALSE) ~ "Suspicious incidents",
    TRUE ~  "Other"
  )

  encoded_release = paste(pr_type, ":::", pr_subject, sep=" ")
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
    encoded_release != "Other ::: "
  ) %>%
  mutate(
    encoded_release_ORIG = encoded_release
  ) %>%
  separate(encoded_release, c("type", "subject"), sep=":::") %>%
  mutate(
    type = str_trim(type, side = c("both")),
    type = str_squish(type),
    type = gsub("- ", "", type),
    subject = str_trim(subject, side = "both"),
    subject = str_squish(subject),
    subject = gsub("- ", "", subject),
    date_month = ifelse(month(date) < 10,
                        paste(year(date), "-0", month(date), "-01", sep=""),
                        paste(year(date), month(date), "-01", sep="")
    ),
    date_year = paste(year(date), "-01-01", sep=""),

    date_month = as.Date(date_month),
    date_year = as.Date(date_year),
    type = ifelse(is.na(type), "Other", type),
    type = ifelse(type == "", "Other", type)
  ) %>%
  mutate(
    type = factor(type, levels=c(
      "Investigation",
      "Arrest",
      "Charges",
      "Update",
      "Public assistance",
      "Community notification",
      "Public advisory",
      "Warning",
      "Officer-involved shooting",
      "Missing person located",
      "Operation/project announcement/update",
      "Statement",
      "Other"
    )),
    subject = factor(subject, levels=c(
      "Assault",
      "Aggravated assault",
      "Serious assault",
      "Assault peace officer",
      "Shooting",
      "Stabbing",
      "Homicide",
      "Suspicious death",
      "Suspicious incidents",
      "Arson",
      "Break & enter",
      "Theft from motor vehicle",
      "Carjacking",
      "Stolen vehicle",
      "Robbery",
      "Commercial robbery",
      "Drugs",
      "Firearms",
      "Weapon",
      "Fraud",
      "Sexual exploitation",
      "Child sexual abuse",
      "Sexual assault",
      "Sexual assault suspect",
      "Convicted sex offender",
      "High-Risk sex offender",
      "Missing person",
      "MVC",
      "Other"
    ))
  )


write_feather(wps_release_headings.raw, dir_data_processed('wps_release_headings.feather'))


wps_release_headings <- read_feather(dir_data_processed('wps_release_headings.feather'))





types_unique <- unique(wps_release_headings$type)
subject_unique <- unique(wps_release_headings$subject)


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





wps_release_headings_monthly_type_wide <- wps_release_headings_monthly_type %>%
  pivot_wider(names_from="type", names_prefix="", values_from="count" )

wps_release_headings_annual_type_wide <- wps_release_headings_annual_type %>%
  pivot_wider(names_from="type", names_prefix="", values_from="count" )

wps_release_headings_monthly_subject_wide <- wps_release_headings_monthly_subject %>%
  pivot_wider(names_from="subject", names_prefix="", values_from="count" )

wps_release_headings_annual_subject_wide <- wps_release_headings_annual_subject %>%
  pivot_wider(names_from="subject", names_prefix="", values_from="count" )



