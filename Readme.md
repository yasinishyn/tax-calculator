# Setup
#### Pre `git clone <git path>` and `$ cd <app path>`

## 1. Installing Dependencies
Install ruby, bundler and rubygems. [Follow this tut](https://rvm.io/);

## 2. Gems
Run `# bundle` command to install all needed ruby dependencies

# Run
Inside `<app root path>` run:

`$ ruby calculate.rb '1, imported bottle of perfume, 32.19 1,bottle of perfume, 20.89 1,packet of headache pills, 9.75 1, imported box of chocolates, 11.85'`

# Running tests

#### Rspec

Inside `<app root path>` run `$ rspec spec/modules/*`.

All spec files can be found under `<app root path>/spec` directory;

#### Code Styles

Inside `<app root path>` run `$ rubocop`.
