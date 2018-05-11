<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<title><fmt:message key="fiBonusApplList.title"/></title>
<content tag="heading"><fmt:message key="fiBonusApplList.heading"/></content>
<meta name="menu" content="FiBonusApplMenu"/>

<form action="fiBonusApplsForSend.jhtml" method="get" name="fiBonusApplsForSendSearchForm" id="fiBonusApplsForSendSearchForm">
	<input type="hidden" name="operNo" value="${operNo}"/>
	<div class="searchBar">
		<dl>
			<dt>用户编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}" size="10"/></dd>
		</dl>
		<dl>
			<dt>申请人编号</dt>
			<dd><input name="createrCode" type="text" value="${param.createrCode}" size="12"/></dd>
		</dl>
		<dl>
			<dt>申请时间</dt>
			<dd>
				<input name="startCreateTime" id="startCreateTime" type="text" value="${param.startCreateTime}" size="12"/>
				 - 
				<input name="endCreateTime" id="endCreateTime" type="text" value="${param.endCreateTime}" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt>审核人编号</dt>
			<dd><input name="checkerCode" type="text" value="${param.checkerCode}" size="8"/></dd>
		</dl>
		<dl>
			<dt>审核时间</dt>
			<dd>
				<input name="startCheckTime" id="startCheckTime" type="text" value="${param.startCheckTime }" size="12"/>
				 - 
				 <input name="endCheckTime" id="endCheckTime" type="text" value="${param.endCheckTime }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button name="search" class="button" type="submit"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listFiBonusApplsForSend"/>
			</dd>
		</dl>
	</div>
</form>

<div class="contentBody">
	<div class="functionBar">
		<form action="fiBonusApplsForSend.jhtml" method="post" name="fiBonusApplsForSendTitleForm" id="fiBonusApplsForSendTitleForm">
		    <input type="hidden" id="strAction" 	name="strAction" 	value=""/>
		    <input type="hidden" 					name="operNo" 		value="${operNo}"/>
		    <input type="hidden" id="strApplNos" 	name="strApplNos" 	value=""/>

			<c:if test="${fiBonusSend.status==0}">
				<win:power powerCode="addFiBonusApplsForSendSrc">
					<a href="fiBonusApplsForSend.jhtml?strAction=addFiBonusApplsForSendSrc&operNo=${operNo}" name="add">
						新增
					</a>
				</win:power>
				<span class="divider">&nbsp;</span>
				<win:power powerCode="removeFiBonusApplsForSend">
					<a href="#" onclick="removeFiBonusApplsForSend(document.fiBonusApplsForSendTitleForm);" name="multiDelete">
						<fmt:message  key="删除"/>
					</a>
				</win:power>
			</c:if>
			<c:if test="${fiBonusSend.status==1}">
				<win:power powerCode="grantFiBonusApplsForSend">
					<a href="#" onclick="grantFiBonusApplsForSend(document.fiBonusApplsForSendTitleForm);" name="check">
						发放成功
					</a>
				</win:power>
				<span class="divider">&nbsp;</span>
				<win:power powerCode="grantFalseFiBonusApplsForSend">
					<a href="#" onclick="grantFalseFiBonusApplsForSend(document.fiBonusApplsForSendTitleForm);" name="uncheck">
						发放失败
					</a>
					(失败原因:<input type="text" id="falseReason" 	name="falseReason" value="" size="40" maxlength=""/>)
				</win:power>
			</c:if>
		</form>
	</div>
	
	<c:set var="footTotalVar">
	<tr>
		<td align="right" class="footer" colspan="6"></td>
		<td align="right" class="footer"><b>合计:</b></td>
		<td align="right" class="footer"><b>
			<c:if test="${not empty totalAmount.total_amount}">
				<fmt:formatNumber pattern="###,##0.00">${totalAmount.total_amount}</fmt:formatNumber>
			</c:if>
			<c:if test="${empty totalAmount.total_amount}">
				0.00
			</c:if></b>
		</td>
		<td align="right" class="footer"><b>
			<c:if test="${not empty totalAmount.total_fees}">
				<fmt:formatNumber pattern="###,##0.00">${totalAmount.total_fees}</fmt:formatNumber>
			</c:if>
			<c:if test="${empty totalAmount.total_fees}">
				0.00
			</c:if></b>
		</td>

		<td align="right" class="footer"><b>
			<c:if test="${not empty totalAmount.total_send_amt}">
				<fmt:formatNumber pattern="###,##0.00">${totalAmount.total_send_amt}</fmt:formatNumber>
			</c:if>
			<c:if test="${empty totalAmount.total_send_amt}">
				0.00
			</c:if></b>
		</td>
		<td align="right" class="footer"></td>
	</tr>
	</c:set>
	
	
	<ec:table 
		tableId="fiBonusApplListTable"
		items="fiBonusAppls"
		var="fiBonusAppl"
		action="fiBonusApplsForSend.jhtml"
		width="100%"
		retrieveRowsCallback="limit"
		autoIncludeParameters="true"
		rowsDisplayed="20" sortable="false" footer="${footTotalVar}">
				<ec:row>
					
					<ec:column alias="selectedNo" headerCell="selectAll" style="width:5px;">
						<c:if test="${fiBonusAppl.status==2}">
							<input type="checkbox" name="selectedNo" value="${fiBonusAppl.appl_no}"/>
						</c:if>
			  		</ec:column>
				
	    			<ec:column property="user_code" title="用户编号" />
	    			<ec:column property="b_name" 	title="miMember.bname" />
	    			<ec:column property="open_bank" title="miMember.openBank" />
	    			<ec:column property="b_branch" 	title="开户行支行" />
	    			<ec:column property="b_num" 	title="miMember.bnum" />
	    			<ec:column property="create_time" 	title="申请时间" />
	    			<ec:column property="amount" 	title="申请金额" styleClass="numberColumn"/>
	    			<ec:column property="fees" 		title="手续费" styleClass="numberColumn"/>
	    			<ec:column property="send_amt" 	title="实发金额" styleClass="numberColumn"/>
	    			<ec:column property="avail_balance" title="收益帐户余额 " styleClass="numberColumn"/>
				</ec:row>
	
	</ec:table>	
