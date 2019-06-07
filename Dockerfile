FROM node:10-alpine

ADD . /data
WORKDIR /data

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
ENV NODE_PORT 80

COPY package*.json ./
RUN npm install --only-production
COPY . .

EXPOSE 80 443 3000

# Start pm2.json process file
CMD ["npm", "start"]
