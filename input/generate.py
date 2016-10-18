#!/usr/bin/env python3
# -*- coding: utf-8 -*
import argparse
import circle

'''
    Author: Keeeevin
'''

parser = argparse.ArgumentParser(prog='Input generator', usage='%(prog)s [options]',description='Script to generate input to neural network circle finder.')
parser.add_argument('-n','--number', required = False, default = 100, dest='number',type=str, help='number of output files')
parser.add_argument('-i','--image', required = True, dest='image',type=str, help='backgroung image')
parser.add_argument('-s','--size', required = False, default = 100, dest='circle_size',type=str, help='Size of circles in pixels')
parser.add_argument('-q','--quantity', required = False, default = 1, dest='quantity',type=str, help='Quantity of circles')
parser.add_argument('-a','--aspect', required = False, default = 1, dest='aspect',type=str, help='Proportion of the image (resize)')

args = parser.parse_args()
circles = circle.generate(number = args.number, image = args.image, circle_size = args.circle_size, quantity = args.quantity, aspect = args.aspect)
circles.run()
