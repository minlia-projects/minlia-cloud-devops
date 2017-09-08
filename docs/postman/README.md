## 使用POSTMAN进行API自动化测试

### 为什么使用POSTMAN

在开发的时候需要跑一个流程,如:用户注册流程, 每次去SWAGGER里面点击需要有三次参数的封装, 加上点击三次Try it now的按钮进行请求发送. 这些步骤看起来有些多余,只需要一个命令就可以搞定整个流程的测试. 
所以引入了POSTMAN进行接口自动化测试

#### POSTMAN基础请参考: 
[简书文章](http://www.jianshu.com/p/dd0db1b13cfc)


### 文件结构说明 
dev.postman_environment.json               开发环境的变量定义, 与开发环境相对应的可能会有sit uat production等相关环境的定义,此文件来自于postman的GUI程序, 使用导出功能得到此文件 
registration.csv                           进行用户注册时候的数据提供, 如每一次iteration的用户名需要以不同的值出现, 此文件手工创建
User_Registration.postman_collection.json  用户注册的流程描述, 此文件来自于postman的GUI程序, 使用导出功能得到此文件 


### 安装postman的命令行工具 newman
`npm install newman-cli -g`

参数说明见这里
[solidgeargroup](https://solidgeargroup.com/test-automation-api)
[newman npm](https://www.npmjs.com/package/newman)


### 执行自动化测试
修改registration.csv进行数据初始化, 将使用此文件中的数据进行用户注册

`newman run User_Registration.postman_collection.json -e dev.postman_environment.json -d registration.csv -n 1`


### 执行结果示例

成功的执行结果
```
User Registration

→ Username Availablitity Check
  POST http://127.0.0.1:10010/api/user/availablitity [200 OK, 553B, 108ms]
  ✓  业务返回不为空
  ✓  业务返回正确性
  ✓  检测用户名是否可用
  ✓  返回的状态码是200
  ✓  返回体为正常的JSON

→ Send Secure Code
  POST http://127.0.0.1:10010/api/user/secureCode/USER_REGISTRATION/send [200 OK, 571B, 76ms]
  ✓  业务返回正确
  ✓  业务返回不为空
  ┌
  │ 'Code ', '0722'
  └
  ✓  发送验证码成功
  ✓  验证码尚未被使用过
  ✓  返回体为正常的JSON

→ Registration
  POST http://127.0.0.1:10010/api/user/registration [200 OK, 592B, 276ms]
  ✓  业务返回正确性测试
  ✓  用户注册成功
  ✓  返回体为正常的JSON

┌─────────────────────────┬──────────┬──────────┐
│                         │ executed │   failed │
├─────────────────────────┼──────────┼──────────┤
│              iterations │        1 │        0 │
├─────────────────────────┼──────────┼──────────┤
│                requests │        3 │        0 │
├─────────────────────────┼──────────┼──────────┤
│            test-scripts │        3 │        0 │
├─────────────────────────┼──────────┼──────────┤
│      prerequest-scripts │        1 │        0 │
├─────────────────────────┼──────────┼──────────┤
│              assertions │       13 │        0 │
├─────────────────────────┴──────────┴──────────┤
│ total run duration: 665ms                     │
├───────────────────────────────────────────────┤
│ total data received: 597B (approx)            │
├───────────────────────────────────────────────┤
│ average response time: 153ms                  │
```




失败的执行结果


```
User Registration

→ Username Availablitity Check
  POST http://127.0.0.1:10010/api/user/availablitity [200 OK, 557B, 127ms]
  ✓  业务返回不为空
  1. 业务返回正确性
  2. 检测用户名是否可用
  ✓  返回的状态码是200
  ✓  返回体为正常的JSON

→ Send Secure Code
  POST http://127.0.0.1:10010/api/user/secureCode/USER_REGISTRATION/send [200 OK, 571B, 168ms]
  ✓  业务返回正确
  ✓  业务返回不为空
  ┌
  │ 'Code ', '0119'
  └
  ✓  发送验证码成功
  ✓  验证码尚未被使用过
  ✓  返回体为正常的JSON

→ Registration
  POST http://127.0.0.1:10010/api/user/registration [200 OK, 666B, 115ms]
  3. 业务返回正确性测试
  4. 用户注册成功
  ✓  返回体为正常的JSON

┌─────────────────────────┬──────────┬──────────┐
│                         │ executed │   failed │
├─────────────────────────┼──────────┼──────────┤
│              iterations │        1 │        0 │
├─────────────────────────┼──────────┼──────────┤
│                requests │        3 │        0 │
├─────────────────────────┼──────────┼──────────┤
│            test-scripts │        3 │        0 │
├─────────────────────────┼──────────┼──────────┤
│      prerequest-scripts │        1 │        0 │
├─────────────────────────┼──────────┼──────────┤
│              assertions │       13 │        4 │
├─────────────────────────┴──────────┴──────────┤
│ total run duration: 626ms                     │
├───────────────────────────────────────────────┤
│ total data received: 675B (approx)            │
├───────────────────────────────────────────────┤
│ average response time: 136ms                  │
└───────────────────────────────────────────────┘

  #  failure                               detail                                                                                                                                                
                                                                                                                                                                                                 
 1.  AssertionError                        expected 0 to deeply equal 1                                                                                                                          
                                           at assertion:1 in test-script                                                                                                                         
                                           inside "Username Availablitity Check"                                                                                                                 
                                                                                                                                                                                                 
 2.  AssertionError                        expected false to deeply equal true                                                                                                                   
                                           at assertion:2 in test-script                                                                                                                         
                                           inside "Username Availablitity Check"                                                                                                                 
                                                                                                                                                                                                 
 3.  AssertionError                        expected 50014 to deeply equal 1                                                                                                                      
                                           at assertion:0 in test-script                                                                                                                         
                                           inside "Registration"                                                                                                                                 
                                                                                                                                                                                                 
 4.  TypeError                             Cannot read property 'guid' of undefined                                                                                                              
                                           at assertion:1 in test-script                                                                                                                         
                                           inside "Registration"                            
```