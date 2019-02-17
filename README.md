# LoginSrun4k

上网不涉密，涉密不上网！

只有登录模块，循环判断网络状态直到登录成功

分别扔到Windows的计划任务和Linux的crontab中做定期执行，执行间隔建议为1小时以防登录成功但无法联网

Windows下的curl可在https://curl.haxx.se/download.html 找到，提醒在过去PowerShell自带的curl行为和linux的是不一样的
