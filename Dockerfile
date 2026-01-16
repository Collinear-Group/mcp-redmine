FROM dhi.io/uv:0-debian13-dev

WORKDIR /app
COPY . /app

# Ensure uv creates/uses a known environment location
ENV UV_PROJECT_ENVIRONMENT=/opt/venv

# Install dependencies
RUN ["uv", "sync", "--frozen", "--no-dev"]

# Clear inherited entrypoint if the base image sets ENTRYPOINT ["uv"]
ENTRYPOINT []

CMD ["uv", "run", "--directory", "/app", "-m", "mcp_redmine.server", "main"]