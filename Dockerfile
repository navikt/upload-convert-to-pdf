ARG version
FROM gotenberg/gotenberg:${version}

USER root

# Install Norwegian language pack and necessary locale generation tools for Alpine
RUN apt-get update -qq &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends libreoffice-lang-nb &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variables for locale (These should still work, but need correct locale setup below)
ENV LANG=nb_NO.UTF-8
ENV LANGUAGE=nb_NO:nb
ENV LC_ALL=nb_NO.UTF-8

COPY /fonts/* /usr/local/share/fonts/

USER gotenberg