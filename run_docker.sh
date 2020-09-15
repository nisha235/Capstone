#cd app

docker build --tag=nisha2305/capstone_microservice .

docker image ls
docker run -p 5000:8000 capstone_microservice

