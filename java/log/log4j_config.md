log4j配置
---

日志级别 OFF、FATAL、ERROR、WARN、INFO、DEBUG、ALL,一般使用(ERROR、WARN、INFO、DEBUG)
### properties配置 有缺陷 高级别的日志在低级别的日志中出现
```
# priority  :debug<info<warn<error
#you cannot specify every priority with different file for log4j 
log4j.rootLogger=debug,stdout,info,debug,warn,error 
 
#console
log4j.appender.stdout=org.apache.log4j.ConsoleAppender 
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout 
log4j.appender.stdout.layout.ConversionPattern= [%d{yyyy-MM-dd HH:mm:ss a}]:%p %l%m%n
#info log
log4j.logger.info=info
log4j.appender.info=org.apache.log4j.DailyRollingFileAppender 
log4j.appender.info.DatePattern='_'yyyy-MM-dd'.log'
log4j.appender.info.File=./src/com/hp/log/info.log
log4j.appender.info.Append=true
log4j.appender.info.Threshold=INFO
log4j.appender.info.layout=org.apache.log4j.PatternLayout 
log4j.appender.info.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c >> Method: %l ]%n%p:%m%n
#debug log
log4j.logger.debug=debug
log4j.appender.debug=org.apache.log4j.DailyRollingFileAppender 
log4j.appender.debug.DatePattern='_'yyyy-MM-dd'.log'
log4j.appender.debug.File=./src/com/hp/log/debug.log
log4j.appender.debug.Append=true
log4j.appender.debug.Threshold=DEBUG
log4j.appender.debug.layout=org.apache.log4j.PatternLayout 
log4j.appender.debug.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c >> Method: %l ]%n%p:%m%n
#warn log
log4j.logger.warn=warn
log4j.appender.warn=org.apache.log4j.DailyRollingFileAppender 
log4j.appender.warn.DatePattern='_'yyyy-MM-dd'.log'
log4j.appender.warn.File=./src/com/hp/log/warn.log
log4j.appender.warn.Append=true
log4j.appender.warn.Threshold=WARN
log4j.appender.warn.layout=org.apache.log4j.PatternLayout 
log4j.appender.warn.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c >> Method: %l ]%n%p:%m%n
#error
log4j.logger.error=error
log4j.appender.error = org.apache.log4j.DailyRollingFileAppender
log4j.appender.error.DatePattern='_'yyyy-MM-dd'.log'
log4j.appender.error.File = ./src/com/hp/log/error.log 
log4j.appender.error.Append = true
log4j.appender.error.Threshold = ERROR 
log4j.appender.error.layout = org.apache.log4j.PatternLayout
log4j.appender.error.layout.ConversionPattern = %d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c >> Method: %l ]%n%p:%m%n
```


