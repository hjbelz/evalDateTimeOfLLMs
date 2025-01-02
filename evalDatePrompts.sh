#!/bin/zsh
# This script runs all date prompts in path $2 agains the model passed in $1

model="$1"
promptPath="$2"

# Check whether model and promptPath were passed
if [ -z "$model" ] || [ -z "$promptPath" ]; then
  echo "ERROR: Please specify a model and a path!"
  exit 1
fi

# Check if 'llm' command exists
if ! command -v llm &>/dev/null; then
  echo "ERROR: 'llm' command not found. Please ensure it is installed."
  exit 1
fi

# Extract first two characters from the last path element
last_element="${promptPath##*/}"    # Extract last path element
prefix="${last_element:0:2}"        # Get the first two characters (example: "01" from path "./01_Unstructured")

# Header and status output 
headline="Running all prompts in $promptPath against model $model"
protocolFile="eval-step$prefix-$model-$(date +%F_%H_%M_%S).log"
echo "$headline ..."
echo "$headline" > "$protocolFile"
echo "-------------------------------------------------------------------------" >> $protocolFile

# Attempt to load a system prompt (first file that matches prefix "SYSTEM*" in the prompt path)
file_path=$(find "$promptPath" -type f -name "SYSTEM*" | head -n 1)

# Check if a matching file was found
if [[ -n "$file_path" ]]; then
  # Read the content of the file into a variable
  systemPrompt=$(<"$file_path")
  # Print the variable to confirm
  echo "System prompt loaded from '$file_path'."
  echo "System prompt loaded from '$file_path'." >> "$protocolFile"

else
  systemPrompt=""
  echo "No system prompt found. Using only prompt files."
  echo "No system prompt found. Using only prompt files." >> "$protocolFile"
fi

echo "-------------------------------------------------------------------------" >> $protocolFile

# Running the prompts:
# Loop through all files in $promptPath starting with "PROMPT"
for file in "$promptPath"/PROMPT*; do
  # Check if matching files exist
  if [ -e "$file" ]; then
    echo "Processing $file ..."
    echo "--- Prompt file $file" >> "$protocolFile"
    echo "" >> "$protocolFile"
    if [ -z "$systemPrompt" ]; then
      llm -m "$model" -o temperature 0 < "$file" >> "$protocolFile"
    else
      llm -m "$model" -o temperature 0 -s "$systemPrompt" < "$file" >> "$protocolFile"
    fi
    echo "-------------------------------------------------------------------------" >> "$protocolFile"
  else
    echo "No files matching 'PROMPT*' found in $promptPath."
    exit 1
  fi
done