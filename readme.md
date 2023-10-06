# JFrog Homework 


## There are 2 solutions created. Please read below for each approach 
build, test, package and deploy features are all captured inside the 'Dockerfile'. Github actions workflow, 'build.yml', utilises this Dockerfile to build, test, package, and deploy
to artifactory.

The latter utilises multiple steps in the Github actions to build, test, package and deploy the docker image to artifactory. A different 'Dockerfile' used in this approach.

Further information and steps for each approach:

## 1 - Simple github actions
```
#Github repository for this project
[Git Repository](https://github.com/idsener/spring-petclinic)

```


```
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar
```
