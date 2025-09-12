ARG version
FROM gotenberg/gotenberg:${version}

USER root

 # Install Norwegian language pack and necessary locale generation tools for Alpine
 RUN apk update && \
     apk add --no-cache libreoffice-lang-nb && \ # Use apk, not apt-get
     # Alpine's locale handling is different. You might need to install 'locales' package
     # and then generate. However, often just installing the lang pack is enough for LibreOffice.
     # The sed/locale-gen part is for Debian, you might not need it or it needs to be adapted for Alpine.
     # If libreoffice-lang-nb is not enough, you may need a dedicated Alpine locale setup.
     # For a minimal install, the below might be enough for LibreOffice functionality.
     # If you still need specific locale generation, it's more involved in Alpine.
     # For now, let's remove the problematic Debian locale commands.
     rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

 # Set environment variables for locale (These should still work, but need correct locale setup below)
 ENV LANG=nb_NO.UTF-8
 ENV LANGUAGE=nb_NO:nb
 ENV LC_ALL=nb_NO.UTF-8

 COPY /fonts/* /usr/local/share/fonts/

 USER gotenberg