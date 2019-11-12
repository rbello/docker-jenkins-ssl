FROM jenkins/jenkins:lts

#RUN mkdir /var/jenkins_home/cert
#RUN mkdir /var/jenkins_home/pk

#COPY https.cert.pem /var/lib/jenkins/cert
#COPY https.key.pem /var/lib/jenkins/pk

#COPY https.cert.pem /var/jenkins_home/cert
#COPY https.key.pem /var/jenkins_home/pk

#RUN chmod 777 /var/lib/jenkins/pk
#RUN chmod 777 /var/lib/jenkins/cert

#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=80 --httpsCertificate=/var/jenkins_home/cert/https.cert.pem --httpsPrivateKey=/var/jenkins_home/pk/https.key.pem
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=80 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
#ENV JENKINS_OPTS --httpPort=80 --httpsPort=-1

EXPOSE 8080
