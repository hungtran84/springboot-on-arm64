# Build stage
FROM --platform=$BUILDPLATFORM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage with multi-arch support
FROM --platform=$TARGETPLATFORM openjdk:17-jre-slim
WORKDIR /app
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
COPY --from=build /app/target/springboot-helloworld-*.jar app.jar
RUN chown appuser:appgroup app.jar
USER appuser:appgroup
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"] 