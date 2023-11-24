# TimeService module

TimeService Ruby module has 2 classes, an initialize method and can be received configuration params with a block.

## Features

- The module is able to initialize with a block
- There are 2 classes within the module:
  - Configuration class provides the possibility for the module to receive configuration params with a block
  - Time class inherits from the Configuration class and has `add_minutes` method 
- `add_minutes` method accepts two mandatory arguments and returns a result:
  - The first argument is a time value in the form of a string with the following format: [H]H:MM {AM|PM}
  - The second argument is the number of minutes, as an integer value.
  - The return value of the method is a string of the same format as the first argument, which is a result of adding the minutes to the time.

### Example of add_minutes usage

`TimeService::Time.new.add_minutes('9:13 AM', 10)` would return 9:23 AM.

### Example of module's configuration

```
TimeService.configure do |config|
  config.day_end = '9:00 PM'
end
```

## Getting Started

### Requirements:

In order to run the project you need this software installed:

1. Ruby
2. Bundler

## Usage

### Tests

```shell
rspec
```

### Code style

```shell
rubocop
```
