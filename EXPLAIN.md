# Oscar Data Scraper and Cleaner - EXPLAIN file

This project scrapes Oscar data, cleans it, and exports it to a CSV file.

## Approach and assumptions 

### 1. **Libraries**
   1.1 The only libraries used were \
   \
   **requests**: to fetch the data from the endpoint. \
   **pandas**: to simplify data manipulatation in a dataframe format. \
   **re**: to manage regular expressions and make it easy to format and manipulate strings. \
   \
   These are well-known, reliable libraries that minimize effort while ensuring robustness.
### 2. **Functions** 
\
   2.1. The first function in the pipeline is the **scrape_oscar_date(base_url)**, in the *oscar_scraper.py* file. 

   - Sends a request to the base_url and retrieves the data present at the endpoint.
   - The JSON data is formatted with the .json() method, and each layer is iterated to get all required columns: film, year, wikipedia_url, oscar_winner, original_budget, and country.
   - The original budget comes from another endpoint present in the details of each movie, so the code iterates inside each one to fetch this column.
   - This process may slow down the code but ensures that every film and budget in the endpoint is retrieved.
   \
   2.2 The next function is **clean_year(year)**, in the *oscar_cleaner.py* file. 

   - Uses a regular expression to find a pattern of exactly 4 digits within the year string.
   - Assumes that any 4-digit pattern present in the year index is the desired data.
   - Returns the first match found in the string as an integer. If no match is found, it returns None.
   \
   2.3 The next fuction is **clean_budget(value, country)**, in the *oscar_cleaner.py* file. 

   - The budget column is the messiest in the dataset, making this function crucial.
   - Takes the country as an argument to simplify currency matching. If the film is from the United States, it assumes the budget is in USD.
   - Any film without a disclosed country is also assumed to have its budget in USD. 
   - If the budget contains a whole number (e.g., $470,000), the function strips out non-numeric characters and formats it as an integer. If the budget contains a magnitude (e.g., $23 million), it multiplies the numbers by the corresponding magnitude (e.g., million = 1,000,000).
   - Calls another function, convert_budget_to_usd(value, budget_currency), which multiplies any value not associated with the United States by the exchange rate as of July 3rd, 2024. It was deemed unnecessary to connect to a forex or exchange API for such small currency diversities. \
   \
   2.4 The last fuction is **export_to_csv(dataframe, filename)**, in the *util.py* file.
   - Uses the pandas df.to_csv method to store the DataFrame (passed as an argument) as a CSV file.
   \
### 3. **General Assumptions** 
   - The function responsible for cleaning the year column assumes that only one pattern of exactly 4 digits will be found in the year string.
   - The function responsible for cleaning the budget assumes that the original budget of every film with the US as the country is in USD.
   - The function responsible for converting the budget to USD only considers a few possibilities for exchange rates.
