FROM gradle:jdk13 AS BUILD
ADD . /app/ 
WORKDIR /app/
RUN ./gradlew bootJar

FROM openjdk:13
WORKDIR /app
COPY --from=BUILD /app/build/libs/hello-drone.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]