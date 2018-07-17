#based on work done by https://github.com/mammuth/bing-wallpaper GNU v2.0
import datetime
from urllib.request import urlopen, urlretrieve
from xml.dom import minidom
import os
import sys

def download_wallpaper(idx=0, use_wallpaper=True):
    # Getting the XML File
    try:
        usock = urlopen(''.join(['http://www.bing.com/HPImageArchive.aspx?format=xml&idx=',
                                 str(idx), '&n=1&mkt=ru-RU']))  # ru-RU, because they always have 1920x1200 resolution
    except Exception as e:
        print('Error while downloading #', idx, e)
        return
    try:
        xmldoc = minidom.parse(usock)
    # This is raised when there is trouble finding the image url.
    except Exception as e:
        print('Error while processing XML index #', idx, e)
        return
    # Parsing the XML File
    for element in xmldoc.getElementsByTagName('url'):
        url = 'http://www.bing.com' + element.firstChild.nodeValue
        # Get Current Date as fileName for the downloaded Picture
        # Get a higher resolution by replacing the file name
        urlretrieve(url.replace('_1366x768', '_1920x1200'), './bingwall.jpg')

download_wallpaper(0)
