import requests
import time
import csv
import re
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np

URL = "https://www.winnipeg.ca/police/press/all_releases.stm"
page = requests.get(URL)


csv_file = open("cached/wps_releases.csv", 'w')
csv_writer = csv.writer(csv_file, delimiter=",")


page_content = BeautifulSoup(page.content, "html.parser")

# Press releases are posted here under the police branch of the Winnipeg website
police_path = "/police/press/"

page_links = page_content.find_all('a', href=True)

# array to hold the press release details we scrape together
d = []


counter = 0

# We're only interested in press links
# under the police branch of city of winnipeg website
for link in page_links:

    counter += 1

    # print(counter)

    # if counter > 10:
    #     break

    if link is None:
        continue

    link_href = link.get("href")

    if link_href.find(police_path) != -1:

        # Get this month's links
        url_year_month = "https://winnipeg.ca" + link_href
        # print(url_year_month)

        page_year_month = requests.get(url_year_month)
        page_year_month_content = BeautifulSoup(page_year_month.content, "html.parser")
        page_year_month_links = page_year_month_content.find_all('a', href=True)

        for link_2 in page_year_month_links:
            if link is None:
                continue

            link_2_href = link_2.get("href")

            if link_2_href.find(police_path) != -1:

                # this is the actual press release
                # Save a copy for reference
                url_year_month_day = "https://winnipeg.ca" + link_2_href

                page_pr = requests.get(url_year_month_day)

                # Get h1 - h4 to find the subject matter
                data = page_pr.text
                soup = BeautifulSoup(data)
                headings = soup.find_all(re.compile('^h[1-6]$'))

                print(url_year_month_day)
                for heading in headings:
                  if((heading.text.strip() != "Was this information helpful?") | (heading.text.strip() != "How can we make this web page better?")):
                    print("|", heading.text.strip())

                print(" ")

                filename_out = link_2_href.replace("/police/press/", "", 1).replace("/", "_").replace(".stm", "", 1).replace(
                    ".aspx", "", 1)

                filepath_out = "cached/" + filename_out + ".html"
                # print(filepath_out)

                with open(filepath_out, "w") as f:
                    f.write(page_pr.text)


                # Append the data frame
                # print(link_2_href)


csv_file.close()
