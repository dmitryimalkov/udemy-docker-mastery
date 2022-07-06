FROM nginx:1.13

COPY nginx.conf /etc/nginx/conf.d/default.conf
# here we are taken nginx.conf and put it to the image ver 1.13- that's it
