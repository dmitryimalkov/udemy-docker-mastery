# create your custom drupal image here, based of official drupal
#- First you need to build a custom Dockerfile in this directory,
FROM drupal:9.3.13 
# NOTE: if it fails to build, try the latest 9 branch version with `FROM drupal:9`
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
# the command rm -rf /var/lib/apt/lists/*- cleans the cash after installation
#You can find examples of them in drupal official image. More on this below under Compose file.
WORKDIR /var/www/html/themes
#Then use git to clone the theme with:
RUN git clone --branch 8.x-4.x --single-branch --depth 1 https://git.drupalcode.org/project/bootstrap.git \
#Combine that line with this line, as we need to change permissions on files and don't want to
#use another image layer to do that (it creates size bloat).
#This drupal container runs as www-data user but the build actually runs as root,
#so often we have to do things like `chown` to change file owners to the proper user:
&& chown -R www-data:www-data bootstrap
#Remember the first line needs a `\` at end
#to signify the next line is included in the command, and at start of next line you should have
#`&&` to signify "if first command succeeds then also run this command"
#- Then, just to be safe, change the working directory back to its default (from drupal image) at `/var/www/html`
WORKDIR /var/www/html