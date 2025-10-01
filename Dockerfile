# ---------- Stage 1: Build the React app ----------
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and lock file first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Build the production-ready React app
RUN npm run build

# ---------- Stage 2: Serve the app with nginx ----------
FROM nginx:alpine

# Copy build artifacts to nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
