#!/bin/sh

if [ -z "$1" ]; then
    echo "Usage: $0 <CN-value>"
    echo "Generates keystore and exports certificate."
    echo ""
    echo "   <CN-value> is FQDN for common name of certificate"
    exit 1
fi

# Create server pub/priv key pair
keytool -genkeypair -alias leshan -keyalg EC -dname "CN=$1" \
        -validity 365 -keypass server -keystore server.jks -storetype pkcs12 -storepass server

# Export certificate
keytool -exportcert -alias leshan -keystore server.jks -storepass server |\
        xxd -p -c 512 >server_cert.der
