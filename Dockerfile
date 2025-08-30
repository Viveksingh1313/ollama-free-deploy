FROM ollama/ollama:0.1.29

# Set environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS="*"

# Expose the Ollama port
EXPOSE 11434

# Add health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:11434/api/tags || exit 1

# Start Ollama
CMD ["ollama", "serve"]