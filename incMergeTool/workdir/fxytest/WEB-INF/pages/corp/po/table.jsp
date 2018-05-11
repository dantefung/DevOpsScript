<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table> 
                    <tr>
                       <td>商品编号</td>
                       <td>商品名称</td>
                       <td>单价</td>
                       <td>订购数量</td>
                       <td>小计</td>
                    </tr>
                    
                    <c:forEach items="${pmProductList}" var="pmProductVar">
                     <tr>
                       <td>${pmProductVar.product_code}</td>
                       <input type ="hidden" name ="productCode"  value="${pmProductVar.product_code}"/>
                       
                       <td>${pmProductVar.product_name}</td>
                       <td><div id="price_${pmProductVar.product_code}">${pmProductVar.unit_price}</div></td>
                       
                       <td>
                       <input type ="text" name ="quantity_${pmProductVar.product_code}" id ="quantity_${pmProductVar.product_code}" autocomplete="off" value="${pmProductVar.quantity}"/>
                       </td>
                       
                       <input type ="hidden" name ="subt" id="subt_${pmProductVar.product_code}" value="0"/>
                       <td><div id="subtotal_${pmProductVar.product_code}">0</div></td>  
                                 
                    </tr>        
                   </c:forEach>  
                    <input type ="hidden" name ="total" value=""/>
                    <td><span>合 计:</span></td><td><div id="total">0</div></td> 
                    <tr>
             
            </tr>    
      </table>

</body>
</html>