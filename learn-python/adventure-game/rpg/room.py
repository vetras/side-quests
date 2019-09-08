class Room():
    def __init__(self, name):
        self.name = name
        self.description = None
        self.linked_rooms = {}
        self.character = None
        self.item = None

    def set_description(self, room_description):
        """
        Returns a string containing the description of the room.
        This is how you create python documentation.
        
        :param room_description: The description of the room
        :return: returns nothing
        """
        self.description = room_description

    def get_description(self):
        return self.description

    def get_name(self):
        return self.name

    def get_character(self):
        return self.character

    def set_character(self, x):
        self.character = x

    def get_item(self):
        return self.character

    def set_item(self, x):
        self.item = x

    def describe(self):
        print(self.description)

    def link(self, room, direction):
        self.linked_rooms[direction] = room
        print("   (debug): " + self.name +
              " linked rooms :" + repr(self.linked_rooms))

    def get_details(self):
        print(" " + self.name)
        print("-------------------------------")
        if self.item is not None:
            print(" You see a " + self.item.get_name())
            print(" " + self.item.get_description())
        for direction in self.linked_rooms:
            room = self.linked_rooms[direction]
            print(" The " + room.get_name() + " is " + direction)

    def move(self, direction):
        if direction in self.linked_rooms:
            return self.linked_rooms[direction]
        else:
            print("You can't go that way")
            return self

    def take_item(self):
        if self.item is not None:
            temp = self.item
            self.item = None
            return temp
        return None
