#!/usr/bin/python
# -*- coding:UTF-8  -*-

'a ReportModel for report!'

__Author__ = 'DANTE FUNG'

class ReportModel(object):

    def __init__(self):
        self.__fileName = ''
        self.__isSuccess = False
        self.__oldCreateTime = 0.0
        self.__nowCreateTime = 0.0    

    
    def setFileName(self,fileName):
        self.__fileName = fileName

    def setIsSuccess(self,isSuccess):
        self.__isSuccess = isSuccess

    def setOldCreateTime(self,oldCreateTime):
        self.__oldCreateTime = oldCreateTime

    def setNowCreateTime(self,nowCreateTime):
        self.__nowCreateTime = nowCreateTime

    def getFileName(self):
        return self.__fileName

    def getIsSuccess(self):
        return self.__isSuccess

    def getOldCreateTime(self):
        return self.__oldCreateTime

    def getNowCreateTime(self):
        return self.__nowCreateTime                   
    











