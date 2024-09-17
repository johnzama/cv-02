# Use the official Nginx image as a base
FROM nginx:alpine

# Copy the HTML and CSS files to the Nginx web server directory
COPY resume.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/

# Expose port 96 to allow access to the web server
EXPOSE 96

# Update the Nginx configuration to listen on port 96
RUN sed -i 's/listen       80;/listen       96;/' /etc/nginx/conf.d/default.conf

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]

