class Backpack():
    def __init__(self):
        self.items = []

    def store(self, x):
        self.items.append(x)
    
    def list_items(self):
        if len(self.items) == 0:
            print("Your backpack is empty")
        else:
            msg = "Your backpack contains: "
            for item in self.items:
                msg = msg + item.get_name() + " "
            print(msg)
    
    def contains(self, x):
        for item in self.items:
                if item.get_name().lower() == x.lower():
                    return True;
        return False
