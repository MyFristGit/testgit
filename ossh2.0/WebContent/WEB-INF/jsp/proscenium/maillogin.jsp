<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html>
 <head>
 <title>可拖拽移动漂亮的zDialog弹出层代码</title>

<style>

body { background: #ffffff; color: #444; font-size:12px;}

a { color: #07c; text-decoration: none; border: 0; background-color: transparent; }

body, div, q, iframe, form, h5 { margin: 0; padding: 0; }

img, fieldset { border: none 0; }

body, td, textarea { word-break: break-all; word-wrap: break-word; line-height:1.6; }

body, input, textarea, select, button { margin: 0; font-size: 14px; font-family: Tahoma, SimSun, sans-serif; }

div, p, table, th, td { font-size:1em; font-family:inherit; line-height:inherit; }

h5 { font-size:12px; }

ol li,ul li{ margin-bottom:0.5em;}

pre, code { font-family: "Courier New", Courier, monospace; word-wrap:break-word; line-height:1.4; font-size:12px;}

pre{background:#f6f6f6; border:#eee solid 1px; margin:1em 0.5em; padding:0.5em 1em;}

#content { padding-left:50px; padding-right:50px; }

#content h2 { font-size:20px; color:#069; padding-top:8px; margin-bottom:8px; }

#content h3 { margin:8px 0; font-size:14px; COLOR:#693; }

#content h4 { margin:8px 0; font-size:16px; COLOR:#690; }

#content div.item { margin-top:10px; margin-bottom:10px; border:#eee solid 4px; padding:10px; }

hr { clear:both; margin:7px 0; +margin: 0;

border:0 none; font-size: 1px; line-height:1px; color: #069; background-color:#069; height: 1px; }

.infobar { background:#fff9e3; border:1px solid #fadc80; color:#743e04; }

.buttonStyle{width:64px;height:22px;line-height:22px;color:#369;text-align:center;background:url(images/buticon.gif) no-repeat left top;border:0;font-size:12px;}

.buttonStyle:hover{background:url(images/buticon.gif) no-repeat left -23px;}

</style>
 
 </head>
 <body>
      <div id="forlogin">
      <form id="mailLogin" action="mailSave.html" method="post">
       <input type="hidden" name="domain" value="xust.edu.cn" /> 
        <table width="85%" border="0" align="center" bordercolor="#666666">
       <tr>
			<td height="20px;" colspan="3"></td>
		</tr>
        <tr>
          <td width="50" align="right">用户名:</td>
          <td align="center"><input type="text" id="username" name="account_name" /></td>
        </tr>
		<tr>
			<td height="20px;"></td>
		</tr>
        <tr>
          <td align="right">密　码:</td>
          <td align="center"><input type="text" id="userpwd"  name="password"/></td>
        </tr>
        <tr>
			<td height="20px;"></td>
		</tr>
      </table>
      </form>
    </div>
 </body>
</html>
