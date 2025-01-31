

# Data Scraping, Cleaning, and Transformation

## # Task 1 - Data Scraping and Collection Pipeline

### # 1.1. Telegram Scraping

Utilize the Telegram API or write custom scripts to extract data from public Telegram channels relevant to Ethiopian medical businesses.

**Channels to scrape:**
- [DoctorsET](https://t.me/DoctorsET)
- Chemed Telegram Channel
- [lobelia4cosmetics](https://t.me/lobelia4cosmetics)
- [yetenaweg](https://t.me/yetenaweg)
- [EAHCI](https://t.me/EAHCI)
- Additional channels from [TGStat - Medicine](https://et.tgstat.com/medicine)

**Steps:**
1. **Install Required Libraries**:
   - Install `telethon` for scraping Telegram data.

   ```bash
   pip install telethon
   ```

2. **Telegram Authentication**:
   - Use the **Telethon** library to authenticate with the Telegram API.

   ```python
   from telethon import TelegramClient

   api_id = 'your_api_id'
   api_hash = 'your_api_hash'
   phone_number = 'your_phone_number'
   client = TelegramClient('session_name', api_id, api_hash)

   await client.start(phone_number)
   ```

3. **Scrape Messages**:
   - Extract messages from the channels.

   ```python
   from telethon.tl.functions.messages import GetHistoryRequest

   async def scrape_channel(channel_name):
       channel = await client.get_entity(channel_name)
       messages = await client(GetHistoryRequest(peer=channel, limit=500))
       return messages
   ```

4. **Storing Raw Data**:
   - Store scraped messages in a local database or files (e.g., CSV or JSON).

5. **Monitoring and Logging**:
   - Implement logging to track the scraping process and capture errors.

   ```python
   import logging

   logging.basicConfig(level=logging.INFO)
   logger = logging.getLogger()
   logger.info('Starting Telegram scraping process')
   ```

---

## # Task 2 - Data Cleaning and Transformation

### # 2.1. Data Cleaning

Data cleaning is a critical step to ensure that the data is usable for analysis or transformation.

#### # 2.1.1. Removing Duplicates
Ensure that there are no duplicate entries in your dataset.

```python
df.drop_duplicates(inplace=True)
```

#### # 2.1.2. Handling Missing Values
Handle missing values by either filling them or removing rows.

```python
df.fillna(value=0, inplace=True)  # Fill missing values with 0
df.dropna(inplace=True)  # Drop rows with missing values
```

#### # 2.1.3. Standardizing Formats
Ensure that all columns follow a consistent format (e.g., date, case formatting).

```python
df['date_column'] = pd.to_datetime(df['date_column'], format='%Y-%m-%d')
```

#### # 2.1.4. Data Validation
Validate the data to ensure consistency, such as verifying that numerical columns contain valid values.

```python
df = df[df['age'] > 0]  # Ensure positive values for age
```

#### # 2.1.5. Storing Cleaned Data
Store the cleaned data in a desired format (e.g., CSV, database).

```python
df.to_csv('cleaned_data.csv', index=False)
```

### # 2.2. DBT for Data Transformation

DBT (Data Build Tool) is used for data transformation through SQL models.

#### # 2.2.1. Setting Up DBT
1. **Install DBT**:

   ```bash
   pip install dbt
   ```

2. **Initialize the DBT Project**:

   ```bash
   dbt init my_project
   ```

#### # 2.2.2. Defining DBT Models

Create DBT models to transform the data. These models are SQL files that define transformations.

Example DBT model (`my_model.sql`):

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

#### # 2.2.3. Running DBT Models

Run the DBT models to perform transformations and load the data into your data warehouse.

```bash
dbt run
```

### # 2.3. Testing and Documentation

#### # 2.3.1. Testing

Use DBT’s testing functionality to ensure data quality and correctness.

```bash
dbt test
```

#### # 2.3.2. Documentation

Generate documentation to provide context and details about your DBT project.

```bash
dbt docs generate
```

Serve the documentation locally:

```bash
dbt docs serve
```

---

## # 3. Monitoring and Logging

### # 3.1. Logging

Implement logging to capture important events and errors in the scraping and transformation process.

```python
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

logger.info("Process started")
```


