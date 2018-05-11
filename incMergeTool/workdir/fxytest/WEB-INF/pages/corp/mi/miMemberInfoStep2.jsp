<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApalyCheck.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApalyCheck.title"/>"/>
</head>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
<div class="contentBody">
	<form name="miMemberApplyFunctionForm" id="miMemberApplyFunctionForm"  >
		<%@ include file="/common/messages.jsp" %>
	</form>
	
	<form id="miMemberApplyListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyListTable"
			items="miMemberApplys"
			var="miMemberApplyVar"
			action="miMemberApplyChks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<a href="viewMiMemberApply.jhtml?strAction=viewMiMemberApply&applyCode=${miMemberApplyVar.apply_code}" name="view"><fmt:message key="function.menu.view"/></a>
				</ec:column>
				<ec:column property="apply_code" title="mi.askFor.no" />
				<ec:column property="apply_type" title="mi.apply.type" >
					<win:code listCode="mi.apply.type.list"  value="${miMemberApplyVar.apply_type }" />
				</ec:column>
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="creater_code" title="pmProductSppm.createUser" />
				<ec:column property="create_time" title="pd.createTime" />
				<%-- <ec:column property="checker_code" title="pmProductSppm.checkUser" />
				<ec:column property="check_time" title="icAnnounce.checkTime" /> --%>
				<ec:column property="status" title="fi.status">
					<win:code listCode="member_apply_status" value="${miMemberApplyVar.status}"/>
				</ec:column>
			</ec:row>
		</ec:table>
		</form>
		<table class="detail">
    	<tr>
    		<th class="required"><fmt:message key="busi.common.remark"/>:</th>
    		<td>${memberStatus.REMARK }</td>
    	</tr>
    </table>
    <form action="miMemberInfoStep3.jhtml" method="post"  onsubmit="return validateForm();">
    <table class="detail">
        <tr><th class="required"><fmt:message key="miMember.memberNo"/></th>
        	<td>${memberStatus.MEMBER_NO }</td>
        </tr>
    	<tr><th class="required" ><fmt:message key="poOrder.memberName"/></th>
    		<td>${memberStatus.FIRST_NAME }${memberStatus.LAST_NAME }</td>
    	</tr>
    	<tr><th class="required"><fmt:message key="mi.activity.status"/></th>
    		<td <c:if test="${memberStatus.ACTIVE_STATUS == '0' }">style="color: red"</c:if> <c:if test="${memberStatus.ACTIVE_STATUS == '1' }">style="color: green"</c:if>><win:code listCode="member.activestatus" value="${memberStatus.ACTIVE_STATUS }"/> </td>
    	</tr>
    	<%-- <tr>
    		<th class="required"><fmt:message key="mi.congelation.status"/></th>
    		<td <c:if test="${memberStatus.FREEZE_STATUS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.FREEZE_STATUS == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${memberStatus.FREEZE_STATUS }"/></td>
    	</tr> --%>
    	<tr>
    		<th class="required">账户(<fmt:message key="mi.new.frost.status"/>)</th>
    		<td <c:if test="${memberStatus.FREEZE_MENU_ACCOUNTS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.FREEZE_MENU_ACCOUNTS == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${memberStatus.FREEZE_MENU_ACCOUNTS }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.userupdate"/>(<fmt:message key="mi.new.frost.status"/>)</th>
    		<td <c:if test="${memberStatus.FREEZE_MENU_INFO == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.FREEZE_MENU_INFO == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${memberStatus.FREEZE_MENU_INFO }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.lable.limit.status"/></th>
    		<td <c:if test="${memberStatus.SUSPEND_STATUS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.SUSPEND_STATUS == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.suspendstatus" value="${memberStatus.SUSPEND_STATUS }"/></td>
    	</tr>
    	<tr><th class="required"><fmt:message key="mi.concle.status"/></th>
    		<td <c:if test="${memberStatus.EXIT_STATUS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.EXIT_STATUS == '0' }">style="color: green"</c:if>><win:code listCode="member.exitstatus" value="${memberStatus.EXIT_STATUS }"/></td>
    	</tr>
    	<c:if test="${miMember.companyCode=='CN' }">
	    	<tr>
	    		<th class="required"><fmt:message key="mi.bound.account"/>:</th>
	    		<td>
	    			<c:if test="${not empty fiBankbookBalance.balance}">
	    				<fmt:formatNumber pattern="###,##0.00" value="${fiBankbookBalance.balance }" />
	    			</c:if>
	    			<c:if test="${empty fiBankbookBalance.balance}">
	    				0.00
	    			</c:if>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="mi.award.account"/>:</th>
	    		<td><fmt:formatNumber pattern="###,##0.00" value="${bonusAccount.avail_balance }" /></td>
	    	</tr>
	    	<%-- <tr>
	    		<th class="required"><fmt:message key="mi.bound.account.cancle"/>:</th>
	    		<td><fmt:formatNumber pattern="###,##0.00" value="${bonusCancleAccount.avail_balance }" /></td>
	    	</tr> --%>
	    	<%-- <tr>
	    		<th class="required"><fmt:message key="me.nowzb"/>:</th>
	    		<td><win:code listCode="plate_type" value="${plPlateOnline.plateType }"/></td>
	    	</tr> --%>
	    	<tr>
	    		<th class="required"><fmt:message key="mi.member.team"/>:</th>
	    		<td><c:if test="${not empty miMember }">${miMember.memberNo }(${miMember.firstName }${miMember.lastName })</c:if></td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="busi.is.agent"/>:</th>
	    		<td><win:code listCode="yesno" value="${member.isAgent }"></win:code> </td>
	    	</tr>
	    	
	    	<tr>
	    		<th class="required"><fmt:message key="mi.agent.store.type.lable"/>:</th>
	    		<td><c:if test="${member.isAgent==1 }"><win:code listCode="mi.store.type.list" value="${member.storeType }"/></c:if></td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="modify_type" value="${param.modify_type }"/>
    				<input type="hidden" name="userCode" value="${param.userCode }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				
    				<button type="button" name="previous" onclick="window.location='miMemberApplyStep1.jhtml?userCode=${param.userCode}&modify_type=${param.modify_type}'"><fmt:message key="button.previous"/></button>
    				<win:power powerCode="miMemberInfoStep2">
    					<button type="submit" name="next" onclick="bCancel=false;"><fmt:message key="button.next"/></button>
    				</win:power>
                </div>
    		</td>
    	</tr>
    </table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
function validateForm() {
	if(bCancel){
		showLoading();
		return true;
	}
	if('${modify_type}'=="memberPoint" && '${member.isAgent}' == "1"){
		if(confirm("<fmt:message key="mi.pointChange.prompt"/>")){
			return true;
		}else{
			return false;
		}
	}else{
		return true;
	}
}
$(document).ready(function(){
	$("a[name='view']").colorbox({iframe:true, width:"80%", height:"80%",title:true});
	$("button[name='next']").button({
        icons: {
            primary: "ui-icon-next"
        }
    });
	$("button[name='previous']").button({
        icons: {
            primary: "ui-icon-previous"
        }
    });

});
</script>