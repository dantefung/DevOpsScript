<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.recommand.menu.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.recommand.menu.title"/>"/>
</head>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
<div class="searchBar">
	<form method="get" action="miRecommendChanges.jhtml" onsubmit="return validateSearch(this)">
	<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="miMemberApalyCheck.askForNo"/></dt>
			<dd><input type="text" name="applyCode" value="${param.applyCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.recommend.old.leble"/></dt>
			<dd><input type="text" name="recommendNo" value="${param.recommendNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.newRecommendNo"/></dt>
			<dd><input type="text" name="newRecommendNo" value="${param.newRecommendNo }"/></dd>
		</dl>
		<dl>
			<dt><win:list name="timeType" listCode="mi.time.type.list" defaultValue="" value="${param.timeType }" showBlankLine="true"/></dt>
			<dd><fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd><win:list listCode="member_apply_status" defaultValue="" name="status" value="${param.status }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="contains.attachment"/></dt>
			<dd><win:list listCode="yesno" defaultValue="" name="hasAttach" value="${param.hasAttach }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<c:if test="${empty param.strAction || param.strAction=='listMiMemberApplys'}">
		<form name="miMemberApplyFunctionForm" id="miMemberApplyFunctionForm" action="editMiMemberApply.jhtml" method="post" >
			<%@ include file="/common/messages.jsp" %>
			<div class="functionBar">
				<win:power powerCode="addMiRecommendChange">
					<a href="miRecommendChangeForm.jhtml?strAction=addMiRecommendChange" name="add"><fmt:message key="mi.recommend.change.apply"/></a>
					<span class="divider">&nbsp;</span>
				</win:power>
			</div>
			<input type="hidden" name="selectedApplyCodes">
			<input type="hidden" name="strAction">
			<input type="hidden" name="_form_uniq_id" value="${form.token}" />
		</form>
	</c:if>
	<form id="miMemberApplyListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyListTable"
			items="miMemberApplys"
			var="miMemberApplyVar"
			action="miRecommendChanges.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewMiRecommendChange">
						<a href="viewMiRecommendChange.jhtml?applyCode=${miMemberApplyVar.apply_code}" name="view"><fmt:message key="function.menu.view"/></a>
					</win:power>
					<c:if test="${empty param.strAction || param.strAction=='listMiRecommendChange'}">
						<win:power powerCode="addMiRecommendChangeFile">
							<a href="editMiMemberApplyFile.jhtml?strAction=addMiRecommendChangeFile&applyCode=${miMemberApplyVar.apply_code}" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
						</win:power>
						<c:if test="${miMemberApplyVar.status == 0 }">
							<win:power powerCode="submitMiMemberApply">
								<a href="javascript:subApply('${miMemberApplyVar.apply_code}');" name="join"><fmt:message key="button.submit"/></a>
							</win:power>
						</c:if>
						<c:if test="${miMemberApplyVar.status == -1 || miMemberApplyVar.status == 0}">
							<win:power powerCode="deleteMiMemberApply">
								<a href="javascript:cancleApply('${miMemberApplyVar.apply_code}');" name="exit"><fmt:message key="efubo.card.zf"/></a>
							</win:power>
						</c:if>
					</c:if>
				</ec:column>
				<ec:column property="apply_code" title="mi.askFor.no" >
					<nobr>
						${miMemberApplyVar.apply_code }
						<c:if test="${miMemberApplyVar.attach_count>0 }">
						<span class="ui-icon ui-icon-attachment" style="display:inline-block;vertical-align: text-bottom;"></span>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="apply_type" title="mi.apply.type" >
					<win:code listCode="mi.apply.type.list"  value="${miMemberApplyVar.apply_type }" />
				</ec:column>
				<ec:column property="creater_code" title="pmProductSppm.createUser" />
				<ec:column property="create_time" title="pd.createTime" />
				<ec:column property="checker_code" title="mi.handler" />
				<ec:column property="check_time" title="mi.handle.time" />
				<ec:column property="status" title="fi.status">
					<win:code listCode="member_apply_status" value="${miMemberApplyVar.status}"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
	<form action="miRecommendChangeForm.jhtml" method="post" name="cancleForm" id="cancleForm">
		<input type="hidden" name="strAction" value="deleteMiRecommendChange"/>
		<input type="hidden" name="applyCode"/>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
function subApply(applyCode){
	<win:power powerCode="submitMiRecommendChange">
		if(confirm("<fmt:message key='mi.suresubmitm'/>")){
		//	window.location.href = "miRecommendChangeForm.jhtml?strAction=submitMiRecommendChange&applyCode="+applyCode;
			document.cancleForm.applyCode.value = applyCode;
			document.cancleForm.strAction.value = "submitMiRecommendChange";
			document.cancleForm.submit();
		}
	</win:power>
}
function cancleApply(applyCode){
	<win:power powerCode="deleteMiRecommendChange">
		if(confirm("<fmt:message key='button.confirm.invalid'/>?")){
			document.cancleForm.applyCode.value = applyCode;
			document.cancleForm.strAction.value = "deleteMiRecommendChange";
			document.cancleForm.submit();
		}
	</win:power>
}
$(document).ready(function(){
	$("a[name='view']").colorbox({iframe:true, width:"80%", height:"80%",title:true});

});
$(function() {
	$( "#startDate" ).datepicker();
	$( "#endDate" ).datepicker();
});

</script>