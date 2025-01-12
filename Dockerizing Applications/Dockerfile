# Step 1: Use the official Nginx image as the base image
FROM nginx:latest

# Step 2: Copy custom Nginx configuration (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Step 3: Copy your web content to the Nginx HTML directory
COPY ./html /usr/share/nginx/html

# Step 4: Expose the port on which Nginx will run
EXPOSE 80

# Step 5: No need to specify CMD since the Nginx image already includes it
# The default CMD in the official Nginx image is `nginx -g 'daemon off;'`

