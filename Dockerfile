ARG version
FROM gotenberg/gotenberg:${version}

USER root

# Install Norwegian language pack and set up locales
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends libreoffice-l10n-nb && \
    sed -i '/nb_NO.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variables for Norwegian Bokmål
ENV LANG nb_NO.UTF-8
ENV LANGUAGE nb_NO:nb
ENV LC_ALL nb_NO.UTF-8

COPY /fonts/* /usr/local/share/fonts/

USER gotenberg