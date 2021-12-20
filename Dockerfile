# FROM tomcat:8
# LABEL app=jenkins-grup6
# COPY target/*.war /usr/local/tomcat/webapps/jenkins-grup6.war

# FROM openjdk:11

# ARG PROFILE
# ARG ADDITIONAL_OPTS

# ENV PROFILE=${PROFILE}
# ENV ADDITIONAL_OPTS=${ADDITIONAL_OPTS}

# # ARG JAR_FILE=target/agendamento-0.0.1-SNAPSHOT.jar
# # ADD ${JAR_FILE} app.jar

# WORKDIR /opt/spring_boot

# COPY /target/springboot-0.0.1-SNAPSHOT*.jar springboot-0.0.1-SNAPSHOT.jar

# SHELL ["/bin/sh", "-c"]
# ENTRYPOINT ["java", "-jar", "produtos-0.0.1-SNAPSHOT.jar"]

# EXPOSE 5005
# EXPOSE 8080

# CMD java ${ADDITIONAL_OPTS} -jar produtos-0.0.1-SNAPSHOT.jar --spring.profiles.active=${PROFILE}

# FROM maven:3.6.3-openjdk-11 as build
# WORKDIR /app
# COPY . .
# RUN mvn clean install

# FROM openjdk:11
# WORKDIR /app
# COPY --from=build /app/target/springboot-*.jar /app/app.jar
# EXPOSE 8088
# ENTRYPOINT ["sh", "-c"]
# CMD ["java -jar app.jar"]

FROM maven:3.6.3-openjdk-11
WORKDIR /app
COPY . .
RUN mvn clean install

#FROM tomcat:8
#LABEL app=jenkins-grup6
#COPY target/.war /usr/local/tomcat/webapps/jenkins-grup6.war

FROM openjdk:11

ARG PROFILE
ARG ADDITIONAL_OPTS

ENV PROFILE=${PROFILE}
ENV ADDITIONAL_OPTS=${ADDITIONAL_OPTS}

# ARG JAR_FILE=target/agendamento-0.0.1-SNAPSHOT.jar
# ADD ${JAR_FILE} app.jar

WORKDIR /opt/spring_boot

COPY /target/springboot-0.0.1-SNAPSHOT.jar springboot-0.0.1-SNAPSHOT.jar

SHELL ["/bin/sh", "-c"]
ENTRYPOINT ["java", "-jar", "springboot-0.0.1-SNAPSHOT.jar"]

EXPOSE 5005
EXPOSE 8088

CMD java ${ADDITIONAL_OPTS} -jar springboot-0.0.1-SNAPSHOT.jar --spring.profiles.active=${PROFILE}