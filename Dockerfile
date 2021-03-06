# start from base
FROM amd64/amazonlinux:2

#LABEL maintainer="Your Name <youremailaddress@provider.com>"
RUN yum update -y && \
    yum install -y python-pip python-dev jq
# We copy just the requirements.txt first to leverage Docker cache

#COPY ./requirements.txt /app/requirements.txt
#WORKDIR /app
#RUN pip install -r requirements.txt
#COPY . /app

#EXPOSE 5000

##ENTRYPOINT python ./app.py && /bin/bash "eval $(jq -r 'to_entries | .[] | "export " + .key + "=" + (.value | @sh)' < file.json)"
#CMD [ "python", "./app.py" ]

#FROM python:3.6-alpine

RUN pip install flask

COPY . /opt/

EXPOSE 5000

WORKDIR /opt


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["python", "./app.py"]
