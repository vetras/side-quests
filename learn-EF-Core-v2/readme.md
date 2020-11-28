
# Introduction

This project follow the course on plural sight: 

 * https://app.pluralsight.com/library/courses/getting-started-entity-framework-core
 

# Run Sql Server

Lets use docker to run SQL server, as per the official documentation

 * https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker
 
 
     $ sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<Samur41AppStrongP@ssw0rd>" \
          -p 1433:1433 --name samuraiApp -h samuraiApp \
          -d mcr.microsoft.com/mssql/server:2019-latest

# DB Migrations

Install the CLI tools:

    $ dotnet tool install --global dotnet-ef

To create the first migration, we also need to specify the start-up project.
This will generate the migration `.cs` files we can then check-in to source control.

    $ cd SamuraiApp.Data
    $ dotnet ef migration add init --startup-project ../SamuraiApp

## Generate SQL

This will generate the full SQL for all migrations.
The only weird thing of these commands is that we must run them on the folder of the project that has the DB Context, but they require the path of the runnable project, so we always need that extra argument.

    $ cd SamuraiApp.Data
    $ dotnet ef migrations script -h   # check all other options
    $ dotnet ef migrations script -o DB_generated.sql --startup-project ../SamuraiApp

## Update DB

The following command will execute the migrations needed on the DB.

If will also create the DB is necessary.

    $ cd SamuraiApp.Data
    $ dotnet ef database update -h
    $ dotnet ef database update --startup-project ../SamuraiApp --verbose







