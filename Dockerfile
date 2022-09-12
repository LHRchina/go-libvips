FROM golang:1.18.6

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      automake build-essential pkg-config \
      libglib2.0-dev gobject-introspection libxml2-dev libjpeg62-turbo-dev libpng-dev expat libexpat1 libexpat1-dev && \
       wget https://github.com/libvips/libvips/releases/download/v8.13.1/vips-8.13.1.tar.gz && \
    tar zvxf vips-8.13.1.tar.gz && \
    cd vips-8.13.1 && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    apt-get remove -y automake build-essential pkg-config && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*