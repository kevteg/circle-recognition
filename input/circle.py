import cv2
from helpers import isreal
import numpy as np
class generate():
    def __init__(self, number, image, circle_size, quantity, aspect):
        self.ok = True
        try:
            self.number = number if str(number).isdigit() else None
            self.circle_size = circle_size if str(circle_size).isdigit() else None
            self.quantity = quantity if str(quantity).isdigit() else None
            self.aspect = float(aspect) if isreal(aspect) and float(aspect) > 0 and float(aspect) <= 1 else None
            self.image = cv2.imread(image, 0)
            if not(self.number and self.circle_size and self.quantity and self.image.any() and self.aspect):
                self.ok = False
                raise ValueError("Check inputs or files!")
        except Exception as e:
            print("An error has happened: " + str(e))

    def run(self):
        if self.ok:
            res = cv2.resize(self.image,None,fx=self.aspect, fy=self.aspect, interpolation = cv2.INTER_CUBIC)
            # cv2.imshow('image',self.image)
            cv2.imshow('image',res)
            cv2.waitKey(0)
            cv2.destroyAllWindows()
