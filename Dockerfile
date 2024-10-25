# Use official Node.js image from Docker Hub
FROM ros:humble-ros-core

ARG NODE_MAJOR_VER=18
RUN apt-get update && apt-get install --no-install-recommends -y \
         ca-certificates \
         curl \
         gnupg2 \
         avahi-utils \
         ros-${ROS_DISTRO}-nav2-msgs \
         ros-${ROS_DISTRO}-robot-localization \
         ros-${ROS_DISTRO}-test-msgs \
         ros-${ROS_DISTRO}-example-interfaces \
         ros-${ROS_DISTRO}-rmw-cyclonedds-cpp \
    && curl -fsSL https://deb.nodesource.com/setup_${NODE_MAJOR_VER}.x | sudo -E bash - \
    && apt-get install -y nodejs

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# # Expose the app port
# EXPOSE 3000

# # Command to run the app
# CMD [ "node", "index.js" ]
