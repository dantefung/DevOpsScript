#!/usr/bin/python
# -*- coding:UTF-8  -*-

'auto merge prj'

from MyConfigParser import *
import os


__Author__ = 'DANTE FUNG'

# 类定义
class Configuration(object):

    def __init__(self,profilePath,startFileFolder):
        #print('[INFO]=========================INIT========================')
        #print '[INFO] profilePath:' + profilePath
        #print '[INFO] startFileFolder:' + startFileFolder
	self.__profilePath = profilePath
        self.__startFileFolder = startFileFolder
    
       

    def loadConfig(self):
        print('[INFO]====================LOAD PROPERTIES=====================')
        print '[INFO]\n[INFO]\n'
        profileConfig = MyConfigParser()
        profileConfig.read(self.__profilePath)
        print profileConfig.get('authorinfo','start.author')
        print '[INFO]\n[INFO]\n'
        print profileConfig.get('banner','start.banner')
        
	profileConfig.get('env','start.prj.name')
	#print('[INFO] '+profileConfig.get('env','start.prj.name'))
        print('[INFO] 本次合并的项目为:'+profileConfig.get('env','start.prj.name'))	      
 
	print('[INFO] 正在载入'+self.__startFileFolder+'start.'+profileConfig.get('env','start.prj.name')+'.ini'+'配置文件...')
        self.__startFileConfig = MyConfigParser()
        self.__startFileConfig.read(self.__startFileFolder+'start.'+profileConfig.get('env','start.prj.name')+'.ini')
	print('[INFO] 载入完成..[INFO]\n[INFO]\n')
        print('[INFO] 开始执行预处理操作...')
        modifyFileSet  = self.__startFileConfig.options('modifyfileset')
        print('modifyFileSet:',modifyFileSet)
	self.__preDealModifyFileDict = {}
        for modifyFile in modifyFileSet:
            print '[INFO] 正在预处理'+modifyFile
            fPath = ''		
            if modifyFile.find('/main/java/') != -1:
                tmpList =  modifyFile.split('/main/java/')
                fPath = tmpList[1]
                fPath = fPath.replace('.java','.class')
                fPath = 'WEB-INF/classes/'+fPath
                print '[INFO] 处理结果为:'+fPath+'\n'
			
            if modifyFile.find('/main/webapp/') != -1:
                tmpList = modifyFile.split('/main/webapp/')
                fPath = tmpList[1]
                print '[INFO] 处理结果为:'+fPath+'\n'

            tmpPathList = os.path.split(fPath)    
            
	    self.__preDealModifyFileDict[fPath] = tmpPathList[0]
            
        print '[INFO] 预处理完毕:'
        print '[INFO] '+str(self.__preDealModifyFileDict)

	

    def getProperty(self,scope,key):
        return self.__startFileConfig.get(scope,key)    

    def getOriPrjDir(self):
        return self.getProperty('oriprj','ori.base.dir') + '/' + self.getProperty('oriprj','ori.prj.name')

    def getTargetPrjDir(self):
        return self.getProperty('targetprj','target.base.dir') + '/' + self.getProperty('targetprj','target.prj.name')

    def getModifyFileDict(self):
        return self.__preDealModifyFileDict

    def getOriModifyFileSet(self):
        return self.__startFileConfig.options('modifyfileset')

    ## setter/getter
  
# 未缩进代码
configuration = Configuration('profile.ini','')
configuration.loadConfig()

# 主函数
if __name__ == '__main__':
    print('------------执行主函数-------------')
    print('OriPrjDir:' ,configuration.getOriPrjDir())
    print('TargetPrjDir:' ,configuration.getTargetPrjDir())
    print('ModifyFileSet:' ,configuration.getModifyFileDict())




























        
