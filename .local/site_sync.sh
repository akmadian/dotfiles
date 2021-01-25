#!/bin/sh
rsync -uvrP --delete-after ~/website/ root@madian.co:/var/www/madian/
