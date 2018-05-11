<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="bdBonusRealTimeData.title"/></title>
	<meta name="heading" content="<fmt:message key="bdBonusRealTimeData.title"/>" />
</head>

<div class="searchBar">
	<form method="get" action="bdBonusRealTimeData.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd>
				<input type="text" name="memberNo" value="${param.memberNo }" />
			</dd>
		</dl>
		<dl>
			<dt>
				<fmt:message key="lang.range.of.date"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;"/>
				-<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="lang.network.type"/></dt>
			<dd><win:list name="linkType" listCode="uplink_type" defaultValue="recommend" value="${param.linkType }"/> </dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="bdBonusRealTimeData"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="bdAwardsLogFunctionForm" id="bdAwardsLogFunctionForm" action="editBdAwardsLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<a href="javascript:history.go(-1);" name="return">
				<fmt:message key="operation.button.return"/>
			</a>
			<span class="divider">&nbsp;</span>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdAwardsLogListTableForm" method="get" >
		<ec:table 
			tableId="bdAwardsLogListTable"
			items="realTimeDatas"
			var="bdAwardsLogVar"
			action="bdBonusRealTimeData.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdAwardsLogListTableForm" showPagination="false">
			<ec:exportXls fileName="bdRtData.xls"/>
			<ec:row>
				<ec:column property="member_no" title="miMember.memberNo">
					<c:if test="${bdAwardsLogVar.member_no!=param.memberNo }">
						<a href="bdBonusRealTimeData.jhtml?memberNo=${bdAwardsLogVar.member_no }&startDate=${param.startDate }&endDate=${param.endDate }&search=&strAction=bdBonusRealTimeData">
					</c:if>
						${bdAwardsLogVar.member_no }
					<c:if test="${bdAwardsLogVar.member_no!=param.memberNo }">
						</a>
					</c:if>
					<c:if test="${bdAwardsLogVar.is_credit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
				</ec:column>
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="pre_pv" title="bdPv.pvType01">
					<fmt:formatNumber pattern="###,##0.00">${bdAwardsLogVar.web_sale_pv }</fmt:formatNumber>
				</ec:column>
				<ec:column property="pre_pv" title="bd.person.perf.amt">
					<fmt:formatNumber pattern="###,##0.00">${bdAwardsLogVar.pre_pv }</fmt:formatNumber>
				</ec:column>
				<ec:column property="pre_pv" title="bd.group.perf.pv">
					<fmt:formatNumber pattern="###,##0.00">${bdAwardsLogVar.keep_pv }</fmt:formatNumber>
				</ec:column>
				<ec:column property="group_pv" title="bd.group.pv.amt">
					<fmt:formatNumber pattern="###,##0.00">${bdAwardsLogVar.group_pv }</fmt:formatNumber>
				</ec:column>
				<ec:column property="New_num" title="mi.starType">
					<win:code listCode="stars_level" value="${bdAwardsLogVar.new_num }"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
	
	$("a[name='return']",".functionBar").button({
        icons: {
            primary: "ui-icon-return"
        }
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>