</div>

<script type="text/javascript">
$(function() {
	$( "#startCreateTime, #endCreateTime, #startCheckTime, #endCheckTime" ).datepicker();
});

function removeFiBonusApplsForSend(theForm){
	if(!confirm("确定从该计划中移除选定的收益领取申请？")){
		return false;
	}
	var elements=document.getElementsByName("selectedNo");
	if(elements==undefined){
		alert("请选择要从该计划中移除的收益领取申请");
		return false;
	}
	var selectedOne=false;
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			selectedOne=true;
			theForm.strApplNos.value+=","+elements[i].value;
		}
	}
	if(!selectedOne){
		alert("请选择要从该计划中移除的收益领取申请");
		return false;
	}
	theForm.strAction.value="removeFiBonusApplsForSend";
	showLoading();
	theForm.submit();
	window.close();
}		

function grantFiBonusApplsForSend(theForm){
	if(!confirm("确定对应的收益领取申请发放成功？")){
		return false;
	}
	var elements=document.getElementsByName("selectedNo");
	if(elements==undefined){
		alert("请选择发放成功的申请");
		return false;
	}
	var selectedOne=false;
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			selectedOne=true;
			theForm.strApplNos.value+=","+elements[i].value;
		}
	}
	if(!selectedOne){
		alert("请选择发放成功的申请");
		return false;
	}
	theForm.strAction.value="grantFiBonusApplsForSend";
	showLoading();
	theForm.submit();
	window.close();
}		

function grantFalseFiBonusApplsForSend(theForm){
	if(!confirm("确定对应的收益领取申请发放失败？")){
		return false;
	}
	var elements=document.getElementsByName("selectedNo");
	if(elements==undefined){
		alert("请选择发放失败的申请");
		return false;
	}
	var selectedOne=false;
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			selectedOne=true;
			theForm.strApplNos.value+=","+elements[i].value;
		}
	}
	if(!selectedOne){
		alert("请选择发放失败的申请");
		return false;
	}
	theForm.strAction.value="grantFalseFiBonusApplsForSend";
	showLoading();
	theForm.submit();
	window.close();
}		
</script>