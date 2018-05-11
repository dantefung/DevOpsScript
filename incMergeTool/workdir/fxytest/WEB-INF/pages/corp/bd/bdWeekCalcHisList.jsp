<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="周结收益查询"/></title>
    <meta name="heading" content="<fmt:message key="周结收益查询"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdWeekCalcHiss.jhtml" onsubmit="return validateSearch(this)">
		<win:power powerCode="listBdWeekCalcHiss">
			<c:if test="${strAction=='listBdWeekCalcHiss' }">
			<c:if test="${not empty alCompanys}">
				<dl>
					<dd><fmt:message key="label.company"/></dd>
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
				<dt><fmt:message key="fiAwardTemp.week" />:</dt>
				<dd>
					<select name="wweek" id="wweek">
						<option value=""></option>
						<c:forEach items="${bdPeriods }" var="bdPeriodVar">
							<option value="${bdPeriodVar.wweek }"<c:if test="${param.wweek==bdPeriodVar.wweek }"> selected</c:if>>${bdPeriodVar.wweek }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>会员编号</dt>
				<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
			</dl>
			<dl>
				<dt>会员姓名</dt>
				<dd><input type="text" name="userName" value="${param.userName }"/></dd>
			</dl>
			<dl>
				<dt>是否发放</dt>
				<dd>
					<win:list name="sendStatus" listCode="yesno" defaultValue="" value="${param.sendStatus }" showBlankLine="true"/>
				</dd>
			</dl>
			</c:if>
		</win:power>
		<win:power powerCode="listBdWeekCalcHissComm">
		<c:if test="${strAction=='listBdWeekCalcHissComm' }">
			<dl>
				<dt>会员编号</dt>
				<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
			</dl>
			<dl>
				<dt>会员姓名</dt>
				<dd><input type="text" name="userName" value="${param.userName }"/></dd>
			</dl>
			</c:if>
		</win:power>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="${strAction }"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td align="right" class="footer" colspan="6"><fmt:message key="report.allTotal"/>：</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisMap.total_bonus_money}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisMap.total_deduct_re_sell}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisMap.total_deduct_coupon}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisMap.total_send_money}</fmt:formatNumber></b>
		</td>
	</tr>
</c:set>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	
	<form id="bdWeekCalcHisListTableForm" method="get" >
		<ec:table 
			tableId="bdWeekCalcHisListTable"
			items="bdWeekCalcHiss"
			var="bdWeekCalcHisVar"
			action="bdWeekCalcHiss.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdWeekCalcHisListTableForm" footer="${footTotalVar}">
			<ec:row>
				<win:power powerCode="viewBdWeekCalcHis">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="viewBdWeekCalcHis.jhtml?strAction=viewBdWeekCalcHis&id=${bdWeekCalcHisVar.id}" name="view"><fmt:message key="button.view"/></a>
					</ec:column>
				</win:power>
				<ec:column property="company_code" title="分公司" />
				<ec:column property="w_week" title="工作周" />
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="star" title="荣誉级别">
					<win:code listCode="stars_level" value="${bdWeekCalcHisVar.star }"/>
				</ec:column>
				<%-- <ec:column property="next_star" title="下周荣誉级别">
					<win:code listCode="stars_level" value="${bdWeekCalcHisVar.next_star }"/>
				</ec:column> --%>
				<ec:column property="bonus_money" title="应发" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisVar.bonus_money}</fmt:formatNumber>
				</ec:column>
				<ec:column property="deduct_re_sell" title="扣复投积分" styleClass="numberColumn" />
				<ec:column property="deduct_coupon" title="扣购物券" styleClass="numberColumn" />
				<ec:column property="send_money" title="实发" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisVar.send_money}</fmt:formatNumber>
				</ec:column>
				<%-- <ec:column property="sendMoney" title="应发收益" />
				<ec:column property="sendStatus" title="是否发放" /> --%>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	if('${strAction}'=="listBdWeekCalcHissComm"){
		if((theForm.memberNo.value==null || theForm.memberNo.value=="") && (theForm.userName.value==null || theForm.userName.value=="")){
			alert("请输入会员编号/姓名 进行查询");
			return false;
		}
	}
	showLoading();
	return true;
}

function multiDeleteBdWeekCalcHis(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdWeekCalcHisFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteBdWeekCalcHis";
	
	showLoading();
	theForm.submit();
}
</script>