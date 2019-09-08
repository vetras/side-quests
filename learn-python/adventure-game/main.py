
import rpg

# the player's backpack
backpack = rpg.Backpack()

# setup rooms
kitchen = rpg.Room("Kitchen")
kitchen.set_description("A dank and dirty room buzzing with flies.")

dining = rpg.Room("Dining Hall")
dining.set_description(
    "A large room with ornate golden decorations on each wall.")

ball = rpg.Room("Ballroom")
ball.set_description(
    "A vast room with a shiny wooden floor. Huge candlesticks guard the entrance.")

# setup characters
john = rpg.Friend("John", "A nice fellow guarding the door.")
john.set_conversation("Hi there. You may not pass through this door.")

dave = rpg.Enemy("Dave", "A smelly zombie")
dave.set_conversation("Brrlgrh... rgrhl... brains...")
dave.set_weakness("knife")

# setup items
knife = rpg.Item("Knife", "A sharp knife is lying on the table")
bag = rpg.Item(
    "bag", "A small bag, like the ones used to hold coins. Seems to have something inside.")

# link rooms, characters and items
kitchen.link(dining, "south")
dining.link(kitchen, "north")
dining.link(ball, "west")
ball.link(dining, "east")

dining.set_character(dave)
ball.set_character(john)
dining.set_item(knife)
ball.set_item(bag)

# the main game loop
current_room = kitchen
commands = rpg.Commands()
while True:
    print("\n")
    current_room.get_details()
    inhabitant = current_room.get_character()
    if inhabitant is not None:
        inhabitant.describe()
    command = input("> ")
    if command in ["i", "inventory"]:
        backpack.list_items()
    elif command in commands.Moves():
        current_room = current_room.move(command)
    elif command == "talk":
        inhabitant.talk()
    elif command == "fight":
        if inhabitant == None or isinstance(inhabitant, rpg.Friend):
            print("There is no one here to fight with")
        else:
            while True:
                backpack.list_items()
                print("What will you fight with?")
                fight_with = input(
                    "[fighting] " + inhabitant.get_name() + " > ")
                if backpack.contains(fight_with):
                    break
                print("You dont have that on your backpack. Choose again.")
            won = inhabitant.fight(fight_with)
            if not won:
                print("-- Game over --")
                break
            current_room.set_character(None)
    elif command == "offer":
        if not isinstance(inhabitant, rpg.Friend):
            print(inhabitant.get_name() + " is not accepting your gift.")
        else:
            print("What will you offer?")
            gift = input("[offer] " + inhabitant.get_name() + " > ")
            inhabitant.offer(gift)
    elif command == "take":
        item = current_room.take_item()
        if item is None:
            print("There is nothing useful on to take.")
        else:
            print("You take the " + item.get_name())
            backpack.store(item)
    else:
        print("I don't know how to " + command)


# next steps:
# https://www.futurelearn.com/courses/object-oriented-principles/3/steps/348337
# chalenge 1 is next
