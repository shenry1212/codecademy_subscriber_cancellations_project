#!/bin/bash

# Define directories
SRC_DIR="./src"
DATA_DIR="./data/processed"
PROD_DIR="./prod"
LOG_DIR="./logs"

# Define file names
PIPELINE_SCRIPT="subscriber_cancellations_data_pipeline.py"
TEST_SCRIPT="subscriber_cancellations_test_pipeline.py"
LOG_FILE="$LOG_DIR/pipeline.log"

echo "Running pipeline script..."
python "$SRC_DIR/$PIPELINE_SCRIPT"

echo "Running tests..."
python "$SRC_DIR/$TEST_SCRIPT"

# Check if the log file contains 'Update successful'
if grep -q "Update successful" "$LOG_FILE"; then
    echo "Update detected. Copying updated dataset to production directory..."
    cp "$DATA_DIR/clean_master_dataset" "$PROD_DIR/"
    echo "File copied to production."
else
    echo "No update detected. Skipping copy step."
fi

echo "Pipeline completed."
