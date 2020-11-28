# Duplicated code

* https://www.jetbrains.com/help/idea/analyzing-duplicates.html

Use brainsfirst project as an example and use the IDE to identify duplicated code.

 * `shift+shift run inspection by name
 * duplicated code fragment
 * search "java" in "module" and explain a bit what we can do here
 * show the duplicated code found
 * show it highlights in green all the lines
 * show it tries to extract method t fix it
 * discuss the trade-offs, and the best approach to handle this situation on a real application


# Extract class

Use the `Person` class.

This is called "extract delegate" on intellij.

Mark the box "generate accessors" (try without it and revert to see why it is needed)```

## More Info

**Divergent change** occurs when one class is commonly changed in different ways for different reasons.

If you look at a class and say, "Well, I will have to change these three methods every time I get a new database; I have to change these four methods every time there is a new financial instrument," you likely have a situation in which two objects are better than one.

Of course, you often discover this only after you've added a few databases or financial instruments.
To clean this up you identify everything that changes for a particular cause and use Extract Class to put them all together.

**Divergent change** is one class that suffers many kinds of changes, and **shotgun surgery** is one change that alters many classes.

In this case you want to use **Move Method** and **Move Field** to put all the changes into a single class.

If no current class looks like a good candidate, create one.

Often you can use Inline Class to bring a bunch of behavior together. 

# Inline class

Reverts the previous changes; intellij does not have this refactor built in.

# Extract Method / Inline Method

Exemplify this  on the `Person/Telephone classes too.
Although very basic, these are used very often.
Also, mention their kins:
 * Extract field / Inline field
 * Extract var / Inline var
 * etc

# Replace Data Value with Object

You have a data item (string postcode) that needs additional data or behavior.
Turn the data item into an object.

1. Open the `Order` object and run the unit tests
1. Apply the refactor on price with "extract delegate" on intellij.
1. re-run the tests



