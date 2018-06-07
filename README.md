# screencap_duokan
1、这是一篇技术文章，至于为什么要把多看app里面的书“搞”出来，每个人有每个人的理由

2、我用的是mac，只在mac上展示如何做到的

3、先安装 adb , 安卓手机与电脑的桥接工具

brew cask install android-platform-tools

4、几个adb命令，左滑、右滑、截图



5、完整代码上github  https://github.com/hani1990/screencap_duokan

6、安装 imagemagick   brew install imagemagick

7、利用convert工具把图片生成pdf  convert  *.png zzhk.pdf


利用同样的方法，增对 微信阅读，熊猫阅读 等等阅读类app，都可以把里面的书“搞”出来。


最后，免责声明：本人只是提供技术上的一种实现方式，如果有人利用本技术进行盗版书籍的传播与本人无关。


注意事项：

手机上的背景设置为白底，

字体设置为最小

app里面的翻页效果选“无”

手机上的所有通知都关闭，不然运行的时候通知来了，也会把通知截图。
