# Mars Rovers

$ rake -T

$ rake batch        # Run the app in batch mode

$ rake interactive  # Run the app in interactive mode

$ rake spec         # Run RSpec code examples


 - The batch mode will run the example input from the specification.

 - The interactive mode will expect user input.

 - The spec task runs all the unit tests


 Example usage:

$ rake batch
=> 1 3 N 5 1 E

$ rake interactive
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
<Control-D>

=> 1 3 N 5 1 E


