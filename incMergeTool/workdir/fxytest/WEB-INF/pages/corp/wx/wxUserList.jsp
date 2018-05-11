<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxUserList.title"/></title>
    <meta name="heading" content="<fmt:message key="wxUserList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="wxUsers.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listWxUsers"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="wxUserFunctionForm" id="wxUserFunctionForm" action="editWxUser.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxUser">
				<a href="editWxUser.jhtml?strAction=addWxUser" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteWxUser">
				<a href="javascript:multiDeleteWxUser()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedWxOpenids">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="wxUserListTableForm" method="get" >
		<ec:table 
			tableId="wxUserListTable"
			items="wxUsers"
			var="wxUserVar"
			action="wxUsers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="wxUserListTableForm">
			<ec:row>
				<ec:column alias="chkWxOpenid" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkWxOpenid" value="${wxUserVar.wxOpenid}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editWxUser">
						<a href="editWxUser.jhtml?strAction=editWxUser&wxOpenid=${wxUserVar.wxOpenid}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewWxUser">
						<a href="viewWxUser.jhtml?strAction=viewWxUser&wxOpenid=${wxUserVar.wxOpenid}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="wxOpenid" title="wxUser.wxOpenid" />
				<ec:column property="sponsorWxOpenid" title="wxUser.sponsorWxOpenid" />
				<ec:column property="userCode" title="wxUser.userCode" />
				<ec:column property="wxUserCode" title="wxUser.wxUserCode" />
				<ec:column property="nickName" title="wxUser.nickName" />
				<ec:column property="signature" title="wxUser.signature" />
				<ec:column property="country" title="wxUser.country" />
				<ec:column property="province" title="wxUser.province" />
				<ec:column property="city" title="wxUser.city" />
				<ec:column property="sex" title="wxUser.sex" />
				<ec:column property="avatar" title="wxUser.avatar" />
				<ec:column property="avatarRemote" title="wxUser.avatarRemote" />
				<ec:column property="isAuth" title="wxUser.isAuth" />
				<ec:column property="isUnfollow" title="wxUser.isUnfollow" />
				<ec:column property="authExpireTime" title="wxUser.authExpireTime" />
				<ec:column property="isService" title="wxUser.isService" />
				<ec:column property="serviceType" title="wxUser.serviceType" />
				<ec:column property="serviceName" title="wxUser.serviceName" />
				<ec:column property="serviceNo" title="wxUser.serviceNo" />
				<ec:column property="lastServiceTime" title="wxUser.lastServiceTime" />
				<ec:column property="lastGetinfoTime" title="wxUser.lastGetinfoTime" />
				<ec:column property="markName" title="wxUser.markName" />
				<ec:column property="createTime" title="wxUser.createTime" />
				<ec:column property="lastVisitTime" title="wxUser.lastVisitTime" />
				<ec:column property="lastAlertTime" title="wxUser.lastAlertTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteWxUser(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkWxOpenid"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.wxUserFunctionForm;
	theForm.selectedWxOpenids.value=selectedValues;
	theForm.strAction.value="multiDeleteWxUser";
	
	showLoading();
	theForm.submit();
}
</script>