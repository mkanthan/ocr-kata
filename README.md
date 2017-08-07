# Bank OCR Kata

## Description

This is a simple Ruby project to solve the Kata here: {Coding Dojo Bank OCR Kata}[http://codingdojo.org/kata/BankOCR/]. While this project remains unfinished, the underlying design has been started and shows some promise.

## Project Setup

This was originally bundled against Ruby 2.4.0. Ensure it's installed on your machine.

1. Run your standard bundle commands

  $ gem install bundler
  $ bundle

2. Run the full test suite - at the time of this writing, all tests should pass 100%

  $ rake

## Approach

1. I read the whole specification, top to bottom and ensured that I understood everything. I came up with a set of requirements for the software:

- Account numbers look like this within a file:

  ```
      _  _     _  _  _  _  _
    | _| _||_||_ |_   ||_||_|
    ||_  _|  | _||_|  ||_| _|
  ```

- Account numbers are text, 3 lines each and 27 characters per line (but not taking into account \n which is an edge case)
- Account numbers should conform to a checksum with formula (d1 + 2*d2 + 3*d3 +..+ 9*d9) mod 11 = 0. Where d1 is the least significant digit
- Account numbers are ambiguated by checksums based on illegible but still valid account numbers
- Account numbers may not be printed correctly with either a line missing or added in the wrong place (not yet implemented)

2. I can now start breaking things apart into small functional units, starting from the bottom up as the smallest functional unit:

 - `DigitConverter` is the smallest unit - responsible for taking in a digit string and converting it to a single character.
 - `AccountNumberTransformer` - takes an array of account digit slices (as above in array format) and creates a `DigitConverter`, one by one, and uses them to create an AccountNumber when finished
 - `Checksum` - responsible for taking a an account string and performing the checksum calculation
 - `AccountNumber` - responsible for taking in a string of characters and running the required validation checks with checksum, legibility, ambiguity check (future)

3. For each class written, a spec file is written first, with the test written first. Tests should be as simple as possible while providing a stimulus and expectation. They should be careful not to expose any underlying implementation which is a reason why mocks are not used. More complex testing may make use of mocks, but it's not been seen yet in this project. Moving the digit mappings to `digit_helper.rb` keeps the spec files free of larger test setup.

## Future

1. When we want to disambiguate account numbers based on checksum, we'll need access to the digit data. This should be simple - you can take the DigitConverter objects, and put them in an array, and pass them off to the AccountNumber for analysis. The AccountNumber object should be responsible for all of the validation (or pass them off to smaller objects).

2. There should be at least one more object that contains multiple AccountNumberTransformers - this object should be responsible for opening a file and parsing each line, placing them into an array of 3 for each account number, and passing that off to the AccountNumberTransformer to transform it into an AccountNumber.

3. Since it's unknown who the user is at this time, it might be safe to assume that this app is targeted at a developer, or someone technical. A rake task should be sufficient to run the parser on a file containing multiple digitized account numbers. This file can also be responsible for resolving early edge cases such as digits that are not 27 characters long, or don't have the right number of lines, or an unreadable file, etc.
