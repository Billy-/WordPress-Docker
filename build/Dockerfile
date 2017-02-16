FROM centos:7
MAINTAINER Billy Mathews

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 6.2.2

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash \
	&& source $NVM_DIR/nvm.sh \
	&& nvm install $NODE_VERSION

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

COPY ./package.json /app/package.json

WORKDIR /app

#RUN npm set registry http://sinopia:4873
RUN npm install

COPY ./webpack.config.js ./.babelrc ./postcss.config.js /app/

#COPY ./. /app

EXPOSE 8080

CMD npm run watch