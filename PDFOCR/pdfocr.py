from PIL import Image
import pytesseract
import sys
import os
import logging
import time
from watchdog.observers import Observer

def image_ocr_pdf(file):
    print(os.path.splitext(file))
    f = open('test.txt', 'a')
    text = pytesseract.image_to_string(Image.open(file))
    f.write(text)
    f.close()

image_ocr_pdf('Test.png')
