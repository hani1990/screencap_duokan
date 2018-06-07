#!/bin/sh
#先打开多看阅读里面的某个书
#通过adb 左右翻页，同时截图到本地保存 
#录入书名

book_name='工作前5年决定你的一生'
count=213
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
	# adb shell /system/bin/screencap -p /sdcard/$1.png
	# adb pull /sdcard/$1.png ./$2/
	# adb shell rm /sdcard/$1.png
	adb exec-out screencap -p > ./$2/$1.png
}

#png 导出 pdf
export_pdf(){
	tar czvf png.tar.gz ./*.png
	loop_count=$[count/200+1]

	for ((i=1; i<=$loop_count; i ++))  
		do  
			echo $i
			mkdir $i-dir
			for (( j = 1; j <= $count; j++ )); do
				if [ $j -le $[i*200] ]
				then
					a=65
					out=$[((j/10))+$a]
					t=`printf "%x" $out`  
					as="\\x$t" 
					outname=$as-$j
					echo $outname
					mv $j.png  $i-dir/$outname.png
				fi
			done
			convert $i-dir/*.png  ./$book_name-$i.pdf	
	done  
}

#pdf 打包
pack_pdf(){
	tar czvf $book_name.tar.gz ./*.pdf
}

#清理png
# clean_png(){
# 	#ddd
# }

main(){
	for ((i=1; i<=$count; i ++))  
	do  
		screenshot $i $book_name
		swap_right
		sleep 1
	done  
}




#main
cd  ./$book_name
#export_pdf
pack_pdf