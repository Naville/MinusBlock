#!/usr/bin/env python
from os import listdir
import string
import random
import os
import sys
makeFileString=""
global toggleString
toggleString="void GlobalInit(){\n"
def toggleModule():
	SDKFileList=listdir("./Hooks/SDKSpecific/")
	for x in SDKFileList:
		if(x.endswith(".xm")==False):
			print x+" "+"Not A Theos Code File"
		else:
			componentList=x.split(".")
			componentName=""
			i=0
			while i<len(componentList[i])-1:#ModuleName
				componentName+=componentList[i]
				i+=1
			global toggleString
			#toggleString=toggleString+"#ifdef"+" "+componentName+"\n"
			toggleString+="extern  void init_"+componentName+"_hook();\n"
			toggleString+="init_"+componentName+"_hook();\n";
			#toggleString+="#endif\n"
	APIFileList=listdir("./Hooks/APIHooks/")
	for x in APIFileList:
		if(x.endswith(".xm")==False):
			print x+" "+"Not A Theos Code File"
		else:
			componentList=x.split(".")
			componentName=""
			i=0
			while i<len(componentList[i])-1:#ModuleName
				componentName+=componentList[i]
				i+=1
			#global toggleString
			toggleString+="extern void init_"+componentName+"_hook();\n"
			#toggleString=toggleString+"#ifdef"+" "+componentName+"\n"
			toggleString+="init_"+componentName+"_hook();\n";
			#toggleString+="#endif\n"
	AdWallFileList=listdir("./Hooks/AdWall/")
	for x in AdWallFileList:
		if(x.endswith(".xm")==False):
			print x+" "+"Not A Code File"
		else:
			componentList=x.split(".")
			componentName=""
			i=0
			while i<len(componentList[i])-1:#ModuleName
				componentName+=componentList[i]
				i+=1
			#global toggleString
			toggleString+="extern void init_"+componentName+"_hook();\n"
			#toggleString=toggleString+"#ifdef"+" "+componentName+"\n"
			toggleString+="init_"+componentName+"_hook();\n";
			#toggleString+="#endif\n"
		#print toggleString
	toggleString+="}\n"
	os.system("touch"+" "+"./CompileDefines.xm")
	fileHandle=open("./CompileDefines.xm","w")
	fileHandle.flush()
	fileHandle.write(toggleString)
	fileHandle.close() 





def subModuleList():
	returnString="_FILES = Tweak.xm CompileDefines.xm"
	FileList=listdir("./Hooks/SDKSpecific/")
	for x in FileList:
		if(x.endswith(".mm")==False and x.endswith(".m")==False and x.endswith(".xm")==False):
			print x+" "+"Not A Code File"
		else:	
			string=" "+"Hooks/SDKSpecific/"+x
			returnString+=string
	List2=listdir("./Hooks/APIHooks/")
	for x in List2:
		if(x.endswith(".mm")==False and x.endswith(".m")==False and x.endswith(".xm")==False):
			print x+" "+"Not A Code File"
		else:
			string=" "+"Hooks/APIHooks/"+x
			returnString+=string
	AdWallList=listdir("./Hooks/AdWall/")
	for x in AdWallList:
		if(x.endswith(".mm")==False and x.endswith(".m")==False and x.endswith(".xm")==False):
			print x+" "+"Not A Code File"
		else:
			string=" "+"Hooks/AdWall/"+x
			returnString+=string
	FileList3=listdir("./Hooks/")
	for x in FileList3:
		if(x.endswith(".mm")==False and x.endswith(".m")==False and x.endswith(".xm")==False):
			print x+" "+"Not A Code File"
		else:	
			string=" "+"Hooks/"+x
			returnString+=string
	return returnString
def id_generator(size=15, chars=string.ascii_uppercase + string.digits):
	#Thanks to http://stackoverflow.com/questions/2257441/random-string-generation-with-upper-case-letters-and-digits-in-python
	ret=''.join(random.choice(chars) for _ in range(size))
	return "1a"+ret
randomTweakName=id_generator()#Generate Random Name To Help Bypass Detection
#os.remove("./Makefile")
toggleModule()
if (os.path.exists("theos")==False):
	print "Theos Link Doesn't Exist,Creating"
	if(os.environ.get('THEOS')!=None):
		os.system("ln -s $THEOS theos")
	else:
		print "$THEOS ENV Not Set"
		sys.exit(255)
else:
	print "Theos Link Exists at"+os.getcwd()+"/theos"+",Building"
makeFileString+="include theos/makefiles/common.mk\n"
makeFileString+="export ARCHS = armv7 armv7s arm64\n"
makeFileString+="export TARGET = iphone:clang:7.0:7.0\n"
makeFileString+="TWEAK_NAME = "+randomTweakName+"\n"
makeFileString+=randomTweakName+subModuleList()+"\n"
makeFileString+="ADDITIONAL_CCFLAGS  = -Qunused-arguments\n"
makeFileString+="ADDITIONAL_LDFLAGS  = -Wl,-segalign,4000\n"
makeFileString+="include $(THEOS_MAKE_PATH)/tweak.mk\n"
makeFileString+="after-install::\n"
makeFileString+="	install.exec \"killall -9 SpringBoard\""
#print makeFileString
fileHandle = open('Makefile','w')
fileHandle.flush() 
fileHandle.write(makeFileString)
fileHandle.close() 
os.system("cp ./MinusBlock.plist ./"+randomTweakName+".plist")
os.system("make clean")
subprocess.check_call(['make','package'], stdout=devnull, stderr=subprocess.STDOUT)
os.system("rm ./"+randomTweakName+".plist")
os.system("rm ./Makefile")
os.system("rm -rf ./_")
os.system("rm -rf ./obj")


