# Stage 1
FROM maven:3.8.5-openjdk-17 as stage-1
WORKDIR /app

COPY ./pom.xml .
RUN mvn dependency:go-offline
COPY ./src ./src

# Stage 3 Final
FROM alpine:3.14 as uploader
WORKDIR /app

COPY --from=stage-2 /app/target/*.jar /app/target/

CMD ["jfrog", "*.jar", "java-web-app/"]
