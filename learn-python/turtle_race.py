from turtle import Turtle
from random import randint


def createTurtle(color, pos):
    foo = Turtle()
    foo.color(color)
    foo.shape('turtle')
    foo.penup()
    foo.goto(-300, pos)
    foo.pendown()
    return foo

foo = createTurtle('red', 100)
bar = createTurtle('blue', 70)
baz = createTurtle('black', 40)
biz = createTurtle('green', 10)

stepsSize = 10
for movement in range(100):
    foo.forward(randint(1,stepsSize))
    bar.forward(randint(1,stepsSize))
    baz.forward(randint(1,stepsSize))
    biz.forward(randint(1,stepsSize))


