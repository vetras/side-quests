class Item():
    def __init__(self, name, description):
        self.name = name
        self.description = description

    def get_description(self):
        return self.description

    def get_name(self):
        return self.name
