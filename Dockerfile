FROM okteto/python:3
WORKDIR /usr/src/app
RUN curl -L https://github.com/Shopify/toxiproxy/releases/download/v2.1.4/toxiproxy-server-linux-amd64 > /usr/local/bin/toxiproxy-server && \
  curl -L https://github.com/Shopify/toxiproxy/releases/download/v2.1.4/toxiproxy-cli-linux-amd64 > /usr/local/bin/toxiproxy  && \
  chmod +x /usr/local/bin/toxiproxy && \
  chmod +x /usr/local/bin/toxiproxy-server

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt