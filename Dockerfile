FROM openjdk:17-jdk-slim
COPY target/*.war /app.war
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.war"]

