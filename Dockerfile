# create node & alpine
FROM node:gallium-alpine3.15

# set directory to work within
WORKDIR /iKbackend

# copying both package.json & package-lock-json file
COPY ./package.json .
COPY ./package-lock.json .

# npm install, must have package-lock-json file to install successfully
RUN npm ci

# copy all files over
COPY . .

# test file with jest & React-Testing-Library. But ensure test command is standout when finish, meaning not in --watch mode
# RUN echo 'IK TESTING' && npm run testout

# build
# RUN npm run build

EXPOSE 4000

# CMD to start server. eg. node ./src/server.js
CMD npm run server