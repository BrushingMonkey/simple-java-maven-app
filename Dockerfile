# Stage 1
FROM maven:3.8.5-openjdk-17 as build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

# Stage 3 Final
FROM openjdk:17-jdk-slim
WORKDIR /app

COPY --from=build /app/target/*.jar /app/

CMD ["java", "-jar", "app/*.jar"]
