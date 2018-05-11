<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmPersonLimitAdjustList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmPersonLimitAdjustList.title"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="searchBar">
	<form method="get" action="pmPersonLimitAdjusts.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pmLimitAdjust.adjustCode"/></dt>
			<dd><input type="text" name="adjustCode" value="${param.adjustCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.product.productno"/></dt>
			<dd><input type="text" name="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.createTime"/></dt>
			<dd>
				<input type="text" name="startCreateDate" id="startCreateDate" value="${param.startCreateDate }" size="10"/>
				 - <input type="text" name="endCreateDate" id="endCreateDate" value="${param.endCreateDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="icAnnounce.checkTime"/></dt>
			<dd>
				<input type="text" name="startCheckDate" id="startCheckDate" value="${param.startCheckDate }" size="10"/>
				 - <input type="text" name="endCheckDate" id="endCheckDate" value="${param.endCheckDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd>
				<win:list name="status" listCode="pm_person_limit_adjust_status" defaultValue="" value="${param.status}" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listPmPersonLimitAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmPersonLimitAdjustFunctionForm" id="pmPersonLimitAdjustFunctionForm" action="editPmPersonLimitAdjust.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmPersonLimitAdjust">
				<a href="editPmPersonLimitAdjust.jhtml?strAction=addPmPersonLimitAdjust" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePmPersonLimitAdjust">
				<a href="javascript:multiDeletePmPersonLimitAdjust()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmPersonLimitAdjustListTableForm" method="get" >
		<ec:table 
			tableId="pmPersonLimitAdjustListTable"
			items="pmPersonLimitAdjusts"
			var="pmPersonLimitAdjustVar"
			action="pmPersonLimitAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmPersonLimitAdjustListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<!--
					   <c:if test="${pmPersonLimitAdjustVar.status==1}">
						<win:power powerCode="editPmPersonLimitAdjust">
							<a href="editPmPersonLimitAdjust.jhtml?strAction=editPmPersonLimitAdjust&adjustCode=${pmPersonLimitAdjustVar.adjust_code}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
					   </c:if>
					-->
					<c:if test="${pmPersonLimitAdjustVar.status==1}">
						<win:power powerCode="cancelPmPersonLimitAdjust">
							<a href="javascript:cancelPmPersonLimitAdjust('${pmPersonLimitAdjustVar.adjust_code}');" name="exit"><fmt:message key="efubo.card.zf"/></a>
						</win:power>
					</c:if>							
					<win:power powerCode="viewPmPersonLimitAdjust">
						<a href="viewPmPersonLimitAdjust.jhtml?strAction=viewPmPersonLimitAdjust&adjustCode=${pmPersonLimitAdjustVar.adjust_code}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="adjust_code" title="pmLimitAdjust.adjustCode" />	
				<ec:column property="product_code" title="busi.product.productno" />
				<ec:column property="product_name" title="pmProduct.productName" />
				<ec:column property="adjust_qty" title="busi.add.qty" styleClass="numberColumn">
					<c:if test="${pmPersonLimitAdjustVar.adjust_qty>0}">${pmPersonLimitAdjustVar.adjust_qty}</c:if>
					<c:if test="${pmPersonLimitAdjustVar.adjust_qty<=0}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="adjustQty" title="busi.dec.qty" styleClass="numberColumn">
					<c:if test="${pmPersonLimitAdjustVar.adjust_qty<0}">${-pmPersonLimitAdjustVar.adjust_qty}</c:if>
					<c:if test="${pmPersonLimitAdjustVar.adjust_qty>=0}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="before_qty" title="busi.qty.before.adjust" styleClass="numberColumn"/>
				<ec:column property="after_qty" title="busi.qty.after.adjust" styleClass="numberColumn"/>
				<ec:column property="status" title="fi.status">
					<win:code listCode="pm_person_limit_adjust_status" value="${pmPersonLimitAdjustVar.status}"/>
				</ec:column>
				<ec:column property="create_time" title="pd.createTime" />
				<ec:column property="creator_code" title="pmProductSppm.createUser" />
				<ec:column property="check_time" title="icAnnounce.checkTime" />
				<ec:column property="checker_code" title="pmProductSppm.checkUser" />
			</ec:row>
		</ec:table>
	</form>
	<form action="editPmPersonLimitAdjust.jhtml" method="post" name="cancleForm" id="cancleForm">
		<input type="hidden" name="strAction" value="cancelPmPersonLimitAdjust"/>
		<input type="hidden" name="adjustCode"/>
	</form>
</div>
	
<script type="text/javascript">
function cancelPmPersonLimitAdjust(adjustCode){
	  if(confirm("<fmt:message key='button.confirm.invalid'/>?")){
		 document.cancleForm.adjustCode.value = adjustCode;
		 document.cancleForm.submit();
     }
}

$(function() {
	$( "#startCreateDate,#endCreateDate,#startCheckDate,#endCheckDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

$(document).ready(function(){
	$("a[name='view']").colorbox({iframe:true, width:"80%", height:"80%",title:true});

});

function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>