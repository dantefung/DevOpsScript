<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<%
request.setAttribute("vEnter", "\n");
%>

<head>
    <title><fmt:message key="function.menu.customer.service"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.customer.service"/>"/>
</head>

<style>
.info-content{
	padding: 0px;
}
</style>

<form method="get" action="ic_infor_list.jhtml" onsubmit="return validateSearch(this)" class="form-inline">
	<div class="input-group">
		<input type="text" class="form-control" name="title" id="title" placeholder="<fmt:message key="ic.lable.key.word"/>" value="${param.title }" size="40">
   		<span class="input-group-btn">
     		<button class="btn btn-info" type="submit" name="search"><fmt:message key="operation.button.search"/></button>
   		</span>
    </div>
</form>

<hr/>

<c:if test="${sysUser.suspendStatus!=1 }">
	<wecs:power powerCode="memberInforDetail">
		<a class="btn btn-success col-md-2 col-xs-12" href="<c:url value="/member/ic_infor_view.jhtml"/>?strAction=memberInforDetail" role="button"><fmt:message  key='mi.leave.msg'/></a>
	</wecs:power>
</c:if>

<br/><br/>
<c:forEach items="${icInformationList }" var="icInformation">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">
					<span class="label label-info"><win:code listCode="infor.infortype" value="${icInformation.inforType}"/></span>
					<strong>${icInformation.title}</strong>
					<c:if test="${icInformation.status>3}">
						<img  src="${ctx}/themes/${theme }/images/icons/pm_replied.gif" border="0" align="absmiddle"/>
					</c:if>
					<c:if test="${icInformation.status<3}">
						<img  src="${ctx}/themes/${theme }/images/icons/pm_notread.gif" border="0" align="absmiddle"/>
					</c:if>
				</div>
				<div class="col-md-4 text-right">
					<c:if test="${sysUser.freezeStatus==0 }">	
		 				<c:if test="${(icInformation.sendRoute =='1') && (icInformation.status <=0 )}">
		 					<a class="btn btn-success btn-xs" href="ic_infor_view.jhtml?strAction=editMemberIcInfor&uniNo=${icInformation.uniNo}"><fmt:message key="operation.button.edit"/></a>
		 					
		 					<a class="btn btn-danger btn-xs" href="ic_infor_view.jhtml?strAction=delMemberIcInfor&uniNo=${icInformation.uniNo}"  ><fmt:message key="operation.button.delete"/></a>
		 				
		 				</c:if>
	 				</c:if>
				</div>
			</div>
		</div>
  		<div class="panel-body info-content">
  			<table width='100%' cellpadding='6' cellspacing='6' border='0'>
				<tr>
					<td valign='top' width='50%' style='padding:5px;word-wrap:break-word;word-break:break-all;' class="bg-success">
		 				<font color='#888888'><fmt:message  key="pd.createUserNo"/>:</font>
		 				<font color='blue'>${icInformation.createUser}<c:if test="${icInformation.createName!=''}">&nbsp;/&nbsp;</c:if>${icInformation.createName}</font>&nbsp;&nbsp;
		 			 	<font color='blue'><fmt:formatDate value="${icInformation.createTime }" pattern="yyyy-MM-dd"/> </font><br/>
		 				<br/> 
		 				 ${fn:replace(icInformation.content, vEnter, '<br>')}
					</td>
					<td valign='top' width='100%' style='padding:5px;word-wrap:break-word;word-break:break-all;' class="bg-warning">
		  				<c:choose>
			  				<c:when test="${(icInformation.sendRoute =='1')}">
			  					<!-- 报单中心/会员发送 -->
			  					<c:if test="${icInformation.status <2 }">
			  						 <font color ='red'><fmt:message  key="ammessage.noreplynum"/></font>
			  					</c:if>
			  					<c:if test="${icInformation.status >=2 }">
									${fn:replace(icInformation.replyContent, vEnter, '<br>')}
			  					</c:if>
			  				</c:when>
		  					<c:when test="${ icInformation.sendRoute =='0'}">
		  					<!-- 公司发送 -->
				  			<c:if test="${sysUser.freezeStatus==0 }">
			  					<c:if test="${icInformation.status >=3 && icInformation.status <4 }">
			  					<a href="ic_infor_view.jhtml?strAction=replyMemberIcInfor&uniNo=${icInformation.uniNo}"  ><img  src="${ctx}/themes/${theme }/images/icons/editIcon.gif" border="0" align="absmiddle" style="cursor:pointer"
			 									title="<fmt:message  key='operation.button.send'/>" alt="<fmt:message  key='operation.button.send'/>" /> </a>
			 					</c:if>
		 					</c:if>
		 						 ${fn:replace(icInformation.replyContent, vEnter, '<br>')}
		  					</c:when>
		  				 	 
		  				 </c:choose>
 				
 					</td>
 				</tr>
 			</table>
  		</div>
	</div>
</c:forEach>

<win:page pageId="icInformationListPage" action="ic_infor_list.jhtml" autoIncludeParameters="true"/>
	
<script type="text/javascript">
$(function() {

});

function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>