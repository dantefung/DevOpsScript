#!/usr/bin/python
# -*- coding:UTF-8  -*-

'merge handler'

__Author__ = 'DANTE FUNG'

# 导包
from Configuration import configuration
from FileHelper import *
from ReportModel import *
import os
import commands


# 类定义
class MergeHandler(object):

    def __init__(self):
        self.name = ''   

    def execute(self):
        print('[INFO]=========================MERGE==============================')
        modifyFileDict = configuration.getModifyFileDict()
        print('prepare to handle:',modifyFileDict)
        errFileSet = []
        oriPrjDir = configuration.getOriPrjDir()
        targetPrjDir = configuration.getTargetPrjDir()
        reportModelList = []
        for key in modifyFileDict.keys():
            
            reportModel = ReportModel()
            print '[INFO]\n'
            print '[INFO] 开始处理' + key
	    oriFullPath = oriPrjDir + '/' + key
            print '[INFO] 源项目完整路径为:' + oriFullPath
            reportModel.setFileName(get_FileName(key))
            if os.access(oriFullPath, os.F_OK) == False:
                print '[ERROR]:'+oriFullPath+'不存在!'
                errFileSet.append(oriFullPath)
                reportModel.setIsSuccess(False)
                reportModelList.append(reportModel) 
                continue;

            targetFullPath = targetPrjDir + '/' + key
            reportModel.setOldCreateTime(getFileCreateTime(targetFullPath,False))       
            if os.access(targetFullPath, os.F_OK) == False:
                print '[INFO]:' + targetFullPath + '不存在!'
            else:
                print '[INFO] 执行rm命令:'+'rm -rf '+targetFullPath
                print commands.getoutput('rm -rf '+targetFullPath)

            #print '[INFO]\n'
            targetFullFolder = targetPrjDir + '/' + modifyFileDict[key]  
            print '[INFO] 执行拷贝命令:'+'cp ' + oriFullPath + ' ' + targetFullFolder     
            print commands.getoutput('cp ' + oriFullPath+' ' + targetFullFolder) 
            print '[INFO] 旧文件创建时间:' + TimeStampToTime(reportModel.getOldCreateTime())
            print '[INFO] 新文件创建时间:' + get_FileCreateTime(targetFullPath)
            reportModel.setNowCreateTime(getFileCreateTime(targetFullPath,False))
            print '[INFO] 时间差:'+str((reportModel.getNowCreateTime()-reportModel.getOldCreateTime()))
            if (reportModel.getNowCreateTime()-reportModel.getOldCreateTime())>0:
                print '[INFO] Handle Result:True'     
                reportModel.setIsSuccess(True)

            reportModelList.append(reportModel)
        
        print '[INFO]\n'
        print '[INFO]------------------------------------------------------------'
        print '[INFO]                EXECUTE SUCCESS                             '
        print '[INFO]------------------------------------------------------------'          
      
        print '[INFO]\n'
        print '[INFO]=====================REPORT=================================='
        indent = '                                  '
        print '[INFO] 文件名'+indent+'处理结果'+indent+'旧创建时间'+indent+'新创建时间'+indent+'时间差'
        for reportModel in reportModelList:
            print '[INFO]' + reportModel.getFileName()+indent+str(reportModel.getIsSuccess())+indent+TimeStampToTime(reportModel.getOldCreateTime())+indent+TimeStampToTime(reportModel.getNowCreateTime())+indent+str((reportModel.getNowCreateTime()-reportModel.getOldCreateTime()))
        print '[INFO]\n[INFO]\n'
        print '[INFO]  errFileSet:'+str(errFileSet)

# 未缩进代码
mergeHandler = MergeHandler()
mergeHandler.execute()
























