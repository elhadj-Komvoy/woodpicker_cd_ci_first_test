# Recipe to package the app in a Docker image.
# The `build` step in .woodpecker.yml runs `docker build -t myapp:latest .`
# which executes this file top to bottom.

# Start from a clean Node 20 image (matches the test step image)
FROM node:20

# Working directory inside the container
WORKDIR /app

# Copy package files first — Docker caches this layer,
# so re-builds are fast when only your code changes
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# The app listens on 3000
EXPOSE 3000

# Start the app when the container runs
CMD ["node", "index.js"]
