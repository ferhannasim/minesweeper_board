# minesweeper_board
## Getting Started

These instructions will get you a copy of the base project in rails on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them
#### Ruby
Ruby version for this project is ` 2.6.6`


#### Rails
Rails version for this project is ` 6.1.7`

#### Postgres

Our preferred database managing software is Postgres. If not installed, one can look into their official documentation [here](https://www.postgresql.org/download) and follow the steps as given.

#### Git
Make sure you have git installed on your system, if you haven't, just refer this [How to install Git.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Cloning the Repository
For cloning the Github repository and goto the project follow the following commands
```
git clone https://github.com/ferhannasim/minesweeper_board.git
cd minesweeper_board
```

#### Project Dependencies

To setup the project, follow the below commands in the project directory.
```
gem install bundler
bundle install
```
This will install all the required gems for the project on your system.

#### Creating postgres db role
To setup psql db role one can go to the psql console by the following command and create role respectively.

```
psql postgres
$ create role postgres with createdb login password 'postgres1';
```

#### Create and Migrate db
For setting up the migrations on your system, run the following commands on your system:
```
rails db:create
rails db:migrate
```
If a project has a seed file in it, one needs to run the following command as well:
```
rails db:seed
```

### Starting the rails applications

```
$ rails s
```

###hit localhost:3000 in browser