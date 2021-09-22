import requests
import time
import csv
import re
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np


# pages 1 to 84
url_base = "https://saskatoonpolice.ca/news/?page="

counter = 0
for i in range(1, 84, 1):
  url = url_base + str(i) + "/"
  print("\n\n", "scraping: ", url)

  # counter += 1
  # if counter > 3:
  #   break

  page = requests.get(url)

  page_content = BeautifulSoup(page.content, "html.parser")

  release_titles = page_content.find_all('li')

  for title in release_titles:

    for link in title.find_all('a', href=True):
      release_url = link.get('href')
      release_title = link.text

    for date in title.find_all('time'):
      release_date = date.text

      # release = requests.get(release_url)

      print("Release: ", release_title, " ::: ", release_date, " ::: ", release_url)

