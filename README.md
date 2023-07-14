# Sailor - WI
Sailor is a code navigation plugin for the [Micro editor](https://micro-editor.github.io/)

It's in the early stages and I'm using this project to get a bit more familiar with writing plugins for the Micro editor. Sailor is mainly something I made for my own use, but if someone finds it useful then awesome!
## Installation
### Requirements
* [universal-ctags](https://github.com/universal-ctags/ctags)
* tag files using the universal-ctags extended format
* MacOS or Linux based systems. Right now, in the early stages of the plugin, it does not exhibit the correct behvaiour on Windows.

### Instructions
Install the Sailor plugin for Micro by simply cloning this repo into your `~/.config/micro/plug` directory

## Configuration
**For now** Sailor is best used when working inside a project rather than when reading and editing random files. Sailor creates `.sail` files which it stores ctag generated tags in.

Add `*.sail` to your gitignore. 

## Features / How to use
Main Focuses:
* Press `F12` to jump to function definition
* Display function declaration of function being hovered over or selected

Hope to Delvier at some point:
* Jump Points (Next to do)
    * Create jump points in any file
    * Be able to quickly switch between jump points
* Provide auto-complete options for things like object methods - (Likely)
* View instances where function was called, and jump to said instance - (Maybe?)

## Dev Todo
* Redesign so that effects are pushed to edges of plugin
* Have half-decent error handling
