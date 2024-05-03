FROM maven:3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/springboot-webapp.war document.war
EXPOSE 9090
ENTRYPOINT ["java","-war","document.war"]
