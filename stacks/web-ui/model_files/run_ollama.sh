#!/bin/bash

echo "Starting Ollama server..."
cd /model_files
ollama serve &  # Start Ollama in the background
sleep 5
echo "Ollama is ready, creating the model..."
ollama create finetuned_mistral -f model_files/Modelfile
ollama run finetuned_mistral
