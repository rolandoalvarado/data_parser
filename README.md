# DataParser

DataParser is a simple code for parsing a json file with search capabilty for partial or full name and displaying of duplicate email if there is.

NOTE: Later on it can extend to process other file type like csv, pdf, text file.

## Prerequisites

## Installation

Install from source:
```
gem "data_parser", :git => "git://github.com/rolandoalvarado/data_parser.git"
```

Clone and Download the files and use it in your ruby file.

NOTE: Once this is publish as gem you can install by:
```
gem install data_parser
```

## Usage

Searching for Partial or Full Name:
```
path = '<json file path>'
full_name = 'Mich'
result = DataParser.parse(path:).process(params: { full_name: }).names
```

Showing for duplicate email:
```
path = '<json file path>'
result = DataParser.parse(path:).process.emails
```

Using in a Ruby File:
1. Add this to your code:
  ```
  require_relative 'lib/data_parser.rb'
  ```
2. Make ruby file executable
  ```
  chmod +x bin/data_parser_runner.rb
  ```
3. Execute the file:
```
./bin/data_parser_runner.rb
```

Running the test:
```
rake test
```

## License

See [LICENSE](LICENSE) for details.