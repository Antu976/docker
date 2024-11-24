FROM node:latest

ENV NODE_ENV production

WORKDIR /usr/src/TheHyruleCastle

COPY package.json package-lock.json ./

RUN npm ci --only=production && npm cache clean --force

COPY TheHyruleCastle/script.sh /usr/src/TheHyruleCastle/script.sh
RUN chmod +x /usr/src/TheHyruleCastle/script.sh

USER node

RUN npm run build

CMD ["node", "/usr/src/TheHyruleCastle/script.sh"]