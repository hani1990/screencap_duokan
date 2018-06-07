#!/bin/sh
#先打开多看阅读里面的某个书
#通过adb 左右翻页，同时截图到本地保存 
#录入书名

book_name='python自动化运维技术与最佳实践'
count=315
#点击向右翻页
swap_right(){
	adb shell input tap 1050 800
}

swap_left(){
	adb shell input tap 300 400
}

#截图&拉到本地&删除手机上的图片
#$1:保存的图片名 $2本地保存路径
screenshot(){
	#如果文件夹不存在，创建文件夹
	if [ ! -d "./$2" ]; then
	  mkdir ./$2
	fi
	adb shell /system/bin/screencap -p /sdcard/$1.png
	adb pull /sdcard/$1.png ./$2/
	adb shell rm /sdcard/$1.png
}


for ((i=1; i<=$count; i ++))  
do  
	screenshot $i $book_name
	swap_right
	sleep 2
done  

#png 导出 pdf

cd  ./$book_name
for ((i=1; i<=$count; i ++))  
do  
	a=97
	out=$[((i/10))+$a]
	t=`printf "%x" $out`  
	as="\\x$t" 
	outname=$as-$i
	echo $outname
	mv ./$i.png ./$outname.png
done  

convert *.png test.pdf

#图片转文字
#tesseract ./1.png 1 -l chi_sim
