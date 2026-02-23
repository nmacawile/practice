FROM node:25-alpine3.22
RUN apk add git openssh
RUN git config --global core.autocrlf true

WORKDIR /app
RUN npm create vite@latest . -- --template 
COPY . .
RUN npm install

EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host"]

# docker build --tag <IMAGE_NAME> .
# docker create --name <CONTAINER_NAME> -p 5173:5173 -it --volume <CONTAINER_NAME>:/app [--volume C:/Users/<USER_NAME>/.ssh:/root/.ssh] <IMAGE_NAME>
# create doesn't mount ssh keys, run does.
