# Sailor
Sailor is a code navigation plugin for the Micro editor.

## Installation
### Requirements
* [universal-ctags](https://github.com/universal-ctags/ctags)
* tag files using the universal-ctags extended format

### Instructions
Install `micro-sailor-plugin` by simply cloning this repo into your `~/.config/micro/plug` directory

## Configuration
Sailor is best used when working inside a project rather than when reading and editing random files. Sailor creates `.sail` files which it stores ctag generated tags in. 

Add `*.sail` to your gitignore. 

## Features / How to use
Main Focuses:
* Press `Ctrl-p` to jump to function definition
* Display function declaration of function being hovered over or selected

Hope to Delvier at some point:
* Jump Points
    * Create jump points in any file
    * Be able to quickly switch between jump points
* Provide auto-complete options for things like object methods
* View instances where function was called, and jump to said instance

## Dev Todo
* Redesign so that effects are pushed to edges of plugin
* Have half-decent error handling
