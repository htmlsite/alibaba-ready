el表达式
---

## .与 [ ] 运算符
- . 直接获取属性值,属性值不能为符号字符
- [] 可以取符号字符的属性值,也可动态获取参数

## EL变量

|属性范围（jstl名称）|EL中的名称|
|---|---|
|Page|pageScope|
|Request|requestScope|
|Session|sessionScope|
|Application|applicationScope|

## EL隐含对象

|PageContext|javax.servlet.ServletContext|表示此JSP的PageContext|
|---|---|---|
|PageScope|java.util.Map|取得Page范围的属性名称所对应的值|
|RequestScope|java.util.Map|取得Request范围的属性名称所对应的值|
|sessionScope|java.util.Map|取得Session范围的属性名称所对应的值|
|applicationScope|java.util.Map|取得Application范围的属性名称所对应的值|
|param|java.util.Map|如同ServletRequest.getParameter(String name)。回传String类型的值|
|paramValues|java.util.Map|如同ServletRequest.getParameterValues(String name)。回传String[]类型的值|
|header|java.util.Map|如同ServletRequest.getHeader(String name)。回传String类型的值|
|headerValues|java.util.Map|如同ServletRequest.getHeaders(String name)。回传String[]类型的值|
|cookie|java.util.Map|如同HttpServletRequest.getCookies()|
|initParam|java.util.Map|如同ServletContext.getInitParameter(String name)。回传String类型的值

## blog文章
- [jsp中el表达式](https://blog.csdn.net/lililidahaoren/article/details/78678736)
