FROM maven AS build
WORKDIR /app
COPY pom.xml /app
COPY src /app/src
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jdk-jammy
WORKDIR /spring
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
EXPOSE 8080
