ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# add aws-cli and deps
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
RUN apk add jq

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
