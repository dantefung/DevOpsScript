<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSmsQueueDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysSmsQueueDetail.add"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysSmsQueue" method="post" action="editSysSmsQueue.jhtml" onsubmit="return validateForm(this)" id="sysSmsQueueForm">
    
    <spring:bind path="sysSmsQueue.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		 
    		<td>
			<fmt:message key="sys.telephone"/>：<input type ="text" name ="phoneNum" id ="phoneNum"/>
    		<input type="button" id="addPhone"  value="<fmt:message key="sys.add.phone"/>"/>
			</td>
    	</tr>
    	<tr>
    		<td>
    			<select id="selectPhone" name="selectPhone" size=10  multiple style="width: 290px; height: 350px;">
	        	 
	    		</select>
    		</td>
    		<td><input type="button" id="removePhone" value="<fmt:message key="sys.delete.phone"/>"/></td>
    		<td><textarea name="content" id="content" rows="22" cols="40"></textarea>  </td>
    	</tr>
    	<tr>
    		<td colspan="3">
    			<div class="buttonBar">
    				<form:hidden path="queueId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false" ><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysSmsQueue.queueId }">
    					<win:power powerCode="deleteSysSmsQueue">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysSmsQueue')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	var content = $('#content').val();
    if( content == ""){
        alert('<fmt:message key="amSiteMessage.content.isNotNull"/>！');
        $("#content").focus();
        return false;
    }
    if( $('#phoneNum').val() == ""){
        alert('<fmt:message key="sys.telephone.null.requie"/>！');
        $("#phoneNum").focus();
        return false;
    }
	//其它验证
	showLoading();
	return true;
}
 
 
 
$(document).ready(function(){
    
	$("#addPhone").click(function(){
		var i=$('#selectPhone option').length;
		
		mobile_phone = $("#phoneNum").val();
		 var reg = /^0?1[358]\d{9}$/;
		    if (!reg.test(mobile_phone)){
		        alert('手机号码错误');
		    }
		    else{
		    	 
		    	 $("#selectPhone").append( "<option value='"+mobile_phone+"' >"+mobile_phone+"</option>" );
		    		i++;
		    		
		    }
	});
	$("#removePhone").click(function(){
		temp =$('#selectPhone').val(); 
		$("#selectPhone option[value='"+temp+"']").remove(); 
 
	});
	$("#sysSmsQueueForm").submit(function(){
		//temp=${'#content'}.val();
		$("#selectPhone").children().each(function(){$(this).attr("selected","selected")});
		
       
 
 
	});
});
</script>