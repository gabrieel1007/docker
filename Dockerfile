
FROM node:latest

RUN npm i -g @nestjs/cli 

WORKDIR /

COPY package.json package.json
COPY tsconfig.json tsconfig.json
COPY tsconfig.build.json tsconfig.build.json
COPY . .

RUN yarn install
RUN yarn build

ENV PORT=3000

EXPOSE 3000

CMD [ "yarn", "start:prod" ]





