# JFrog Homework 

Homework is outlines as below:


```
Task - Build a pipeline:

1. Use Spring pet-clinic (https://github.com/spring-projects/spring-petclinic) as your project source code

2. Build a Github Actions pipeline with the following steps:

Compile the code
Run the tests
Package the project as a runnable Docker image
Publish the image to JFrog Artifactory in your pipeline

3. Make sure all dependencies are resolved from Maven Central

Deliverables:

1. GitHub link to the repo including

Github Actions workflow files within that repo
Docker file within that repo
readme.md file explaining the work and how to run the project
Bonus Deliverable: XRay Scan Data export (JSON format) for your image

2. Command to obtain and run the docker image
```

## Task - Build a pipeline:
1. Use Spring pet-clinic (https://github.com/spring-projects/spring-petclinic) as your project source code
```
This project is cloned from https://github.com/spring-projects/spring-petclinic and edited as per the tasks required.
```

2. Build a Github Actions pipeline with the following steps:

Compile the code
Run the tests
Package the project as a runnable Docker image
Publish the image to JFrog Artifactory in your pipeline
```
2 approaches implemented.
A) build, test, package and deploy features are all captured inside the 'Dockerfile'. Github actions workflow, 'build.yml', utilises this Dockerfile to build, test, package, and deploy
to artifactory.
B) The latter utilises multiple steps in the Github actions to build, test, package and deploy the docker image to artifactory. A different 'Dockerfile' used in this approach. ([different project URL](https://github.com/idsener/spring-petclinic2)). This should be ready shortly.

This implementation refers to option A.
```

3. Make sure all dependencies are resolved from Maven Central
```
pom.xml file now repository tags updated to resolve dependencies from Maven Central, https://repo1.maven.org/maven2
```  


## Deliverables:

1. GitHub link to the repo including
```
https://github.com/idsener/spring-petclinic
```

Github Actions workflow files within that repo
```
.github/workflows/build.yml
```

Docker file within that repo
```
Dockerfile
```

readme.md file explaining the work and how to run the project
```
readme.md

#Login and point docker to JFrog repository, using anonymous user access. When asked for password, provide the following token: 'eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJDUE1mY28tZHZ0Y09zUXppRVNrS21JZmp6OHFuSldROTU0QkJrX3BGblFrIn0.eyJzdWIiOiJqZmFjQDAxaGI2NHN6NTVia3ltMDZnMG01c2EwazRtL3VzZXJzL2Fub255bW91cyIsInNjcCI6ImFwcGxpZWQtcGVybWlzc2lvbnMvdXNlciIsImF1ZCI6WyJqZnJ0QCoiLCJqZmFjQCoiLCJqZmV2dEAqIiwiamZtZEAqIiwiamZjb25AKiIsImpmaW50QCoiLCJqZndrc0AqIl0sImlzcyI6ImpmZmVAMDFoYjY0c3o1NWJreW0wNmcwbTVzYTBrNG0iLCJpYXQiOjE2OTY4MjEzNjksImp0aSI6IjU5NWFhOTMwLWI5MTQtNGNkMi1hOWU5LTdlNzg0YTcxMTIxMiJ9.xS5NqqIcJv2QwI61BXWHQgcuWts2vyBiTiK_3D6FGQL3yCbJC3i7vxu-XbBB8mIqCmnmI6wGE8XlVKfM9zwEHveQF7PmAbwuJuhBdshBYuA37qJysFt85vXjqbCKx-Q8fokJJ4Il0dCsQtcdqjg5Fhl5S-Jn4a8-yN5lrLzv4AKr6PXMe-HIN9rGgDZHED4XRvoRM5I-w_QYVChLQ44qhwB9bDD4jWVQVTi1ZLzIkY6Kw9Aws3UqPzRsOi7jtk8bou3bcTHXd_QpdV5qYBJ8y5IZhb05mQKIo8ZqR9ILFiMdbt3TOZ9CnJC0Kw9jvf63MIRvKREqrnCGIFEATed2Bg'

docker login -uanonymous ilaysener.jfrog.io

#pull docker image from artifactory. AMD64 and ARM64 versions of the image are available with anonymous pull access.
docker pull ilaysener.jfrog.io/ilay-docker/pet-clinic:latest
#run the docker image. 
docker run -d --publish 8080:8080 ilaysener.jfrog.io/ilay-docker/pet-clinic:latest
#access the application on localhost:8080 on your browser
```

Bonus Deliverable: XRay Scan Data export (JSON format) for your image

```
XRay Scan Data export files are available under 'XRay Reports' folder under root directory
```






## 1 - Simple github actions
```
#Github repository for this project
git clone https://github.com/spring-projects/spring-petclinic.git

The docker image for the application is published to Artifactory,
https://ilaysener.jfrog.io/artifactory/ilay-docker/pet-clinic/

```
