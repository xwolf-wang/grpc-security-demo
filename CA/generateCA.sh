#!/usr/bin/env bash

openssl genrsa -passout pass:1111 -aes256 -out cakey.pem 2048

openssl pkcs8 -passout pass:1111 -topk8 -in cakey.pem -out ca.key -nocrypt

openssl req -new -key ca.key -out ca.csr -subj "/C=CN/ST=myprovince/L=mycity/O=myorganization/OU=mygroup/CN=wwc"

openssl x509 -req -days 365 -sha1 -extensions v3_ca -signkey ca.key -in ca.csr -out ca.cer

openssl genrsa -passout pass:1111 -aes256 -out server.pem 2048

openssl pkcs8 -passout pass:1111 -topk8 -in server.pem -out server.key -nocrypt

openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=myprovince/L=mycity/O=myorganization/OU=mygroup/CN=wancai"

openssl x509 -req -days 365 -sha1 -extensions v3_req -CA ca.cer -CAkey ca.key -CAserial ca.srl -CAcreateserial -in server.csr -out server.cer