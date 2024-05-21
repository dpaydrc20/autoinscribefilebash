#!/bin/bash

# Check if the file path argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path="$1"
address="DEXKkt6KVzowBHa2TQkkrh1wZ2EJvhwz2V"
repetitions=300

# Run the mint command once
echo "Starting inscribing process..."
node . mint $address "$file_path"

# Repeat the wallet sync process
for ((i=1; i<=$repetitions; i++)); do
    echo "Wallet sync iteration $i..."
    node . wallet sync
    sleep 160
done

echo "Script completed."
