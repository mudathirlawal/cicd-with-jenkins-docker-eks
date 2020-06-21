
FROM nginx:latest

## Step 1:
# Remove initial Nginx index file
RUN rm /usr/share/nginx/html/index.html

## Step 2:
# Create a working directory
WORKDIR /nginx

## Step 3:
# Copy source code to working directory
COPY . index.html /nginx/

## Step 4:
# Expose port 80
EXPOSE 80/tcp
