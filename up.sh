#!/bin/bash

PWD=`pwd`

# Copie du keystore
if [ ! -f "$PWD/data/jenkins_keystore.jks" ]; then
	cp "$PWD/jenkins_keystore.jks" "$PWD/data/jenkins_keystore.jks"
fi

# Récupération du mot de passe du keystore
if [ -f "$PWD/jenkins_keystore.secret" ]; then
	password=`cat $PWD/jenkins_keystore.secret`
else
	read -s -p "Keystore Password:" password
        echo
fi

docker run -d \
	--name sifi-jenkins \
	-v "$PWD/data/:/var/jenkins_home" \
	-p 443:8443 \
	agl/jenkins \
	--httpPort=-1 \
	--httpsPort=8443 \
	--httpsKeyStore=/var/jenkins_home/jenkins_keystore.jks \
	--httpsKeyStorePassword=$password

#	--env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" \

echo "Jenkins admin password:"
cat "$PWD/data/secrets/initialAdminPassword"
