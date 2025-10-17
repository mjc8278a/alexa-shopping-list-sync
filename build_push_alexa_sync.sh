#!/bin/bash
set -e

echo "🔧 Building Alexa Shopping List Sync Docker Image..."

# Step 1: Move to the build folder
cd /volume1/docker/apps/alexa_sync_build || exit 1

# Step 2: Build the Docker image
docker build -t ghcr.io/mjc8278a/alexa-shopping-list-sync:latest .

echo "✅ Build complete."

# Step 3: Log into GitHub Container Registry
if [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ No GitHub token found! Please export it first with:"
  echo "   export GITHUB_TOKEN=your_personal_access_token"
  exit 1
fi

echo "$GITHUB_TOKEN" | docker login ghcr.io -u mjc8278a --password-stdin
echo "🔐 Authenticated with GitHub Container Registry."

# Step 4: Push to GitHub
docker push ghcr.io/mjc8278a/alexa-shopping-list-sync:latest

echo "🚀 Image successfully pushed to GHCR!"
echo "🔗 https://github.com/mjc8278a?tab=packages"

# Step 5: Restart Home Assistant and Alexa Sync services
cd /volume1/docker/apps/home_assistant || exit 1
docker compose down
docker compose up -d

echo "🏁 Deployment complete. Alexa Sync is running on port 3210."
