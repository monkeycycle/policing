import requests
import time
import csv
import re
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np


# pages 1 to 925
url_base = "https://reginapolice.ca/news/page/"

counter = 0
for i in range(1, 926, 1):
  url = url_base + str(i) + "/"
  # print(url)

  counter += 1
  if counter > 3:
    break

  page = requests.get(url)

  page_content = BeautifulSoup(page.content, "html.parser")

  release_titles = page_content.find_all('h3')

  for title in release_titles:
    print(title)
    # for link in title.find_all('a', href=True):
    #     print(link.get('href') + "\n")
  # .find_all('a', href=True)

  # print(page_links)

# # We're only interested in press links
# # under the police branch of city of winnipeg website
# for link in page_links:

#     counter += 1

#     # print(counter)

#     # if counter > 10:
#     #     break

#     if link is None:
#         continue

#     link_href = link.get("href")

#     if link_href.find(police_path) != -1:

#         # Get this month's links
#         url_year_month = "https://winnipeg.ca" + link_href
#         # print(url_year_month)

#         page_year_month = requests.get(url_year_month)
#         page_year_month_content = BeautifulSoup(page_year_month.content, "html.parser")
#         page_year_month_links = page_year_month_content.find_all('a', href=True)

#         for link_2 in page_year_month_links:
#             if link is None:
#                 continue

#             link_2_href = link_2.get("href")

#             if link_2_href.find(police_path) != -1:

#                 # this is the actual press release
#                 # Save a copy for reference
#                 url_year_month_day = "https://winnipeg.ca" + link_2_href

#                 print("Downloading:", url_year_month_day)

#                 page_pr = requests.get(url_year_month_day)

#                 filename_out = link_2_href.replace("/police/press/", "", 1).replace("/", "_").replace(".stm", "", 1).replace(
#                     ".aspx", "", 1)

#                 filepath_out = "cached/" + filename_out + ".html"
#                 # print(filepath_out)

#                 with open(filepath_out, "w") as f:
#                     f.write(page_pr.text)


#                 # Append the data frame
#                 # print(link_2_href)



