require 'pg'

# ---------------------------------------
# IMPORTANT!  don't skip this step
# ---------------------------------------
# From the command line `createdb YOUR_DATABASE_NAME`
#
# otherwise your database won't exist when you try to connect to it

# set up a connection to the database you just created
pg_connection = PG.connect( dbname: 'blackjack' )


# use the methods provided by the PG class in the gem to
# interact with the database

# create a table: students
pg_connection.exec( "
  drop table if exists highscores;

  create table highscores
  (
    name        varchar(255),
    gameswon    int,
    gamesplayed int,
    winpercent  int

  );
")

# db_connection.execute("
#   insert into students
#   values ('Lubaway', 'Topher', 'Fence Lizard', 14);
# ")

# 10.times do
#   pg_connection.exec("
#     insert into students
#     values ('#{Faker::Name.last_name}', '#{Faker::Name.first_name}', '#{Faker::Company.bs}', #{rand(4)});
#   ")
# end