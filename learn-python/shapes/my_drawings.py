from shapes import Triangle, Rectangle, Oval

rect = Rectangle()
rect.set_width(200)
rect.set_height(100)
rect.set_color('blue')
rect.draw()


square = Rectangle()
square.set_width(50)
square.set_height(50)
square.set_color('yellow')
square.set_x(120)
square.set_y(120)
square.draw()

tri = Triangle(5, 5, 100, 5, 100, 200)
tri.set_color('red')
tri.draw()
