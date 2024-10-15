#!/bin/bash

# Load the .env file to make variables available
source .env

# Use the DOMAIN variable from the .env file in the jq command
jq -r ".myresolver.Certificates[] | select(.domain.main==\"$DOMAIN\") | .certificate" ./letsencrypt/acme.json | base64 -d > ./maddy_tls/fullchain.pem
jq -r ".myresolver.Certificates[] | select(.domain.main==\"$DOMAIN\") | .key" ./letsencrypt/acme.json | base64 -d > ./maddy_tls/privkey.pem

echo "Certificates extracted successfully for domain: $DOMAIN"
