FROM node:10-alpine

ADD . /data
WORKDIR /data

# Install pm2
RUN npm install pm2 -g

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
COPY package*.json ./
RUN npm install --only-production
COPY . .

EXPOSE 80 443

# Show current folder structure in logs
RUN ls -al -R

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]
