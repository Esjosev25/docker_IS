# base Node.js v14 image
FROM node:14-alpine

# environment variables
ENV NODE_ENV=development
ENV NODE_PORT=8000
ENV HOME=/home/node/app
ENV PATH=${PATH}:${HOME}/node_modules/.bin

# create application folder 
# assign rights to the node user of group node by using user:group syntax
# chown command allows changing of the owner to the specified user:group
# -R changes the ownership of all files and folders recursively 
RUN mkdir -p $HOME && chown -R node:node $HOME

# set the working directory
WORKDIR $HOME

# set the active user
USER node

# copy package.json from the host
COPY --chown=node:node package*.json $HOME/

# install application modules
RUN npm install

# copy remaining files and build
COPY --chown=node:node . .
RUN npm run build

# share volume
VOLUME ${HOME}/static

# expose port on the host
EXPOSE $NODE_PORT

# application launch command
CMD [ "node", "./index.js" ]