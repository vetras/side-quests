
class CommandExecutor:
    enableDebug = 0
    globalList = []

    def run(self):
        N = int(input())
        for i in range(0, N):
            line = input().split(" ")
            self.debug(line)
            self.parseCommand(line)

    def debug(self, arg=""):
        if self.enableDebug:
            print("debug ", arg, " globalList: ", self.globalList)

    def printCmd(self):
        print(self.globalList)

    def insert(self, position, value):
        temp = self.globalList[0:position]
        tempAfter = self.globalList[position:]
        temp.append(value)
        self.debug("1")
        self.globalList = temp + tempAfter
        self.debug("2")

    def remove(self, value):
        self.globalList.remove(value)

    def append(self, value):
        self.globalList.append(value)

    def sort(self):
        self.globalList.sort()

    def pop(self):
        return self.globalList.pop()
    
    def reverse(self):
        self.globalList.reverse()

    def parseCommand(self, line):
        # https://stackoverflow.com/questions/60208/replacements-for-switch-statement-in-python
        # this is a dictionary
        # each entry is a lambda, otherwise it will invoke the function immediately to try and get a value for each key
        # at the end we run the lambda with ()
        return {
            'insert': lambda: self.insert(int(line[1]), int(line[2])),
            'print': lambda: self.printCmd(),
            'remove': lambda: self.remove(int(line[1])),
            'append': lambda: self.append(int(line[1])),
            'sort': lambda: self.sort(),
            'pop': lambda: self.pop(),
            'reverse': lambda: self.reverse(),
        }[line[0]]()


if __name__ == '__main__':
    c = CommandExecutor()
    c.run()
