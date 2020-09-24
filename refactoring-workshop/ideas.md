# duplicated code

https://www.jetbrains.com/help/idea/analyzing-duplicates.html

Use brainsfirst project as an example and use the IDE to  ind duplicated code

 * shift+shit run inspection by name
 * duplicated code fragment
 * search "java" in "module" and explain a bit what we can do here
 * show the duplicated code found
 * show it higlights in green all the lines
 * show it tries to extract method t fix it
 * discuss the trade offs and the best approach to handle this situation on a real application


# Extract class

Use the person class.
This is called "extract delegate" on intellij.
Mark the box "generate accessors" (try without it and revert to see why it is needed)
