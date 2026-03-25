FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /target/gate-server-3-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
# Chay app va truyen tham so de ghi de file config
ENTRYPOINT ["java", "-Ddb.url=${DB_URL}", "-Ddb.user=${DB_USER}", "-Ddb.password=${DB_PASSWORD}", "-jar", "app.jar"]
