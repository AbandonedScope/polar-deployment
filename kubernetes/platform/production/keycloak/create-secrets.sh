#!/bin/sh

set -euo pipefail

echo "\n🗝️  Create Secret for OAuth2 Client.\n"

kubectl delete secret keycloak-issuer-client-secret || true

kubectl create secret generic keycloak-issuer-client-secret \
    --from-literal=spring.security.oauth2.client.provider.keycloak.issuer-uri=http://188.166.201.40/auth/realms/PolarBookshop

echo "\n🗝️  Create Secret for OAuth2 Resource Server.\n"

kubectl delete secret keycloak-issuer-resourceserver-secret || true

kubectl create secret generic keycloak-issuer-resourceserver-secret \
    --from-literal=spring.security.oauth2.resourceserver.jwt.issuer-uri=http://188.166.201.40/auth/realms/PolarBookshop

echo "\n🗝️  Secret generation completed successfully.\n"