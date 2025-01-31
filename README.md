# Task 1 - Data Scraping and Collection Pipeline

## 1. Telegram Scraping

Utilize the Telegram API or write custom scripts to extract data from public Telegram channels relevant to Ethiopian medical businesses.

### Target Telegram Channels:

- [DoctorsET](https://t.me/DoctorsET)
- Chemed Telegram Channel
- [Lobelia for Cosmetics](https://t.me/lobelia4cosmetics)
- [Yetena Weg](https://t.me/yetenaweg)
- [EAHCI](https://t.me/EAHCI)
- More channels from: [TGStat Medicine](https://et.tgstat.com/medicine)

---

## 2. Image Scraping for Object Detection

Collect images from the following Telegram channels for object detection:

- Chemed Telegram Channel
- [Lobelia for Cosmetics](https://t.me/lobelia4cosmetics)

---

## 3. Steps for Scraping

### **Step 1: Install Required Python Packages**

Use the following Python packages for data extraction:

```bash
pip install telethon
```

---

### **Step 2: Develop Telegram Data Extraction Scripts**

- Use **Telethon** to extract messages, images, and other relevant data.
- Alternatively, export content using the Telegram application.

---

### **Step 3: Storing Raw Data**

- **Initial Storage**: Store the raw scraped data in a temporary location before further processing.
  - Options: Local database (SQLite, PostgreSQL) or files (CSV, JSON).

---

### **Step 4: Monitoring and Logging**

- **Logging**: Implement logging to track the scraping process, capture errors, and monitor progress.
- Example logging setup in Python:

```python
import logging

logging.basicConfig(filename="scraper.log", level=logging.INFO,
                    format="%(asctime)s - %(levelname)s - %(message)s")

logging.info("Scraping started...")
```

---

## **Next Steps**

- Data Cleaning & Processing
- Data Analysis & Insights Extraction
- Object Detection Model Training (for images)

---
