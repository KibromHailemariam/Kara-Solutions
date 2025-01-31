# Task 2 - Data Cleaning and Transformation

## # 1. Data Cleaning

Data cleaning is a critical step in ensuring the quality and consistency of your data before performing any transformations. Below are the key cleaning processes:

### # 1.1. Removing Duplicates

Ensure that there are no duplicate entries in your dataset, which could skew analysis or cause redundancy.

- Use Python libraries like **Pandas** to remove duplicates.

  ```python
  df.drop_duplicates(inplace=True)
  ```

### # 1.2. Handling Missing Values

Handling missing values is essential to avoid data inconsistencies.

- You can fill missing values with appropriate methods like imputation or simply drop the rows with missing values.

  ```python
  df.fillna(value=0, inplace=True)  # Imputation
  df.dropna(inplace=True)  # Drop rows with missing values
  ```

### # 1.3. Standardizing Formats

Ensure that all data follows a consistent format (e.g., date formats, text case).

- Convert columns like dates to a consistent format.

  ```python
  df['date_column'] = pd.to_datetime(df['date_column'], format='%Y-%m-%d')
  ```

### # 1.4. Data Validation

Validate data types and ranges to ensure data consistency. For example, ensure that age is a positive number or prices are within a specific range.

- Example of validating values:

  ```python
  df = df[df['age'] > 0]  # Ensure age is positive
  ```

### # 1.5. Storing Cleaned Data

Once the data is cleaned, it’s time to store it for further processing or analysis.

- You can store the cleaned data in a **local database**, **CSV files**, or in **cloud storage**.

  ```python
  df.to_csv('cleaned_data.csv', index=False)  # Store in CSV
  ```

---

## # 2. DBT for Data Transformation

### # 2.1. Setting Up DBT

Install DBT (Data Build Tool) and set up a DBT project to perform transformations on your cleaned data.

1. **Install DBT**:

   ```bash
   pip install dbt
   ```

2. **Initialize the DBT project**:

   ```bash
   dbt init my_project
   ```

### # 2.2. Defining Models

Create DBT models for data transformation. DBT models are SQL files that define transformations on your data.

- Example of a DBT model (`my_model.sql`):

  ```sql
  select
      column_1,
      column_2,
      sum(column_3) as total_column_3
  from
      {{ ref('cleaned_data') }}
  group by
      column_1, column_2
  ```

### # 2.3. Running DBT Models

Run the DBT models to perform the transformations and load the data into your data warehouse.

```bash
dbt run
```

---

## # 3. Testing and Documentation

### # 3.1. Testing

Use DBT’s testing features to ensure data quality and validate the transformations.

- Run the DBT tests:

  ```bash
  dbt test
  ```

### # 3.2. Documentation

Generate documentation for your DBT project to provide context for the transformations.

- Generate documentation:

  ```bash
  dbt docs generate
  ```

- Serve the documentation locally:

  ```bash
  dbt docs serve
  ```

---

## # 4. Monitoring and Logging

### # 4.1. Logging

Implement logging to track the scraping process, capture errors, and monitor progress.

- Example of basic logging setup in Python:

  ```python
  import logging

  logging.basicConfig(level=logging.INFO)
  logger = logging.getLogger()

  logger.info("Scraping started")
  ```
