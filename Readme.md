Installing MDBootstrap with Angular

https://mdbootstrap.com/docs/angular/

Sucess only installing via zip file download from the site.

1 - Download Zip\
https://mdbootstrap.com/download/mdb-angular/ng-free/MDB-Angular-Free-9.3.1.zip

2 - Extract the Zip inside a [ui or any other] into your folder project.
    This is necessary for your Dockerfile stays into the root folder project.
    In any case you can let your Dockerfile inside the same MDB project.
    Folder Structure:\
        mdbbootstrap_project\
            ui\
        Dockerfile
    
3 - Include the CMD yarn start and Build the Image\
    3.1 - Change the "CMD" line that call the ng serve command to:
        CMD ["npm", "start"]\
    3.2 - Build the docker image\
        docker build -t nameyourimage:v01 . 

4 - Run Bash\
    docker run -ti -v "$(pwd)/ui":/opt/ui p2puiangular:v01 /bin/bash

5 - Run npm install to update project with node modules and dependencies\
    npm install

6 - add the configuration to package.json to start the ng serve allowing any hosts in dev mode\
    "start": "ng serve --host=0.0.0.0 --port=4200 --disable-host-check",

7 - Start Server through the Docker command.
    7.1 - In a new terminal run the command in the root folder of the project. The command will call the yarn start that will call the ng serve with the parameters to allow the disable host check.\
    docker run -ti -v "$(pwd)/ui":/opt/ui -p 4200:4200 p2puiangular:v01\
    7.2 - Running docker inside the /bin/bash\
        Exit the docker running with the /bin/bash\
    7.2 Run a new bash with the parameter -p 4200:4200, the first 4200 is the port that will be used in the browser and the second 4200 is the port that is exposed in the docker.\
    docker run -ti -v "$(pwd)/ui":/opt/ui -p 4200:4200 p2puiangular:v01 /bin/bash
    7.3 Run the yarn start (This will run the command "ng serve", if you are running with a docker project)




