#!/bin/bash

if getent passwd jenkins > /dev/null 2>&1; then
	echo "    - Utilisateur déjà existant : jenkins"
else
	echo "    - Création du user : jenkins"
	useradd --no-create-home --disabled-password --disabled-login jenkins
fi

DATA_DIR="./data/"

echo "    - Création du répertoire de données : ${DATA_DIR}"


mkdir -p $DATA_DIR
chmod -R 777 $DATA_DIR
chown -R jenkins:jenkins $DATA_DIR

echo "    - Construction de l'image : agl/jenkins"

docker build -t agl/jenkins "./conf/"

if [ ! -f "jenkins_keystore.jks" ]; then

	echo "    - Création du keystore et de la clé RSA"

	read -s -p "Keystore Password:" password
	echo

	keytool -genkey -keyalg RSA -alias selfsigned -keystore jenkins_keystore.jks -storepass $password -keysize 2048

	echo $password > "./jenkins_keystore.secret"

fi
