////
https://github.com/cxjava/authority.git/
42c14a32-d409-3914-30b1-ce57b7db7bff
////

=== 权限系统基本配置

### BaseUserServiceImpl.java

[source,java]
----
private boolean execSend(String address, String title, String body) {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        // Get a Properties object
        Properties props = System.getProperties();
        props.setProperty("mail.smtp.host", emailHost);
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
		//...
}
----

### config.properties

[source]
----
#发送邮件服务器地址
email.host=smtp.gmail.com
#发送邮件账号
email.account=beauty9235@gmail.com
#发送邮件密码
email.password=XXX

#数据库配置
jdbc.mysql.properties
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost/authority?useUnicode=true&characterEncoding=utf-8
jdbc.username=test
jdbc.password=test
----

### web.xml

[source,xml]
<param-value>MYSQL</param-value>

配置密码
[source,java]
----
String rawPwd="admin";
PasswordEncoder encoder = new StandardPasswordEncoder("secret");
logger.debug("{}",encoder.encode(DigestUtils.md5Hex(rawPwd)));;
logger.debug("{}",encoder.encode(DigestUtils.md5Hex("test")));;
//初始化数据写在这里　data.sql
//admin=d1ada517b0c8a98ac962ad31455b17cfaefb57cea2b4c78918cfd91404a5755d11c824a233c55cc
//test=f1f98e9b24dac713181b5dcc9d04da41d9d9342196e248fd61e0d82715d2040b8602cf0b5bd95342
----

### Controller.java

[source,java]
----
@ActiveProfiles("MYSQL")
Dao.java
@ActiveProfiles("MYSQL")
Services.java
@ActiveProfiles("MYSQL")
----



### 导入数据库 & 创建数据库
[source]
----
mysql -u root -pxxxx
create database authority;
use mysql;
UPDATE user SET Password = password('test') WHERE User = 'test' ;
GRANT ALL PRIVILEGES ON authority.* TO 'test'@'%' IDENTIFIED BY 'test' WITH GRANT OPTION;
GRANT ALL ON mysql.proc TO 'test'@'%';
flush privileges;

select user,host from mysql.user;　
delete from user where user='';
----

### win cmd 命令行初始化数据库
mysql -u root --default-character-set=utf8 -B   authority -e "source [your_path]\[project]\src\main\resources\sql\mysql\schema.sql"
mysql -u root --default-character-set=utf8 -B   authority -e "source [your_path]\[project]\src\main\resources\sql\mysql\data.sql"
mysql -u root --default-character-set=utf8 -B   authority -e "source [your_path]\[project]\src\main\resources\sql\mysql\authority.sql"










