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
   <table border="1">
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