INSTALLING MDBOOTSTRAP WITH ANGULAR

https://mdbootstrap.com/docs/angular/

Sucess only installing via zip file download from the site.

**1 - Download Zip**\
https://mdbootstrap.com/download/mdb-angular/ng-free/MDB-Angular-Free-9.3.1.zip

**2 - Extract the Zip inside a [ui or any other] into your folder project.**\
    *This is necessary for your Dockerfile stays into the root folder project.
    In any case you can let your Dockerfile inside the same MDB project.
    Folder Structure:*\
        ```mdbbootstrap_project```\
            ```ui```\
        ```Dockerfile```
    
**3 - Include the CMD yarn start and Build the Image**\
    *3.1 - Change the "CMD" line that call the ng serve command to:*\
        ```CMD ["npm", "start"]```\
    *3.2 - Build the docker image*\
        ```docker build -t nameyourimage:v01 .``` 

**4 - Run Bash**\
    ```docker run -ti -v "$(pwd)/ui":/opt/ui p2puiangular:v01 /bin/bash```

**5 - Run npm install to update project with node modules and dependencies**\
    ```npm install```

**6 - add the configuration to package.json to start the ng serve allowing any hosts in dev mode**\
    ```"start": "ng serve --host=0.0.0.0 --port=4200 --disable-host-check",```

**7 - Start Server through the Docker command.**\
    *7.1 - In a new terminal run the command in the root folder of the project. The command will call the yarn start that will call the ng serve with the parameters to allow the disable host check.*\
    ```docker run -ti -v "$(pwd)/ui":/opt/ui -p 4200:4200 p2puiangular:v01```
    *7.2 - Running /bin/bash commands inside the docker*\
        *Exit the docker running with the /bin/bash*\
    *7.3 Run a new bash with the parameter -p 4200:4200, the first 4200 is the port that will be used in the browser and the second 4200 is the port that is exposed in the docker.*\
        ```docker run -ti -v "$(pwd)/ui":/opt/ui -p 4200:4200 p2puiangular:v01 /bin/bash```
    *7.3 Run the yarn start (This will run the command "ng serve", if you are running with a docker project)*
        ```yarn start```

**8 - Running easy commands with Alias Linux / Windows**\
    Any command you can run inside the container, for example like create a component with Angular with the command\
    ```ng g c new component```\
    In this case you need to be inside the container as was told at the topic 7.2, Running /bin/bash commands inside the docker.\
    *8.1 - Linux, running the alias in a terminal session is not permanent* 
        ```alias dr='docker run --rm'```\
    Add the alias to your .bashrc | zshrc, that depends on with bash are you using just coping and paste the ```alias dr='docker run --rm'``` the alias session\
    *8.2 - Windows PowerShell: open the PowerShell and type the follow command:*\
        ```Set-**Alias** -Name dr -Value docker run --rm```
    *8.3 - Windows CMD (In Test):*\
        On Windows we have some ways to create a alias, one of this is using the SYSTEM REGISTRY or the command DOSKEY. However I'll need to let it for the next update push ;).

**9 - Running the command with docker run with the ***alias*** ```dr``` or with the command ```docker run --rm``` in your terminal type:**\
    ```docker run --rm nameofyourimage command```\
    *Example:*\
    ```docker run --rm angularmdb:v01 ng g c register```\
    This create a new component inside the Angular Project.
    ```dr angularmdb:v01 ng g c register```\
    The same command with alias.

*YOU CAN REUSE OR CREATE NEW DOCKER IMAGES TO USE IN AS MANY PROJECTS AS YOU WANT OR USE THE SAME IMAGE FOR MANY PROJECTS. OK, THIS DEPENDS ON THE VERSION OF THE NODE VERSION OR ANGULAR THAT YOU WANT TO USE.*