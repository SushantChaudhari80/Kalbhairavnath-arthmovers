FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

COPY --from=build /app/target/*.war app.war

ENTRYPOINT ["java", "-Xmx300m", "-Xms150m", "-jar", "app.war"]
