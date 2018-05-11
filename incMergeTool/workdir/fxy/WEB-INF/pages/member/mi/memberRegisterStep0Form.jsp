<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.memberRegister"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.memberRegister"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<form:form commandName="miMember" method="post" action="memberRegisterStep0.jhtml" name="memberRegisterForm" id="memberRegisterForm">
	<input type="hidden" id="newMemberKey" name="newMemberKey" value="${newMemberKey}"/>
  	<input type="hidden" id="strAction" name="strAction" value="${strAction}"/>
  
  	<div class="panel-body">
		<ul class="nav nav-tabs" id="agreementTab">
			<li role="presentation" class="active"><a href="#agreement">${icOnePage.pageTitle }</a></li>
  			<li role="presentation"><a href="#protocol">${icOnePageProtocol.pageTitle }</a></li>
		</ul>
		<div class="tab-content" id="agreement-content" style="height:400px;overflow: scroll;line-height: 24px;">
	   		<div class="tab-pane active" id="agreement">${fn:replace(icOnePage.pageText, vEnter, '<br>')}</div>
	     	<div class="tab-pane" id="protocol">${fn:replace(icOnePageProtocol.pageText, vEnter, '<br>')}</div>
	    </div>
	</div>
   
   <table class="detail" width="100%" border="0" cellspacing="0" cellpadding="0">
   	<tr>
   		<td colspan="2">
   			<div class="buttonBar">
   				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
  				<c:if test="${strAction=='memberRegisterAgreen' }"> 
  					<button type="button" name="previous" class="btn btn-danger" onclick="window.location='logout.jsp';"><fmt:message key="mi.noagree.treaty"/></button>
  				</c:if> 
  				<c:if test="${strAction =='memberRegister' }">
  					<button type="button" name="previous" class="btn btn-danger" onclick="javascript:history.back();"><fmt:message key="mi.noagree.treaty"/></button>
  				</c:if>
  					<button type="submit" name="next" class="btn btn-success" onclick="bCancel=false"><fmt:message key="mi.agree.treaty"/></button>
              </div>
  		</td>
  	</tr>
  </table>
 
 </form:form>


<script type="text/javascript">
$(document).ready(function(){
	$('#agreementTab a').click(function (e) {
      e.preventDefault();//阻止a链接的跳转行为
      $(this).tab('show');//显示当前选中的链接及关联的content
    });
})
</script>