### xml配置
```
<?xml version="1.0" encoding="UTF-8"?>  
<!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">  
    
<log4j:configuration  debug="true" xmlns:log4j='http://jakarta.apache.org/log4j/' >  
 
    <!-- ========================== 自定义输出格式说明================================ -->
      <!-- %p 输出优先级，即DEBUG，INFO，WARN，ERROR，FATAL -->
      <!-- %r 输出自应用启动到输出该log信息耗费的毫秒数  -->
      <!-- %c 输出所属的类目，通常就是所在类的全名 -->
      <!-- %t 输出产生该日志事件的线程名 -->
      <!-- %n 输出一个回车换行符，Windows平台为“/r/n”，Unix平台为“/n” -->
      <!-- %d 输出日志时间点的日期或时间，默认格式为ISO8601，也可以在其后指定格式，比如：%d{yyy MMM dd HH:mm:ss,SSS}，输出类似：2002年10月18日 22：10：28，921  -->
      <!-- %l 输出日志事件的发生位置，包括类目名、发生的线程，以及在代码中的行数。举例：Testlo4.main(TestLog4.java:10)  -->
      <!-- ========================================================================== -->
 
      <!-- ========================== 输出方式说明================================ -->
      <!-- Log4j提供的appender有以下几种:  -->
      <!-- org.apache.log4j.ConsoleAppender(控制台),  -->
      <!-- org.apache.log4j.FileAppender(文件),  -->
      <!-- org.apache.log4j.DailyRollingFileAppender(每天产生一个日志文件), -->
      <!-- org.apache.log4j.RollingFileAppender(文件大小到达指定尺寸的时候产生一个新的文件),  -->
      <!-- org.apache.log4j.WriterAppender(将日志信息以流格式发送到任意指定的地方)   -->
  <!-- ========================================================================== -->
   
    <appender name="CONSOLE" class="org.apache.log4j.ConsoleAppender">
         <!-- <param name="Target" value="System.out"/> -->
         <layout class="org.apache.log4j.PatternLayout">
                 <param name="ConversionPattern" value="%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c  Method: %l ]%n%p:%m%n"/>
         </layout>
        <!--  <filter class="org.apache.log4j.varia.LevelRangeFilter">
            <param name="LevelMin" value="DEBUG"/>
            <param name="LevelMax" value="DEBUG"/>
        </filter> -->
    </appender>
    <!-- output the debug   -->
   <!--  <appender name="log4jDebug" class="org.apache.log4j.DailyRollingFileAppender">
        <param name="File" value="log_"/>    
        <param name="MaxFileSize" value="KB"/> 
        <param name="MaxBackupIndex" value="2"/> -->
   <appender name="log4jDebug"  class="org.apache.log4j.rolling.RollingFileAppender">  
        <param name="Append" value="true"/>
        <rollingPolicy  class="org.apache.log4j.rolling.TimeBasedRollingPolicy">  
               <param name="FileNamePattern" value="./log/log_%d{yyyy-MM-dd}.log" />  
        </rollingPolicy>  
        <layout class="org.apache.log4j.PatternLayout">
            <param name="ConversionPattern" value="%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c Method: %l ]%n%p:%m%n"/>
        </layout>
        <filter class="org.apache.log4j.varia.LevelRangeFilter">
            <param name="LevelMin" value="DEBUG"/>
            <param name="LevelMax" value="DEBUG"/>
        </filter>
    </appender>
   <!--  <appender name="log4jInfo" class="org.apache.log4j.DailyRollingFileAppender">
        <param name="File" value="log_"/>       
        <param name="DatePattern" value="'.log'yyyy-MM-dd"/>
        <param name="Append" value="true"/>
       <param name="MaxFileSize" value="5KB"/>
        <param name="MaxBackupIndex" value="2"/> -->
    <appender name="log4jInfo"  class="org.apache.log4j.rolling.RollingFileAppender">  
        <param name="Append" value="true"/>
        <rollingPolicy  class="org.apache.log4j.rolling.TimeBasedRollingPolicy">  
               <param name="FileNamePattern" value="./log/log_%d{yyyy-MM-dd}.log" />  
        </rollingPolicy> 
        <layout class="org.apache.log4j.PatternLayout">
             <param name="ConversionPattern" value="%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c  Method: %l ]%n%p:%m%n"/>
        </layout>
        <filter class="org.apache.log4j.varia.LevelRangeFilter">
            <param name="LevelMin" value="INFO"/>
            <param name="LevelMax" value="INFO"/>
        </filter>
    </appender>
   <!--  <appender name="log4jWarn" class="org.apache.log4j.DailyRollingFileAppender">
        <param name="File" value="/log_"/>      
        <param name="DatePattern" value="'.log'yyyy-MM-dd"/>
        <param name="Append" value="true"/>
        <param name="MaxFileSize" value="5KB"/>
        <param name="MaxBackupIndex" value="2"/> -->
    <appender name="log4jWarn" class="org.apache.log4j.rolling.RollingFileAppender">  
        <param name="Append" value="true"/>
        <rollingPolicy  class="org.apache.log4j.rolling.TimeBasedRollingPolicy">  
               <param name="FileNamePattern" value="./log/log_%d{yyyy-MM-dd}.log" />  
        </rollingPolicy> 
        <layout class="org.apache.log4j.PatternLayout">
             <param name="ConversionPattern" value="%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c Method: %l ]%n%p:%m%n"/>
        </layout>
        <filter class="org.apache.log4j.varia.LevelRangeFilter">
            <param name="LevelMin" value="WARN"/>
            <param name="LevelMax" value="WARN"/>
        </filter>
    </appender>
  <!--  <appender name="log4jError" class="org.apache.log4j.DailyRollingFileAppender"> -->
   <appender name="log4jError"  class="org.apache.log4j.rolling.RollingFileAppender">  
       <!--  <param name="File" value="/error_"/>    
        <param name="DatePattern" value="'.log'yyyy-MM-dd"/> -->
        <param name="Append" value="true"/>
        <rollingPolicy  class="org.apache.log4j.rolling.TimeBasedRollingPolicy">  
               <param name="FileNamePattern" value="./log/error_%d{yyyy-MM-dd}.log" />  
        </rollingPolicy> 
        
      <!--   <param name="MaxFileSize" value="5KB"/> -->
      <!--   <param name="MaxBackupIndex" value="2"/> -->
        <layout class="org.apache.log4j.PatternLayout">
             <param name="ConversionPattern" value="%d{yyyy-MM-dd HH:mm:ss a} [Thread: %t][ Class:%c Method: %l ]%n%p:%m%n"/>
        </layout>
        <filter class="org.apache.log4j.varia.LevelRangeFilter">
            <param name="LevelMin" value="ERROR"/>
            <param name="LevelMax" value="ERROR"/>
        </filter>
    </appender>
 <!--通过<category></category>的定义可以将各个包中的类日志输出到不同的日志文件中-->
    <!--     <category name="com.gzy">
            <priority value="debug" />
            <appender-ref ref="log4jTestLogInfo" />
            <appender-ref ref="log4jTestDebug" />
        </category> -->
  <appender name="MAIL"     
      class="org.apache.log4j.net.SMTPAppender">     
      <param name="threshold" value="debug" />     
      <!-- 日志的错误级别     
       <param name="threshold" value="error"/>     
      -->     
      <!-- 缓存文件大小，日志达到512K时发送Email -->     
      <param name="BufferSize" value="512" /><!-- 单位K -->     
      <param name="From" value="test@163.com" />     
      <param name="SMTPHost" value="smtp.163.com" />     
      <param name="Subject" value="juyee-log4jMessage" />     
      <param name="To" value="test@163.com" />     
      <param name="SMTPUsername" value="test" />     
      <param name="SMTPPassword" value="test" />     
      <layout class="org.apache.log4j.PatternLayout">     
       <param name="ConversionPattern"     
        value="%-d{yyyy-MM-dd HH:mm:ss.SSS a} [%p]-[%c] %m%n" />     
      </layout>     
   </appender> 
    
    
     <root>
        <priority value="debug"/>
        <appender-ref ref="CONSOLE" /> 
        <appender-ref ref="log4jDebug" /> 
        <appender-ref ref="log4jInfo" />
        <appender-ref ref="log4jWarn" />
        <appender-ref ref="log4jError" />
        <!-- <appender-ref ref="MAIL" /> -->
    </root>
</log4j:configuration>
```
