#!/bin/zsh
# This script runs my static set of evaluated models against all prompt files in path $promptPath

promptPath="$1"

# Check whether model and promptPath were passed
if [ -z "$promptPath" ]; then
  echo "ERROR: Please specify a prompt path!"
  exit 1
fi

# GPT by OpenAI
./evalDatePrompts.sh gpt-4o "$promptPath"
./evalDatePrompts.sh gpt-4o-mini "$promptPath"
# ./evalDatePrompts.sh opromptPath-preview "$promptPath"

# Claude by Anthropic
./evalDatePrompts.sh claude-3.5-sonnet "$promptPath"
./evalDatePrompts.sh claude-3.5-haiku "$promptPath"

# Google Gemini
./evalDatePrompts.sh gemini-pro "$promptPath"
./evalDatePrompts.sh gemini-2.0-flash-exp "$promptPath"

# Llama by Meta (local)
./evalDatePrompts.sh llama3.3 "$promptPath"
# ./evalDatePrompts.sh llama3.2 "$promptPath"
