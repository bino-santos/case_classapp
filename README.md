# Oscar Data Scraper and Cleaner

This project scrapes Oscar data, cleans it, and exports it to a CSV file.

## Installation

### 1. **Install Python** (version 3.6 or later). 
### 2. **Install dependencies:** \
   2.1. The libraries needed are on the requirements.txt file. User can Install them with "pip install -r requirements.txt" or one by one \
   2.1. The libraries are *pandas* and *requests*. 
### 3. **Usage** \
   3.1. Each python file contains useful functions to scrape, clean and export the oscar data. \
&nbsp;&nbsp;&nbsp;&nbsp;3.1.1. File oscar_scraper.py holds the function scrape_oscar_data(base_url) \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Example: \
\
from oscar_scraper import scrape_oscar_data \
base_url = 'http://oscars.yipitdata.com/' \
df = scrape_oscar_data(base_url) \
\
&nbsp;&nbsp;&nbsp;&nbsp;3.2.1. File oscar_cleaner.py holds the functions clean_budget(value, country) and clean_year(year) \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Example: \
\
from oscar_cleaner import clean_budget, clean_year \
df['year'] = df['year'].apply(clean_year) \
df['cleaned_budget'] = df.apply(lambda row: clean_budget(row['original_budget'], row['country']), axis=1) \
\
In the example above a new column was created so that the original budget column is still in the final dataframe
\
&nbsp;&nbsp;&nbsp;&nbsp;3.3.1. File utils.py holds the function export_to_csv(dataframe, filename) \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Example: \
\
from utils import export_to_csv \
export_to_csv(df, "cleaned_oscar_data.csv") \
\
### 4. **Example File** \
   4.1 Inside the folder provided there is also a file called example.py. This file contains a use example of all the functions cited above. It is intended as a use reference.
### 5. **Attention** \
   5.1 Any python code that uses one or more functions cited above should be saved inside the same folder as the functions code. \
   5.2 To simplify, keep any new code inside the directory oscar_data 
