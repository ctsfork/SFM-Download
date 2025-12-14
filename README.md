## SFM-Download

用于下载Swift Package Manager中引入的仓库，直接解决因为本地网络问题而导致SFM缓慢的问题。\
因为有时候```即使使用VPN链接网络SFM请求仓库的速度也十分缓慢```，但是直接使用git clone获取仓库速度又是正常的。\
该项目就是将Package.swift项目上传到GitHub上使用GitHub Action下载这些依赖仓库，然后直接提供给用户下载。


## 操作方法
1. 在Package.swift文件中添加需要的仓库数据
2. 手动触发GitHub Action
3. GitHub Action执行完毕后会在Action中和Release中同时留下repositories的归档文件。
4. 下载归档文件，解压。
5. 将解压后repositories中的仓库文件拷贝到org.swift.swiftpm缓存中。
```
open ~/Library/Caches/org.swift.swiftpm/repositories
```
6. 然后再项目中执行正常的swift package操作即可，等待它更新使用对应仓库的缓存。



## GitHub Action执行步骤
1. 安装Swift 5.7.3环境
2. 执行swift package resolve下载仓库
3. 归档下载好的repositories
4. 上传到GitHub Action 上和Release中


## 注意：
项目中不要随意使用Update Package Versions：
```
swift package update
```
应当使用resolve：
```
swift package resolve
```