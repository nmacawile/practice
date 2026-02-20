FROM node:25-alpine3.22
RUN apk add git
RUN git config --global core.autocrlf true

WORKDIR /app
COPY . .
RUN npm create vite@latest . -- --template react
RUN npm install

EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host"]

# docker build --tag <IMAGE_NAME> .
# docker create --name <CONTAINER_NAME> -p 5173:5173 -it --volume <CONTAINER_NAME>:/app [--volume C:\Users\<USER_NAME>\.ssh:/root/.ssh] <IMAGE_NAME>
