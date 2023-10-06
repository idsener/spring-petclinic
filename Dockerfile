# define java image as BASE image
FROM eclipse-temurin:17-jdk-jammy as base
# set working directory
WORKDIR /app
# copy across maven wrapper and pom.xml(dependency) files
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
# resolve dependencies
RUN ./mvnw dependency:resolve
# copy source code
COPY src ./src

# use the above BASE image as base for TESTING
FROM base as test
# run application test scripts
CMD ["./mvnw", "test"]

# use the above BASE image as base to build application 
FROM base as build
# run maven package 
RUN ./mvnw package -DskipTests

# new temurin java base image
FROM eclipse-temurin:17-jre-jammy as production
# expose port 8080 from image
EXPOSE 8080
# copy packages from above BUILD image into this image
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
# run the application
CMD ["java", "-jar", "/spring-petclinic.jar"]
