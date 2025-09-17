# Stage 1: Build the app
 FROM node:18 AS builder
 WORKDIR /app

# Install dependencies
 COPY package*.json ./
 RUN npm install

# Copy source code and build
 COPY . .
 RUN npm run build

# Stage 2: Run the app
 FROM node:18
 WORKDIR /app
 COPY --from=builder /app ./
 EXPOSE 3000
 CMD ["npx", "next", "start"]
