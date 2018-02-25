FROM alpine:edge
LABEL maintainer "Galo Navarro <anglorvaroa@gmail.com>"

RUN addgroup -g 1000 user \
    && adduser -D -h /home/user -G user -u 1000 user

RUN apk --no-cache add \
    ca-certificates \
    python3 \
    py-setuptools \
    git \
    vim

USER user
ENV HOME /home/user
ENV TERM xterm-256color
ENV PYTHONPATH $HOME/lib/python

RUN mkdir -p $PYTHONPATH
RUN git clone --depth 1 https://github.com/ThoughtWorksInc/oktaauth $HOME/oktaauth

# https://github.com/ThoughtWorksInc/oktaauth/pull/4
# RUN sed -i 's/getpass.getpass("Passcode: ")$/""/' $HOME/oktaauth/oktaauth/main.py
RUN cd $HOME/oktaauth && python setup.py install --home $HOME

ENV LANG C.UTF-8

COPY    entrypoint.sh   /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
