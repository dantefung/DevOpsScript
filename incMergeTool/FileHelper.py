#!/usr/bin/python
# -*- coding: UTF8 -*-

import time
import datetime
import os

 
#1、　　'''把时间戳转化为时间: 1479264792 to 2016-11-16 10:53:12'''
def TimeStampToTime(timestamp):
    timeStruct = time.localtime(timestamp)
    return time.strftime('%Y-%m-%d %H:%M:%S',timeStruct)

 

#2、　　'''获取文件的大小,结果保留两位小数，单位为MB'''
def get_FileSize(filePath):
    filePath = unicode(filePath,'utf8')
    fsize = os.path.getsize(filePath)
    fsize = fsize/float(1024*1024)
    return round(fsize,2)


#3、　　'''获取文件的访问时间'''
def get_FileAccessTime(filePath):
    filePath = unicode(filePath,'utf8')
    t = os.path.getatime(filePath)
    return TimeStampToTime(t)


#4、　　'''获取文件的创建时间'''
def get_FileCreateTime(filePath):
   return getFileCreateTime(filePath,True)


def getFileCreateTime(filePath,isFormat):
    filePath = unicode(filePath,'utf8')
    t = os.path.getctime(filePath)
    if isFormat : 
        return TimeStampToTime(t)
    return t    


#5、　　获取文件的修改时间
def get_FileModifyTime(filePath):
    filePath = unicode(filePath,'utf8')
    t = os.path.getmtime(filePath)
    return TimeStampToTime(t)

def get_FileName(filePath):
    return os.path.split(filePath)[-1]    

