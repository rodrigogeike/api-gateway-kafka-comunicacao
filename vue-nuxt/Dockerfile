# Use Node.js as base image
FROM node:lts-alpine

# Create app directory
WORKDIR /app


# Copy application files
COPY . .


# Expose the port the app runs on
EXPOSE 3000

# Set environment to production
ENV NODE_ENV=production

# Start the application
CMD ["tail", "-f", "/dev/null"]