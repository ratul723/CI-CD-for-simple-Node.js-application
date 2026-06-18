#!/bin/bash

echo "Starting deployment..."

# Move to project directory
cd /home/ubuntu/CI-CD-for-simple-Node.js-application

# Pull latest code
git pull origin main

# Install dependencies
npm install

# Restart application
pm2 stop node-express-app || true
pm2 delete node-express-app || true

# Start application
pm2 start src/server.js --name node-express-app

# Save PM2 configuration
pm2 save

echo "Deployment completed successfully."
