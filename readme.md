## Readme

For the correct functioning of this program you need to install the next packages:

Into 'Backend' folder:

        npm init -y (is not necesary, this is only for developing)

        It's mandatory to install those packages:

        - npm install express
        - npm install mysql2
        - npm install csv-parser
        - npm install body-parser
        - npm install cors
        - npm install multer

        or simply using this command in the terminal:

        - npm install express mysql2 csv-parser body-parser cors multer


In 'Frontend' 

Inside of Frontend folder:

1) Install:
        
        npm init -y   (is not necesary, this is only for developing)

        npm install -D vite  

2) Add this line in package.json, en "scripts":

        "dev": "vite",

For the correct use you only need to write the next command into "Frontend" folder (terminal):

        npm i 


Additionally you need to import the database into workbench (pd_diego_vallejo_hopper.sql) and execute all commands.




#### Project description
This project was made for a electrical company to admin their bills, clients and paid in a centralized way.

Inside de platform you have 2 ways for adding information, one by one or masively with .csv files (separated by commas).

