<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
  <%@page import="cn.edu.bzu.dao.CommodityDAO,cn.edu.bzu.entity.Commodity"%>
  <%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <html>
   <head>
     <title>Commodity</title>
   </head>
   
   <body>
   <table border="1" align="center">
   	   <tr>
   	    <td> <img src="https://tse1-mm.cn.bing.net/th?id=OIP.MeRU1-et9q_QheGz3ZsfEwHaF_&w=240&h=186&c=7&o=5&dpr=1.5&pid=1.7" width="50" height="50"/> </td>
        <td> <img src="https://tse1-mm.cn.bing.net/th?id=OIP.ruj2_9prmxeWIpvtoNYLXgHaHa&w=218&h=218&c=7&o=5&dpr=1.5&pid=1.7" width="50" height="50"/> </td>
        <td> <img src="https://tse2-mm.cn.bing.net/th?id=OIP.FkzwNaY-eHQWlVZMbFm0MAHaE7&w=292&h=194&c=7&o=5&dpr=1.5&pid=1.7" width="50" height="50"/> </td>
       </tr>
       <tr>
           <td>id</td>
           <td>name</td>
           <td>amounts</td>
           <td>prices</td>
       </tr>
         <%
            CommodityDAO dao=new CommodityDAO();
        	
            List<Commodity> list =dao.readFirstTitle();    
            for(Commodity tl:list)
            {%>
           <tr>
               <td><%=tl.getId() %></td>
               <td><%=tl.getName() %></td>
               <td><%=tl.getAmounts() %></td>
               <td><%=tl.getPrices() %></td>
           </tr>
             <%}
        %>
   </table>
   </body>
 </html>