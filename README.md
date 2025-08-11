# Subscriber Cancellations Data Pipeline

This project processes raw subscriber cancellation data and outputs a clean, production-ready dataset. It includes unit tests, logging, and an automated Bash script to update the data pipeline.

---

## 📂 Folder Structure

```
subscriber_cancellations/
├── data/
│   ├── processed/        # Cleaned final dataset (e.g. clean_master_dataset)
│   └── raw/              # Original raw data (e.g. cademycode_updated)
├── logs/                 # Log files for each pipeline run
├── notebooks/            # Jupyter notebooks for development/testing
│   ├── subscriber_cancellations_data_pipeline.ipynb
│   └── subscriber_cancellations_test_pipeline.ipynb
├── src/                  # Source Python scripts
│   ├── subscriber_cancellations_data_pipeline.py
│   └── subscriber_cancellations_test_pipeline.py
├── README.md             # This file
├── run_pipeline.sh       # Bash script to automate pipeline
└── write_up.md           # Detailed explanation of process
```

### Key Files Explained

- `run_pipeline.sh`: Executes the data pipeline with logging
- `subscriber_cancellations_data_pipeline.py`: Main data cleaning and processing script
- `subscriber_cancellations_test_pipeline.py`: Unit tests for validating data transformations
- `README.md`: Project overview and usage instructions

---

## 🚀 Running the Pipeline

1. **Make sure all files are in place:**
   - Raw data should be in `data/raw/`
   - Python scripts should be in `src/`

2. **Open a terminal (Git Bash, WSL, or Linux/macOS) and navigate to the project root directory:**

```bash
cd path/to/subscriber_cancellations
bash run_pipeline.sh
```
### Logs

Log files are automatically generated in the `/logs` directory every time the pipeline runs.

- Example log: `pipeline_2025-08-05.log`
- Contains info on: pipeline steps, successes, warnings, and any errors
