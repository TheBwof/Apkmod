#!/bin/sh

KEYTOOL="/usr/lib/jvm/java-1.8-openjdk/bin/keytool"
JARSIGNER="/usr/lib/jvm/java-1.8-openjdk/bin/jarsigner"

if [ ! -f $HOME/apkmod.keystore ]; then
    $KEYTOOL -noprompt -dname "CN=mqttserver.ibm.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" -storepass thebwof -genkey -v -keystore $HOME/apkmod.keystore -alias thebwof -keyalg RSA -validity 10000 -keypass thebwof
fi

exec $JARSIGNER "$@"
