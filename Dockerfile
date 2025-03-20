
FROM node:22-alpine AS stage

WORKDIR /app

COPY . .

RUN yarn install --production
RUN yarn add @nestjs/cli
RUN yarn build

FROM node:22-alpine AS prod

WORKDIR /app

ENV NODE_ENV=production  

COPY --from=stage /app/dist ./dist
COPY --from=stage /app/node_modules ./node_modules
COPY --from=stage /app/package.json ./package.json
COPY --from=stage /app/nest-cli.json ./nest-cli.json

ENTRYPOINT [ "yarn", "start:prod" ]