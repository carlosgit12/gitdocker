#Locating dockerfiles on different folders 
#Build backend, this command builds the backend app by applying the dockerfile instructions
docker build -f dockerfile -t backend-app .

#Build frontend, #Build backend, this command builds the frontend app by applying the dockerfile instructions
docker build -f dockerfile -t frontend-app .

#Run backend container, this command starts the backend app container based on the created image
docker run -d --name backend --network container-net backend-app

#Run frontend container, this command starts the frontend app container based on the created image
docker run -d --name frontend --network container-net -p 8080:80 frontend-app
