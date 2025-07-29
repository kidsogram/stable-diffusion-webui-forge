# Use the pre-built WebUI Forge image optimized for cloud deployment
FROM ghcr.io/ai-dock/stable-diffusion-webui-forge:v2-cuda-12.1.1-base-22.04

# Set environment variables for your book project
ENV AUTO_UPDATE=false
ENV FORGE_ARGS="--listen --port 7860 --api --no-half-vae --xformers --enable-insecure-extension-access --skip-torch-cuda-test"
ENV FORGE_PORT_HOST=7860
ENV WEB_ENABLE_AUTH=false
ENV SERVERLESS=true

# Copy provisioning script for automatic model download
COPY provisioning.sh /opt/ai-dock/bin/provisioning.sh
RUN chmod +x /opt/ai-dock/bin/provisioning.sh

# Expose the port
EXPOSE 7860

# Health check for SaladCloud
HEALTHCHECK --interval=60s --timeout=30s --start-period=10m --retries=3 \
    CMD curl -f http://localhost:7860/sdapi/v1/progress || exit 1
