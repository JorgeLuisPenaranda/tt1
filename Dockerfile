FROM node:12.18-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY . .
RUN npm install --silent
RUN npm run-script build
#RUN npm install -g serve
#RUN serve -s build
EXPOSE 80
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
CMD tail -f /dev/null