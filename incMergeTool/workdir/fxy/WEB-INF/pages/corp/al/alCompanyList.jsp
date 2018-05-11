<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alCompanyList.title"/></title>
    <meta name="heading" content="<fmt:message key="alCompanyList.title"/>"/>
</head>

<div class="contentBody">
	<form name="alRegionFunctionForm" id="alRegionFunctionForm" action="editAlCompany.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlCompany">
				<a href="<c:url value="/corp/editAlCompany.jhtml"/>?strAction=addAlCompany" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			
		</div>
		<input type="hidden" name="selectedRegionIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form action="alCompanys.jhtml?typeId=${typeId }" method="get" name="alCompanyForm" id="alCompanyForm">
		<ec:table tableId="alCompanyListTable"
			items="alCompanyList" autoIncludeParameters="true"
			var="alVar"
			retrieveRowsCallback="limit"
			action="/corp/alCompanys.jhtml"
			width="100%"
			rowsDisplayed="20" form="alCompanyForm"
			imagePath="${ctx }/themes/default/images/extremetable/*.gif" 
			>
			
			<ec:exportCsv fileName="company.csv"/>
			<ec:exportXls fileName="company.xls"/>
			
			<ec:row>
				<ec:column property="1" title="title.operation" sortable="false" style="white-space: nowrap;width:5px;">
					<nobr>
					<win:power powerCode="editAlCompany">
						<a href="editAlCompany.jhtml?strAction=editAlCompany&companyId=${alVar.companyId}">
						<img src="${ctx }/themes/default/images/icons/editIcon.gif" border="0" width="16" height="16"/></a>
					</win:power>
					<%-- <win:power powerCode="editAlCompanyArea">
						<a href="editAlCompanyArea.jhtml?strAction=editAlCompanyArea&companyId=${alVar.companyId}">
						<img src="${ctx }/themes/default/images/icons/language.gif" border="0" width="16" height="16"/></a>
					</win:power> --%>
					</nobr>
				</ec:column>
				<ec:column property="companyCode" title="alCompany.companyCode" />
				<ec:column property="companyName" title="alCompany.companyName"/>
				<ec:column property="regName" title="alCompany.regName"/>
				<ec:column property="characterCode" title="alCompany.characterCode"/>
				<ec:column property="currencyCode" title="alCompany.currencyCode"/>
				<ec:column property="taxRate" title="alCompany.taxRate"/>
				
			</ec:row>
		</ec:table>
	
	</form>
</div>