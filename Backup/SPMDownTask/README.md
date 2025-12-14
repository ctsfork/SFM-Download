## SPMDownTask
通过GitHub Action 功能快速下载Swift Package Manager管理的框架


### 前因

之前在本地直接使用SPM直接拉取代码经常出现问题，通常的情况是github可以访问，clone单个项目可以，但是如果项目中的框架过多，经常会出现某个依耐无法克隆而导致失败。 
使用的免费VPN又不稳定，有时候clone github仓库总是失败，但是访问YouTube之类的网站速度有很快，这就很无语了。 \
\
网上有很多可以加速GitHub资源下载的通道脚本，所以就想到了利用Action功能下载SPM管理的代码，归档下载好的代码。
然后利用GitHub加速通道来下载这些资源。


### 使用方法：
替换需要的Package.swift，并推送到GitHub，等待Action任务执行完毕即可。

### SFM文件替换
1. 进入Releases列表 
2. 下载Package.resolved文件，并替换本地项目的同名文件
3. 下载sfm文件到本地，并替换本地项目的SourcePackages即可。
4. sfm分两个版：sfm-full和sfm-repositories，如果二者大小区别不大，推荐下载sfm-full版本。


### 提示
目前我使用的是macOS 10.15.7版本，如果需要可以将yml中的runs-on改为需要版本的即可。

