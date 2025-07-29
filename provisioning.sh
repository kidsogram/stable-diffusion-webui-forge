#!/bin/bash
# Auto-download models for personalized book generation

set -e

MODEL_DIR="/opt/ai-dock/storage_monitor/models/checkpoints"
LORA_DIR="/opt/ai-dock/storage_monitor/models/loras"
VAE_DIR="/opt/ai-dock/storage_monitor/models/vae"

echo "🚀 Starting WebUI Forge provisioning for book project..."

# Create directories
mkdir -p "$MODEL_DIR" "$LORA_DIR" "$VAE_DIR"

# Download SDXL Base (essential for high-quality book illustrations)
if [ ! -f "$MODEL_DIR/sd_xl_base_1.0.safetensors" ]; then
    echo "📥 Downloading SDXL Base Model..."
    wget -q --show-progress -O "$MODEL_DIR/sd_xl_base_1.0.safetensors" \
        "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
fi

# Download Realistic Vision (perfect for portrait consistency)
if [ ! -f "$MODEL_DIR/realisticVisionV60B1_v60B1VAE.safetensors" ]; then
    echo "📥 Downloading Realistic Vision for portraits..."
    wget -q --show-progress -O "$MODEL_DIR/realisticVisionV60B1_v60B1VAE.safetensors" \
        "https://civitai.com/api/download/models/245598"
fi

# Download DreamShaper (excellent for fantasy book scenes)
if [ ! -f "$MODEL_DIR/dreamshaper_8.safetensors" ]; then
    echo "📥 Downloading DreamShaper for scenes..."
    wget -q --show-progress -O "$MODEL_DIR/dreamshaper_8.safetensors" \
        "https://civitai.com/api/download/models/128713"
fi

# Download SDXL VAE (improves image quality)
if [ ! -f "$VAE_DIR/sdxl_vae.safetensors" ]; then
    echo "📥 Downloading SDXL VAE..."
    wget -q --show-progress -O "$VAE_DIR/sdxl_vae.safetensors" \
        "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
fi

echo "✅ Provisioning completed! Ready for book generation."
