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
# ./evalDatePrompts.sh o3-mini "$promptPath"

# Claude by Anthropic
./evalDatePrompts.sh claude-3.5-sonnet "$promptPath"
./evalDatePrompts.sh claude-3.5-haiku "$promptPath"

# Google Gemini
# ./evalDatePrompts.sh gemini-1.5-pro-latest "$promptPath"
./evalDatePrompts.sh gemini-2.0-pro-exp-02-05 "$promptPath"
./evalDatePrompts.sh gemini-2.0-flash "$promptPath"
./evalDatePrompts.sh gemini-2.0-flash-lite-preview-02-05 "$promptPath"
# ./evalDatePrompts.sh gemini-2.0-flash-thinking-exp-01-21 "$promptPath"

# Llama by Meta (localvia Ollama)
./evalDatePrompts.sh llama3.3 "$promptPath"

# Mistral Small (localvia Ollama)
./evalDatePrompts.sh mistral-small:24b "$promptPath"

# Local (distilled) DeepSeek models (local via Ollama)
# DeepSeek-R1-Distill-Llama-70B
./evalDatePrompts.sh deepseek-r1:70b "$promptPath"


