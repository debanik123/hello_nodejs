# Use official Node.js image from Docker Hub
FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 3000

# Command to run the app
CMD [ "node", "index.js" ]
