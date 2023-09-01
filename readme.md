It is taking too much time resolve the issues with getting the openliberty image up and running in a docker container.  An extremely simple application was put together having just an index.html and run it on the open liberty.  This will help to ensure docker, kubernetes and openliberty is working before adding the complex application. 
<br/>

Ensure you can build the application

    mvn clean install

<br/>
Ensure it build the war file and places it on 

    target\hello-ol-docker.war

<br/>
Run the application on localhost (without docker)

    mvn liberty:run


<br/>
Visit http:\\localhost:9095 from your browser and ensure you see 'Hello World!!'.  This is coming from the index.html

<br/>
Create a docker image

    docker build -t hello-ol-docker:1.0-SNAPSHOT .

<br/>
Checkout out it generated the images

    docker images

<br>
Run the docker container

    docker run -d --name hello-ol-docker -p 9095:9095 hello-ol-docker:1.0-SNAPSHOT
