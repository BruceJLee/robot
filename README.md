# README

## Environment

### OS: OSX El Capitan

### Ruby Version: 2.0.0

### Rspec Version: 3.5.0

### Rake Version: 11.3.0

### VCS: Git

## GEMS
Rspec: testing
Rake: command run

## Good to Know

TableTop class controls dimensions for robot to roam around, and it will validate if robot's position is correct.

Position class handles changing position of a robot.

To handle a position of robot, Position class has a Coordinate object and a Facing object.

Coordinate class update x and y coordinate with validation method which uses TableTop class's method
Facing class update facing point of a robot as a cardinal point.

Robot class has a TableTop object, a Position object.
It can change Position on TableTop and display current Position.

Simulator class parses and execute command objects

Commands module has available command classes which invoke Robot methods
Each command class object executes each behaviour for robot.

## How to test
    rspec

## How to Run

    > rake run example_commands/commands.txt
    
