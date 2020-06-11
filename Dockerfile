FROM node:latest

WORKDIR /opt/ui

RUN npm install npm@latest -g

RUN npm install -g @angular/cli

USER 1000

#EXPOSE 4200

#CMD ["node", "-v"]

#CMD ["ng", "serve", "--host=0.0.0.0", "--port=4200", "--disable-host-check"]

CMD ["npm", "start"]

