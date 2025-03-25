# Use Node.js 20 image for compatibility with n8n
FROM node:20.15.0

# Set working directory
WORKDIR /app

# Install pnpm globally
RUN corepack enable && corepack prepare pnpm@10.2.1 --activate

# Copy project files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy the entire project
COPY . .

# Expose the required port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "run", "start"]
