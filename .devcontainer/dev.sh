#!/bin/bash

# Set the Docker Compose file path
COMPOSE_FILE="/home/vpittamp/nextjs-docker-production-kit/.devcontainer/docker-compose.dev.yml"

# Stop and remove only the containers defined in the compose file
echo "Stopping and removing containers defined in $COMPOSE_FILE..."
docker compose -f $COMPOSE_FILE down

# Build and start the containers
echo "Building and starting containers..."
docker compose -f $COMPOSE_FILE up --build

# Show the logs
echo "Showing logs..."
docker compose -f $COMPOSE_FILE logs -f