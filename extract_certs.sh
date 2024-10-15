#!/bin/bash

sudo jq -r '.myresolver.Certificates[] | select(.domain.main=="xxx") | .key' ./letsencrypt/acme.json | base64 -d > privkey.pem
sudo jq -r '.myresolver.Certificates[] | select(.domain.main=="xxx") | .certificate' ./letsencrypt/acme.json | base64 -d > fullchain.pem
