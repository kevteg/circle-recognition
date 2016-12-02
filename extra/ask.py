#!/usr/bin/env python3
# -*- coding: utf-8 -*
import argparse
from howmany import howmany

'''
    Author: Keeeevin
'''

parser = argparse.ArgumentParser(prog='Input generator', usage='%(prog)s [options]',description='Script to find circles on output image and return x, y and r.')
parser.add_argument('-s','--show', required = False, default = False, dest='show',type=bool, help='show found circles')
parser.add_argument('-i','--image', required = True, dest='image',type=str, help='image to proccess')
parser.add_argument('-o','--stdout', required = False, default = True, dest='stout',type=bool, help='show info in stdout')

args = parser.parse_args()
howm = howmany(image_path = args.image, show = args.show, stout = args.stout)
print(howm.info())
