# start from base
FROM amd64/amazonlinux:2

LABEL maintainer="Your Name <youremailaddress@provider.com>"
RUN yum update -y && \
    yum install -y python-pip python-dev jq
# We copy just the requirements.txt first to leverage Docker cache

COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app

EXPOSE 5000

# ENTRYPOINT service nginx start && service ssh start && /bin/bash "use && to separate your code"
CMD [ "python", "./app.py" ]
