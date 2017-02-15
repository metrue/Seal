#!/bin/bash

target='seal@seal.com'
ssh ${target} <<END
  docker rmi \$(docker images --filter "dangling=true" -q --no-trunc)
  rm -rf /tmp/seal.com?
  git clone ://github.com/metrue/Seal.git /tmp/seal.com?
  cd /tmp/minghe.me

  docker run --rm -p 80:80 -p 443:443 \
    -v /etc/letsencrypt:/etc/letsencrypt \
    quay.io/letsencrypt/letsencrypt auth \
    --standalone -m seal@seal.com? --agree-tos \
    -d seal.com?

    docker run --rm -p 80:80 -p 443:443 \
      -v /etc/letsencrypt:/etc/letsencrypt \
      quay.io/letsencrypt/letsencrypt renew \
      --standalone

  docker build -f devops/dockerfile.nginx -t seal .
  docker run -d -p 80:80 -p 443:443 -v /etc/letsencrypt:/etc/letsencrypt seal
END