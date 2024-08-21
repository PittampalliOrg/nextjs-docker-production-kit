#!/bin/bash

# Set the Docker Compose file path
COMPOSE_FILE="/home/vpittamp/nextjs-docker-production-kit/.devcontainer/docker-compose.dev.yml"

# Stop and remove containers and volumes defined in the compose file
echo "Stopping and removing containers and volumes defined in $COMPOSE_FILE..."
docker compose -f $COMPOSE_FILE down -v

# Remove any dangling volumes
echo "Removing any dangling volumes..."
docker volume prune -f

# Build and start the containers
echo "Building and starting containers..."
docker compose -f $COMPOSE_FILE up --build

# Show the logs
echo "Showing logs..."
docker compose -f $COMPOSE_FILE logs -f