#!/bin/bash

# Set the Docker Compose file to use
COMPOSE_FILE="docker-compose.dev.yml"

# Stop and remove only the containers defined in the compose file
echo "Stopping and removing containers defined in $COMPOSE_FILE..."
docker compose -f $COMPOSE_FILE down

# Remove images for services defined in the compose file
echo "Removing images for services defined in $COMPOSE_FILE..."
docker compose -f $COMPOSE_FILE down --rmi all

# Build and start the containers
echo "Building and starting containers..."
docker compose -f $COMPOSE_FILE up --build

# Show the logs
echo "Showing logs..."
docker compose -f $COMPOSE_FILE logs -f