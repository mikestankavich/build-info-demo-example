FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy build.json from the current directory to the image
COPY index.html build.json ./

# Expose port 80
EXPOSE 80

# Configure nginx to show directory listings
RUN echo 'server { \
    listen 80; \
    server_name _; \
    location / { \
        root /usr/share/nginx/html; \
        autoindex on; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Start nginx
CMD ["nginx", "-g", "daemon off;"]