# base image
FROM node:11.2.0

# set working directory
RUN mkdir /usr/src/headshot_frontend
WORKDIR /usr/src/headshot_frontend

# add `/usr/src/headshot_frontend/node_modules/.bin` to $PATH
ENV PATH /usr/src/headshot_frontend/node_modules/.bin:$PATH

# install and cache headshot_frontend dependencies
COPY package.json /usr/src/headshot_frontend/package.json
COPY . /usr/src/headshot_frontend
RUN cd /usr/src/headshot_frontend/
RUN yarn install
RUN yarn run build

EXPOSE 8080

# start app
CMD ["yarn", "start"]
