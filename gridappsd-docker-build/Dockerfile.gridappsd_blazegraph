FROM lyrasis/blazegraph:2.1.4

ARG TIMESTAMP

COPY ./conf/rwstore.properties /RWStore.properties

RUN echo $TIMESTAMP > /var/lib/jetty/dockerbuildversion.txt
