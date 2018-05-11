<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title><fmt:message key="报单中心管理" /></title>
<meta name="heading" content="<fmt:message key="报单中心管理"/>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
</head>

<div class="searchBar">
	<form method="get" action="miAgents.jhtml"
		onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd>
					<fmt:message key="label.company" />
				</dd>
				<dd>
					<select name="companyCode" id="companyCode">
						<option value=""></option>
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode} - ${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt>会员编号</dt>
			<dd>
				<input type="text" name="userCode" value="${param.userCode }" />
			</dd>
		</dl>
		<dl>
			<dt>类型</dt>
			<dd>
				<win:list name="agentType" listCode="agent_types" defaultValue="" value="${param.agentType }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt>
				创建(申请)时间
				<input type="hidden" name="dateType" value="createTime"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>
				合同日期范围内
			</dt>
			<dd>
				<input type="text" name="theDate" id="theDate" value="${param.theDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>状态</dt>
			<dd>
				<win:list name="status" listCode="mi_agent_status" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<%-- <dl>
			<dt>地区</dt>
			<dd>
				<select name="country" id="country" style="width:135px;display: none;"></select>
    			<select name="province" id="province" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
    			<select name="city" id="city" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
    			<select name="district" id="district" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
			</dd>
		</dl> --%>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<!-- <a href="viewMiAgentsInMap.jhtml" name="view">地图模式查看</a> -->
				<input type="hidden" name="strAction" value="listMiAgents" />
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miAgentFunctionForm" id="miAgentFunctionForm"
		action="handleMiAgent.jhtml" method="post">
		<%@ include file="/common/messages.jsp"%>

		<div class="functionBar">
			<win:power powerCode="addMiAgent">
				<a href="editMiAgent.jhtml?strAction=addMiAgent" name="add">
					<fmt:message key="operation.button.add" />
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<%-- <win:power powerCode="checkMiAgent">
				<a href="javascript:multiCheckMiAgent()" name="check">审核</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="uncheckMiAgent">
				<a href="javascript:multiUncheckMiAgent()" name="uncheck">取消</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiAgent">
				<a href="javascript:multiDeleteMiAgent()" name="multiDelete">
					<fmt:message key="operation.button.delete" />
				</a>
			</win:power> --%>
		</div>
		<input type="hidden" name="selectedAgentIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>

	<form id="miAgentListTableForm" method="get">
		<ec:table tableId="miAgentListTable" items="miAgents"
			var="miAgentVar" action="miAgents.jhtml" width="100%"
			method="get" autoIncludeParameters="true"
			retrieveRowsCallback="limit" rowsDisplayed="20" sortable="false"
			form="miAgentListTableForm">
			<ec:exportXls fileName="miAgents.xls"></ec:exportXls>
			<ec:row>
				<%-- <ec:column alias="chkAgentId" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${miAgentVar.status!=9 }">
						<input type="checkbox" name="chkAgentId" value="${miAgentVar.agent_id}" class="checkbox" />
					</c:if>
				</ec:column> --%>

				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<win:power powerCode="viewMiAgent">
						<a href="viewMiAgent.jhtml?strAction=viewMiAgent&agentId=${miAgentVar.agent_id}" name="view"><fmt:message key="button.view" /></a>
					</win:power>
					<win:power powerCode="editMiAgent">
						<a href="editMiAgent.jhtml?strAction=editMiAgent&agentId=${miAgentVar.agent_id}" name="edit"><fmt:message key="button.edit" /></a>
					</win:power>
					<%-- <c:if test="${miAgentVar.status==0 }">
						<win:power powerCode="checkMiAgent">
							<a href="handleMiAgent.jhtml?strAction=checkMiAgent&agentId=${miAgentVar.agent_id}" name="check">审核</a>
						</win:power>
					</c:if>
					<c:if test="${miAgentVar.status==1 }">
						<win:power powerCode="uncheckMiAgent">
							<a href="handleMiAgent.jhtml?strAction=uncheckMiAgent&agentId=${miAgentVar.agent_id}" name="uncheck">取消</a>
						</win:power>
					</c:if> --%>
				</ec:column>
				<ec:column property="company_code" title="公司" />
				<ec:column property="Agent_type" title="类型">
					<win:code listCode="agent_types" value="${miAgentVar.agent_type }" />
				</ec:column>
				<ec:column property="user_code" title="会员编号" />
				<ec:column property="user_name" title="会员姓名" />
				<%-- <ec:column property="region_name" title="地区" /> --%>
				<ec:column property="startDate" title="合同日期">
					${fn:substring(miAgentVar.start_date,0,10) } 至  ${fn:substring(miAgentVar.end_date,0,10) }
				</ec:column>
				<ec:column property="mobile" title="手机号码" />
				<ec:column property="email" title="电子邮箱" />
				<ec:column property="Status" title="状态">
					<win:code listCode="mi_agent_status" value="${miAgentVar.status }" />
				</ec:column>
				<ec:column property="Creator_code" title="创建时间">
					${miAgentVar.creator_code } - ${miAgentVar.create_time }
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate,#theDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
	$("a[name='view']",".searchBar").button({
        icons: {
            primary: "ui-icon-search"
        }
    });
});
$(document).ready(function(){
    <c:if test="${not empty district}">
		refreshChildRegions("${province.regionId}","2860","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("${district.regionId}","${city.regionId}","district");
		
	</c:if>
	<c:if test="${not empty city && empty district }">
		refreshChildRegions("${province.regionId}","2860","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("-1","${city.regionId}","district");
		
	</c:if>
	<c:if test="${not empty province && empty city }">
		refreshChildRegions("${province.regionId}","2860","province");
		refreshChildRegions("-1","${province.regionId}","city");
		
	</c:if>
	<c:if test="${empty province}">
		 refreshChildRegions("-1","2860","province");
	</c:if>
	
	 $('#country').change(function(){
    	refreshChildRegions("-1",$(this).children('option:selected').val(),"province");
    	refreshChildRegions("-1","-1","city");
    	refreshChildRegions("-1","-1","district");
    });
    $('#province').change(function(){
    	refreshChildRegions("-1",$(this).children('option:selected').val(),"city");
    	refreshChildRegions("-1","-1","district");
    });
    $('#city').change(function(){
    	refreshChildRegions("-1",$(this).children('option:selected').val(),"district");
    });
  //如果分公司是中国，则可以选择国家
    if('${companyCode}'=="AA"){
    	document.getElementById("country").style.display = "";
    }	
})
function refreshChildRegions(selectedValue, regionId, targetObjId){
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,'${companyCode}', function(data){
 		dwr.util.addOptions(targetObjId, data);
 		document.getElementById(targetObjId).value = selectedValue;
	});
}
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiAgent(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAgentId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miAgentFunctionForm;
	theForm.selectedAgentIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiAgent";
	
	showLoading();
	theForm.submit();
}

function multiCheckMiAgent(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAgentId"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要审核的报单中心'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认审核当前所选择的报单中心'/>.")){
		return;
	}
	var theForm=document.miAgentFunctionForm;
	theForm.selectedAgentIds.value=selectedValues;
	theForm.strAction.value="checkMiAgent";
	
	showLoading();
	theForm.submit();
}

function multiUncheckMiAgent(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAgentId"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要取消的报单中心'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认取消当前所选择的报单中心'/>.")){
		return;
	}
	var theForm=document.miAgentFunctionForm;
	theForm.selectedAgentIds.value=selectedValues;
	theForm.strAction.value="uncheckMiAgent";
	
	showLoading();
	theForm.submit();
}
</script>