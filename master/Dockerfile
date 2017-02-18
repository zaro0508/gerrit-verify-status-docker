FROM gerritforge/gerrit-ubuntu15.04:2.13.5

USER root

RUN apt-get install -y openjdk-8-jdk && update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java && \
    apt-get install -y iputils-ping netcat wget


USER gerrit

ADD gerrit.config /var/gerrit/etc/
ADD secure.config /var/gerrit/etc/

RUN mkdir /var/gerrit/.ssh
ADD id_rsa /var/gerrit/.ssh
ADD id_rsa.pub /var/gerrit/.ssh
ADD config /var/gerrit/.ssh
# instsall latest Gerrit stable-2.13 from gerrit-ci.gerritforge.com
RUN wget https://gerrit-ci.gerritforge.com/view/Gerrit/job/Gerrit-buck-stable-2.13/lastSuccessfulBuild/artifact/gerrit/buck-out/gen/gerrit.war -O /var/gerrit/bin/gerrit.war
RUN wget https://gerrit-ci.gerritforge.com/view/Plugins-stable-2.13/job/plugin-verify-status-stable-2.13/lastSuccessfulBuild/artifact/buck-out/gen/plugins/verify-status/verify-status.jar -O /var/gerrit/plugins/verify-status.jar

USER root

RUN apt-get install -y net-tools netcat inetutils-ping

ADD start.sh /bin/
ADD wait-for-it.sh /bin/

CMD /bin/start.sh
