<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pm.listPmEcProductItems"/></title>
    <meta name="heading" content="<fmt:message key="menu.pm.listPmEcProductItems"/>"/>
</head>

<div class="contentBody">
	<form name="pmEcProductItemFunctionForm" id="pmEcProductItemFunctionForm" action="editPmEcProductItem.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmEcProductItem">
				<a href="editPmEcProductItem.jhtml?strAction=addPmEcProductItem&productId=${param.productId }" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<a href="pmProducts.jhtml?needReload=1" name="cancel">
                <fmt:message key="operation.button.cancel"/>
			</a>
		</div>
		<input type="hidden" name="selectedItemIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmEcProductItemListTableForm" method="get" >
		<ec:table 
			tableId="pmEcProductItemListTable"
			items="pmEcProductItems"
			var="pmEcProductItemVar"
			action="pmEcProductItems.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmEcProductItemListTableForm">
			<ec:row>
				<win:power powerCode="editPmEcProductItem">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" width="20">
						<a href="editPmEcProductItem.jhtml?strAction=editPmEcProductItem&itemId=${pmEcProductItemVar.item_id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="ec_product_no" title="商品编号" />
				<ec:column property="product_name" title="商品名称" />
				<ec:column property="ec_quantity" title="商品默认订购数量" styleClass="numberColumn"/>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

$(function() {
	$("a[name='cancel']",".functionBar").button({
        icons: {
            primary: "ui-icon-cancel"
        }
    });
});
</script>