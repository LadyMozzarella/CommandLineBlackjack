#Command Line Blackjack
##What is Command Line Blackjack?

Command Line Blackjack allows you to play a simple game of blackjack in your command line.

##Getting Started
###Setup

Ensure you have PostgreSQL on your computer

Install necessary gems

```
$ gem install pg
$ gem install colorize
```

Run the postgres server

```
$ postgres -D /usr/local/var/postgres
```

Run the setup file

```
$ ruby db_setup.rb
```

Begin the game

```
$ ruby blackjack.rb
```

###Gameplay

The game is a simple game of blackjack. There are two basic commands: 'hit' and 'stay'

When prompted, type the appropriate command asked for and then select enter.

Here are some shots of the game:

The beginning of the game (here you would either type hit or stay based on what you would like to do):

![initial game start](https://github.com/LadyMozzarella/CommandLineBlackjack/blob/master/images/ss1.png?raw=true)

![midgame](https://github.com/LadyMozzarella/CommandLineBlackjack/blob/master/images/ss4.png?raw=true)

We won a round here!

![end game](https://github.com/LadyMozzarella/CommandLineBlackjack/blob/master/images/ss5.png?raw=true)

The high scores table:

![high scores table](https://github.com/LadyMozzarella/CommandLineBlackjack/blob/master/images/ss2.png?raw=true)

##Features
- Color card display
- High scores database

##Technology Stack
- Ruby
- PostgreSQL ([pg](https://rubygems.org/gems/pg) gem)
- [colorize](https://rubygems.org/gems/colorize) gem

##Contributors
- [Brittany Mazza](https://github.com/LadyMozzarella)
- [Matthew Knudsen](https://github.com/mknudsen01)
- [Hunter Paull](https://github.com/hpchess)
