import cv2
import numpy as np
class howmany():
    def __init__(self, image_path, show = False, stout = True):
        self.show = show
        self.stout = stout
        self.image_path = image_path

    def info(self):
        img = cv2.imread(self.image_path, 0)
        #img = cv2.medianBlur(img,21)

        #output = cv2.cvtColor(img,cv2.COLOR_GRAY2BGR)
        circles = cv2.HoughCircles(img,cv2.HOUGH_GRADIENT,1,200, param1=35,param2=30,minRadius=10,maxRadius=100)
        result = []
        if circles is not None:
          circles = np.round(circles[0, :]).astype("int")
          if self.stout:
              print("Circles detected: " + str(len(circles)))
          for (x, y, r) in circles:
              if self.stout:
                  print("X: " + str(x) + " Y: " + str(y) + " R: " + str(r))
              result.append((x, y, r))
              if self.show:
                  cv2.circle(output, (x, y), r, (0, 255, 0), 4)
                  cv2.rectangle(output, (x - 5, y - 5), (x + 5, y + 5), (0, 128, 255), -1)
                  cv2.imshow("output", output)
                  cv2.waitKey(0)
        else:
            print("No circles")
        return result
