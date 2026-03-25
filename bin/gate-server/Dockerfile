# Bước 1: Build stage
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Bước 2: Run stage
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# SỬA DÒNG NÀY: Copy đúng tên file đã cấu hình trong pom.xml
COPY --from=build /app/target/gate-server.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]