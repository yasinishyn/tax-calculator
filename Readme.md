# Setup
#### Pre `git clone <git path>` and `$ cd <app path>`

## 1. Installing Dependencies
Install ruby, bundler and rubygems. [Follow this tut](https://rvm.io/);

## 2. Gems
Run `# bundle` command to install all needed ruby dependencies

# Run
Inside `<app root path>` run `$ ruby taxes_calculator.rb '<input data>'`

Calculated data will appear under `<app root path>/outputs/<timestamp>_<input_string>.csv`

# Running tests
#### Rspec
Inside `<app root path>` run `$ rspec spec/modules/*`.
#### Code Styles
Inside `<app root path>` run `$ rubocop`.

All spec files can be found under `<app root path>/spec` directory;
