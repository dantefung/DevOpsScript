<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看收益发放计划"/></title>
    <meta name="heading" content="<fmt:message key="查看收益发放计划"/>"/>
</head>

<script language="javascript" src="${ctx }/scripts/validate.js"></script>

<div class="contentBody">
	<form:form commandName="fiBonusSend" method="post" action="viewFiBonusSend.jhtml" onsubmit="return validateFiBonusSend(this)" id="fiBonusSendForm"  name="fiBonusSendForm">
		<input type="hidden" name="strAction" 	value="${param.strAction}"/>
		<input type="hidden" name="operNo" 		value="${fiBonusSend.operNo}"/>
		<input type="hidden" name="bonusType" 		value="${bonusType}"/>
		
		<spring:bind path="fiBonusSend.*">
		    <c:if test="${not empty status.errorMessages}">
		    <div class="error">    
		        <c:forEach var="error" items="${status.errorMessages}">
		            <img src="<c:url value="/images/iconWarning.gif"/>"
		                alt="<fmt:message key="icon.warning"/>" class="icon" />
		            <c:out value="${error}" escapeXml="false"/><br />
		        </c:forEach>
		    </div>
		    </c:if>
		</spring:bind>
		
		<table border="0" class="detail">
			<tr>
				<td width="50%" valign="top">
					<table class='detail' width="100%">
						<tr>
							<th><fmt:message  key="发放计划"/></th>
						    <td>${fiBonusSend.operNo}</td>
						</tr>
						<tr>
							<th><fmt:message  key="创建人"/></th>
						    <td>${fiBonusSend.operCode} - ${fiBonusSend.operName}</td>
						</tr>
						<tr>
							<th><fmt:message  key="创建时间"/></th>
						    <td>${fiBonusSend.operDate}</td>
						</tr>
						<tr>
							<th><fmt:message  key="bdSendRecord.remittanceMoneyScope"/></th>
						    <td>${fiBonusSend.amountLow} - ${fiBonusSend.amountUp}</td>
						</tr>
						<tr>
							<th><fmt:message  key="状态"/></th>
						    <td><win:code listCode="bonus_send_status" value="${fiBonusSend.status}"/></td>
						</tr>
						
						<tr>
							<th>
						        &nbsp;
						    </th>
						    <td>
							    <win:power powerCode="exportFiBonusSend">
							    	<button type="button" class="button" name="export"  onclick="exportFiBonusSend(this.form);">导出所有清单</button>
								</win:power>
								<button type="button" name="cancel" onclick="window.location='fiBonusSends.jhtml?strAction=listFiBonusSends&needReload=1'"><fmt:message key="operation.button.return"/></button>
						    </td>
					    </tr>
					
					</table>
				</td>
				<td valign="top">
					<table class='detail' width="100%">
						<tr><td class="title">
					        <fmt:message key="log.exported"/>
					    </td>
					    </tr>
					    
					    <c:forEach items="${fiBonusExportLogs}" var="fiBonusExportLogVar">
					    	<tr>
							    <td>
									${fiBonusExportLogVar.operatorCode }（${fiBonusExportLogVar.operatorName }） - ${fiBonusExportLogVar.operateTime }
							    </td>
						    </tr>
					    </c:forEach>
					    
					</table>
					
				</td>
			</tr>
		</table>
	
	</form:form>
	<br/>
	<c:if test="${not empty fiBonusSend.operNo}">
	
		<b>计划所含收益领取申请:</b><br/>
	
		<c:set var="footTotalVar">
		<tr>
			<td align="right" class="footer" colspan="5"><b><fmt:message key="report.allTotal"/>:</b></td>
			<td align="right" class="footer">
				<b><c:if test="${not empty totalAmount.total_amount}"><fmt:formatNumber pattern="###,##0.00" value="${totalAmount.total_amount}"/></c:if>
				<c:if test="${empty totalAmount.total_amount}">0.00</c:if></b>
			</td>
			<td align="right" class="footer">
				<b><c:if test="${not empty totalAmount.total_fees}"><fmt:formatNumber pattern="###,##0.00" value="${totalAmount.total_fees}"/></c:if>
				<c:if test="${empty totalAmount.total_fees}">0.00</c:if></b>
			</td>
			<td align="right" class="footer">
				<b><c:if test="${not empty totalAmount.total_send_amt}"><fmt:formatNumber pattern="###,##0.00" value="${totalAmount.total_send_amt}"/></c:if>
				<c:if test="${empty totalAmount.total_send_amt}">0.00</c:if></b>
			</td>
			<td colspan="3" class="footer">&nbsp;</td>
		</tr>
		</c:set>
		<ec:table 
			tableId="fiBonusApplListTable"
			items="fiBonusApplList"
			var="fiBonusAppl"
			action="viewFiBonusSend.jhtml"
			width="100%"
			retrieveRowsCallback="limit"
			autoIncludeParameters="true"
			rowsDisplayed="20" sortable="false" footer="${footTotalVar}">
			<ec:row>
	  			<ec:column property="user_code" title="用户编号" />
	  			<ec:column property="b_name" 	title="miMember.bname" />
	  			<ec:column property="open_bank" title="miMember.openBank" />
	  			<ec:column property="b_branch" 	title="开户行支行" />
	  			<ec:column property="b_num" 	title="miMember.bnum" escapeAutoFormat="true"/>
	    		<ec:column property="amount" 	title="申请金额" 	styleClass="numberColumn"/>
	  			<ec:column property="fees" 		title="手续费" 	styleClass="numberColumn"/>
	  			<ec:column property="send_amt" 	title="实发金额" 	styleClass="numberColumn"/>
	  			<ec:column property="create_time" 	title="申请时间" />
	    		<ec:column property="status" 	title="申请状态" >
	    			<win:code listCode="fibonusappl.status" value="${fiBonusAppl.status}"/>
	    		</ec:column>
	  			<ec:column property="false_reason" title="失败原因" />
	  			
			</ec:row>
		
		</ec:table>	
	
	</c:if>

</div>

<script type="text/javascript">
$(function() {
	$("button[name='export']").button({
        icons: {
            primary: "ui-icon-report"
        }
    });
});
function exportFiBonusSend(theForm){
	theForm.strAction.value="exportFiBonusSend";
	theForm.submit();
}
</script>