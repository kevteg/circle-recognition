import cv2
from helpers import isreal
import random
import numpy as np
class generate():
    def __init__(self, number, image, circle_size, quantity, aspect):
        self.ok = True
        try:
            self.number = number if str(number).isdigit() else None
            self.circle_size = int(circle_size) if str(circle_size).isdigit() and int(circle_size) > 10 and int(circle_size) <= 100  else None
            self.quantity = int(quantity) if str(quantity).isdigit() and int(quantity) > 0 and int(quantity) < 15 else None
            self.aspect = float(aspect) if isreal(aspect) and float(aspect) > 0 and float(aspect) <= 1 else None
            self.image = cv2.imread(image)
            self.image = cv2.resize(self.image,None,fx=self.aspect, fy=self.aspect, interpolation = cv2.INTER_CUBIC)
            self.image = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
            if not(self.number and self.circle_size and self.quantity and self.image.any() and self.aspect):
                self.ok = False
                raise ValueError("Check inputs or files!")
        except Exception as e:
            print("An error has happened: " + str(e))

    def run(self):
        if self.ok:
            white, an_image = self.addCircles(self.image, self.circle_size, self.quantity)
            cv2.imshow('image',an_image)
            cv2.imshow('image2',white)
            cv2.waitKey(0)
            cv2.destroyAllWindows()

    def addCircles(self, image, radious, quantity = 1):
        width, height = image.shape[:2]
        white_img = np.zeros((width, height, 3), np.uint8)
        white_img[:] = (255, 255, 255)
        xlist = []
        ylist = []
        for q in range(quantity):
            x = random.randrange(radious, height - radious)
            while sum([1 if x < xvalue and x + radious*2 > xvalue or x > xvalue and xvalue + radious*2 > x  else 0 for xvalue in xlist ]):
                x = random.randrange(radious, height - radious)

            y = random.randrange(radious, width - radious)
            while sum([1 if y < yvalue and y + radious*2 > yvalue or y > yvalue and yvalue + radious*2 > y  else 0 for yvalue in ylist ]):
                y = random.randrange(radious, width - radious)
            # print((x, y))
            cv2.circle(image, (x,y), radious, (0,0,0), -1)
            cv2.circle(white_img, (x,y), radious, (0,0,0), -1)
            xlist.append(x)
            ylist.append(y)
        return image, white_img
