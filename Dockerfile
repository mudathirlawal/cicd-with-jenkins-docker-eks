FROM nginx:1.9.1

## Step 1:
# Remove initial Nginx index file
RUN rm /usr/share/nginx/html/index.html

## Step 2:
# Create a working directory
WORKDIR /web-app

## Step 3:
# Set up an environment variable so environment variables 
# can be accessed by processes running within the image. 
ENV PORT 80 

## Step 4:
# Copy index file to working directory
COPY index.html /web-app/index.html

## Step 5:
# Copy remainder source files to working directory
COPY . /web-app

## Step 6:
# Expose port 80
EXPOSE 80/tcp
