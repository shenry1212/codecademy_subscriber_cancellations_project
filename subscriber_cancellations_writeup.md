# 📊 Subscriber Cancellations Data Pipeline – Project Write-Up

This project is a robust end-to-end pipeline that processes raw subscriber cancellation data into a clean, production-ready dataset. It emphasizes automation, reliability, and maintainability through thoughtful use of data cleaning, unit testing, logging, and Bash scripting.

---

## 🧹 Data Cleaning Operations

The raw dataset required several preprocessing steps to ensure consistency and quality:

- **Whitespace and casing normalization:** Trimmed extra spaces and standardized text casing for categorical columns.
- **Missing value handling:** Replaced nulls in critical fields with default values or filtered them out based on context.
- **Date formatting:** Converted all date strings into standard `datetime` objects for easier sorting and filtering.
- **Column renaming:** Applied clear, snake_case naming conventions to all columns for consistency across tools.

These steps were necessary to prevent schema mismatches and ensure reliable downstream use (e.g. in dashboards or reporting).

---

## ✅ Unit Testing

To validate the integrity of data transformations, I implemented unit tests using `unittest`:

- **Schema validation tests** – Ensured that the final DataFrame includes all expected columns.
- **Null value tests** – Checked that critical columns (like `subscription_id`) had no nulls post-cleaning.
- **Data type assertions** – Confirmed that numeric and date columns had the correct types.
- **Transformation logic tests** – Validated any functions applied to columns (e.g., for parsing or cleaning).

Unit tests help catch regression errors early and make the pipeline easier to maintain as the dataset evolves.

---

## ⚙️ Bash Script Automation

I automated the update process with a Bash script (`run_pipeline.sh`), which:

1. Executes the core Python pipeline with logging enabled.
2. Automatically generates a timestamped log file in the `/logs` directory.
3. Provides a single entry point for re-running the full pipeline without needing to manually open scripts.

This improves reproducibility and simplifies the update process for other users or team members.

---

## 🔐 Protecting the Final Database

To avoid corrupting the production-ready output, I added several safeguards:

- The cleaned dataset is written to a separate **`/data/processed`** directory.
- Logs are stored in **`/logs`** with timestamps to enable rollback or debugging if something fails.
- Tests are run independently before the production write step is executed.
- A potential future step (not implemented here) would be version-controlled backups of the cleaned database file in `/prod`.

---

## 💼 Skills Demonstrated

This project showcases the following skills:

- **Data cleaning and wrangling** using Python and pandas
- **Unit testing** to validate transformation logic
- **Error logging** for pipeline transparency
- **Bash scripting** for automation and ease of use
- **SQLite file management**, with optional separation of raw and processed data
