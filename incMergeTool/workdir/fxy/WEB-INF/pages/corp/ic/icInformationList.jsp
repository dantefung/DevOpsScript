<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
request.setAttribute("vEnter", "\n");
%>
 
<head>
<c:if test="${param.strAction=='editIcInformation' }">
			<title><fmt:message key="icInformation.reply"/></title>
    		<meta name="heading" content="<fmt:message key="icInformation.reply"/>"/>
</c:if>
<c:if test="${param.strAction=='managerIcInformation' }">
			<title><fmt:message key="icInformationList.newtitle"/></title>
    		<meta name="heading" content="<fmt:message key="icInformationList.newtitle"/>"/>
</c:if>
<c:if test="${param.strAction=='controlIcInformation' }">
			<title><fmt:message key="ic.controlIcInformation"/></title>
    		<meta name="heading" content="<fmt:message key="ic.controlIcInformation"/>"/>
</c:if>
   
</head>

<div class="searchBar">
	<form method="get" action="icInformations.jhtml?strAction=search" onsubmit="return validateSearch(this)">
	     <c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="bdReconsumMoneyReport.company"/></dt>
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
		
		<c:if test="${param.strAction=='managerIcInformation' || param.strAction=='editIcInformation' || param.strAction=='controlIcInformation' }">
				<dl>
					<dt><fmt:message key="icInformation.title"/></dt>
					<dd><input type="text" id="title" name ="title" value="${param.title }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="fi.status"/></dt>
					<dd><win:list name="status" listCode="infor.status" defaultValue="" value="${param.status }" showBlankLine="true"/> </dd>
				</dl>
				<dl>
				<dt><fmt:message key="pmEfuboCard.infor_type"/></dt>
				<dd><win:list listCode="infor.infortype" name="inforType"	id="inforType" showBlankLine="true" value="${param.inforType}" defaultValue="" /></dd>
				</dl>
				<dl>
					<dt><fmt:message key="miMember.memberNo"/></dt>
					<dd><input type="text" id="userCode" name ="userCode" value="${param.userCode }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="poOrder.memberName"/></dt>
					<dd><input type="text" id="userName" name ="userName" value="${param.userName }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="amSiteMessage.senderName"/></dt>
					<dd><input type="text" id="createUser" name ="createUser" value="${param.createUser }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="icInformation.replyUser"/></dt>
					<dd><input type="text" id="replyUser" name ="replyUser" value="${param.replyUser }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="icInformation.content"/></dt>
					<dd><input type="text" id="content" name ="content" value="${param.content }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="amMessage.replyContent"/></dt>
					<dd><input type="text" id="recontent" name ="recontent" value="${param.recontent }"/></dd>
				</dl>
				<dl>
					<dd><fmt:message key="ic.sendTime.startToEnd"/></dd>
					<dd>
						<input type="text" id ='sendStartTime' name ="sendStartTime" value ="${param.sendStartTime}" size="12"/>
						-
						<input type="text" id ='sendEndTime' name ="sendEndTime" value ="${param.sendEndTime}" size="12"/>
					</dd>
				</dl>
				<dl>
					<dd><fmt:message key="ic.replyTime.startToEnd"/></dd>
					<dd>
						<input type="text" id ='replyStartTime' name ="replyStartTime" value ="${param.replyStartTime}" size="12"/>
						-
						<input type="text" id ='replyEndTime' name ="replyEndTime" value ="${param.replyEndTime}" size="12"/>
					</dd>
				</dl>
		</c:if>
		<%-- <c:if test="${param.strAction=='editIcInformation' }">
		        <dl>
					<dt><fmt:message key="miMember.memberNo"/></dt>
					<dd><input type="text" id="userCode" name ="userCode" value="${param.userCode }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="poOrder.memberName"/></dt>
					<dd><input type="text" id="userName" name ="userName" value="${param.userName }"/></dd>
				</dl>
                <dl>
					<dt><fmt:message key="icInformation.replyUser"/></dt>
					<dd><input type="text" id="replyUser" name ="replyUser" value="${param.replyUser }"/></dd>
				</dl>
                <dl>
				    <dt><fmt:message key="pmEfuboCard.infor_type"/></dt>
				    <dd><win:list listCode="infor.infortype" name="inforType"	id="inforType" showBlankLine="false" value="${param.inforType}" defaultValue="" ></win:list></dd>
				</dl>
				<dl>
					<dt><fmt:message key="fi.status"/></dt>
					<dd><win:list name="status" listCode="infor.status" defaultValue="1" value="${param.status }"></win:list> </dd>
				</dl>
				<dl>
					<dd><fmt:message key="ic.sendTime.startToEnd"/></dd>
					<dd>
						<input type="text" id ='sendStartTime' name ="sendStartTime" value ="${param.sendStartTime}" size="12"/>
						-
						<input type="text" id ='sendEndTime' name ="sendEndTime" value ="${param.sendEndTime}" size="12"/>
					</dd>
				</dl>
				<dl>
					<dd><fmt:message key="ic.replyTime.startToEnd"/></dd>
					<dd>
						<input type="text" id ='replyStartTime' name ="replyStartTime" value ="${param.replyStartTime}" size="12"/>
						-
						<input type="text" id ='replyEndTime' name ="replyEndTime" value ="${param.replyEndTime}" size="12"/>
					</dd>
				</dl>
		</c:if>
		<c:if test="${param.strAction=='controlIcInformation' }">
			 
				<dl>
					<dt><fmt:message key="miMember.memberNo"/></dt>
					<dd><input type="text" id="userCode" name ="userCode" value="${param.userCode }"/></dd>
				</dl>
				
				<dl>
					<dt><fmt:message key="poOrder.memberName"/></dt>
					<dd><input type="text" id="userName" name ="userName" value="${param.userName }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="fi.status"/></dt>
					<dd><win:list name="status" listCode="infor.status" defaultValue="" value="${param.status }"></win:list> </dd>
				</dl>
				<dl>
				<dt><fmt:message key="pmEfuboCard.infor_type"/></dt>
				<dd><win:list listCode="infor.infortype" name="inforType"	id="inforType" showBlankLine="false" value="${param.inforType}" defaultValue="" ></win:list></dd>
				</dl>
				<dl>
					<dt><fmt:message key="amSiteMessage.senderName"/></dt>
					<dd><input type="text" id="createUser" name ="createUser" value="${param.createUser }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="icInformation.replyUser"/></dt>
					<dd><input type="text" id="replyUser" name ="replyUser" value="${param.replyUser }"/></dd>
				</dl>
				<dl>
					<dt><fmt:message key="icInformation.content"/></dt>
					<dd><input type="text" id="content" name ="content" value="${param.content }"/></dd>
				</dl>
				<dl>
					<dd><fmt:message key="ic.sendTime.startToEnd"/></dd>
					<dd><input type="text" id ='sendStartTime' name ="sendStartTime" value ="${param.sendStartTime}" size="12"/>-<input type="text" id ='sendEndTime' name ="sendEndTime" value ="${param.sendEndTime}" size="12"/></dd>
				</dl>
				<dl>
					<dd><fmt:message key="ic.replyTime.startToEnd"/></dd>
					<dd><input type="text" id ='replyStartTime' name ="replyStartTime" value ="${param.replyStartTime}" size="12"/>-<input type="text" id ='replyEndTime' name ="replyEndTime" value ="${param.replyEndTime}" size="12"/></dd>
				</dl>
		</c:if> --%>
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
	<form name="icInformationFunctionForm" id="icInformationFunctionForm" action="editIcInformation.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<c:if test="${param.strAction =='controlIcInformation'}">
		<div class="functionBar">
				<a href="javascript:multiCheckIcInformation()" name="check">
					<fmt:message key="operation.button.Check"/>
				</a>
				<a href="javascript:multiAppointIcInformation()" name="add">
					<fmt:message key="operation.button.appoint"/>
				</a>
				<a href="javascript:multiDeleteIcInformation()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
		</div>
		</c:if>
		<input type="hidden" name="selectedUniNos">
		<input type="hidden" name="selectedUniNo2s">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icInformationListTableForm" method="get" >
		<ec:table 
			tableId="icInformationListTable"
			items="icInformations"
			var="icInformation"
			action="icInformations.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icInformationListTableForm">
			<ec:row>
			<!-- 复选框 ：批量审核 -->
			<c:if test="${param.strAction =='controlIcInformation'}">
				<ec:column alias="chkUniNo" headerCell="selectAll" style="width:5px;" > 
				  <!-- sendRoute : 0 公司 1报单中心会员  -->
				  <c:choose>
				     <c:when test="${icInformation.sendRoute =='1' }">
    				    <!-- 当是报单中心会员时，只有是回复状态的时候，才有复选框 -->
						<c:if test="${icInformation.status<3&&icInformation.status>=2 }">
						<input type="checkbox" name="chkUniNo" value="${icInformation.uniNo}" class="checkbox"/>
						</c:if>
					</c:when>
					<c:when test="${icInformation.sendRoute =='0' }">
					    <!-- 当是公司时，只要是0-新增  1-已管控  2-已回复状态的时候，有复选框 -->
						<c:if test="${icInformation.status<3&&icInformation.status>=0 }">
						<input type="checkbox" name="chkUniNo" value="${icInformation.uniNo}" class="checkbox"/>
						</c:if>
					</c:when>
				  </c:choose>
		  	    </ec:column>
		  	</c:if>
		  	
		  	<!-- 复选框 ：批量指派 -->
		  	<c:if test="${param.strAction =='controlIcInformation'}">
		  	   <ec:column alias="chkUniNo2" headerCell="selectAll" style="width:5px;">  
                  <c:if test="${icInformation.status<2}">
                     <c:if test="${icInformation.createUser != sessionScope.sessionLoginUser.userCode}">
                       <c:if test="${icInformation.sendRoute =='1'}">
				         <input type="checkbox" name="chkUniNo2" value="${icInformation.uniNo}" class="checkbox"/>
				       </c:if>
                     </c:if>
                  </c:if>
		  	   </ec:column>
		  	</c:if>
		  	<!-- 图标  -->
			<ec:column property="aa" sortable="false" title=" " style="width:2%">
    				<c:if test="${icInformation.status>=2}">
    					<img  src="${ctx}/themes/${theme }/images/icons/pm_replied.gif" border="0" align="absmiddle"/>
    				</c:if>
    				<c:if test="${icInformation.status<2}">
    					<img  src="${ctx}/themes/${theme }/images/icons/pm_notread.gif" border="0" align="absmiddle"/>
    				</c:if>
    		</ec:column>
    			
    			<!-- table上面的那一行  -->
    			<ec:column property="replyTime" title="icInformation.content" style="valign:center;">
    				<img src="${ctx}/themes/${theme }/images/icons/tree_star.gif" border="0" align="absmiddle">
    				<win:code listCode="infor.infortype" value="${icInformation.inforType}"/>&nbsp;&nbsp;
    				<fmt:message  key="icInformation.title"/>:
    					<font color='blue'>${icInformation.title}</font>
    					
    				<!-- 不是信息系统模块的时候就有  -->	
    				<c:if test="${param.strAction!='managerIcInformation' }">
    				  <!-- 当创建人跟系统登录人是同一个人的时候，而且信息状态在0-新增  1-已管控  2-已回复(也就是没有审核回复之前) -->
    				  <c:if test="${(icInformation.createUser == sessionScope.sessionLoginUser.userCode) && (icInformation.status <3 ) }">
	 					<a href="editIcInformation.jhtml?strAction=editIcInformation&uniNo=${icInformation.uniNo}"  >
	 					   <img src="${ctx}/themes/${theme }/images/icons/editIcon.gif" border="0" align="absmiddle"  style="cursor:pointer"
	 					   title="<fmt:message  key="icInformation.editItem"/>" alt="<fmt:message  key="icInformation.editItem"/>"/>
	 					</a>
	 					
	 					<a href="editIcInformation.jhtml?strAction=delIcInformation&uniNo=${icInformation.uniNo}"  >
	 					   <img src="${ctx}/themes/${theme }/images/icons/deleteIcon.gif" border="0" align="absmiddle" style="cursor:pointer"
	 						title="<fmt:message  key="icInformation.delItem"/>" alt="<fmt:message  key="icInformation.delItem"/>"/>
	 					</a>
	 				  </c:if>	
	 				</c:if>
    				<br/>
    				
    				<!-- table  -->
    				<table width='100%' cellpadding='6' cellspacing='6' border='0'>
						<tr>
						    <!-- 左边一列 -->
							<td valign='top' width='50%' bgcolor='#FFEEAA' style='border: 1px solid #BED5F0;'>
						 
						    <!-- 报单中心会员 -->
    				 		<c:if test="${icInformation.sendRoute==1 }"> 
    				 		 
								<font color='#888888'><fmt:message  key="pd.createUserNo"/>:</font>
	    						<font color='blue'>${icInformation.createUser}&nbsp;/&nbsp;${icInformation.createName}</font>&nbsp;&nbsp;
	    				 		<font color='blue'><fmt:formatDate value="${icInformation.createTime }" pattern="yyyy-MM-dd"/></font>
    				 		</c:if>
    				 		<!-- 公司  icInformation.userCode:接收人编号 -->
							<c:if test="${icInformation.sendRoute==0 }"> 
	   							<font color='#888888'><fmt:message  key="fiPayAdvice.userCode"/>:</font>
	    						<font color='blue'>${icInformation.userCode}&nbsp;/&nbsp;${icInformation.userName}</font>&nbsp;&nbsp;
	    				 		<font color='blue'><fmt:formatDate value="${icInformation.createTime }" pattern="yyyy-MM-dd"/></font>
    				 		</c:if>
    				 		
    					<br/>
    				<br/>  
    				${fn:replace(icInformation.content, vEnter, '<br>')}
    						
					      </td>
    				        <td valign='top' width='100%' bgcolor='#FFFFCC' style='border: 1px solid #BED5F0;'>
    						  <!-- 满足 公司 与 未发送状态 -->
    					      <c:if test="${(icInformation.sendRoute =='0') && (icInformation.status ==-1)}">
	    					    <input type="button" class="form_button" onclick="editIcInformation('${icInformation.uniNo}','editSendIcInformation');" value="<fmt:message  key='icInformation.edit'/>"/><br/>
	    				      </c:if>
	    				      
	    			<!-- 右边一列 -->	
    				 <c:choose>
    				 	<c:when test="${icInformation.sendRoute =='1' }">
    				 		<!-- 报单中心发送会员   已回复状态-->
    				 		<c:if test="${ not empty icInformation.replyUser|| icInformation.status ==2 }"> 
    				 			<font color='#888888'><fmt:message  key="ic.replyUser"/>:</font>
	    						<font color='blue'>${ icInformation.replyUser }</font>&nbsp;&nbsp;
	    						<font color='#888888'><fmt:message  key="ic.sendName"/>:</font>
	    						<font color='blue'>${ icInformation.replyName }</font>&nbsp;&nbsp;
	    						<font color='blue'>${ icInformation.replyTime }</font>&nbsp;&nbsp;
	    						
	    						<c:if test="${icInformation.status ==2}">
	    						<a href="editIcInformation.jhtml?strAction=replyIcInformation&uniNo=${icInformation.uniNo}"  >
	 					          <img src="${ctx}/themes/${theme }/images/icons/editIcon.gif" border="0" align="absmiddle"  style="cursor:pointer"
	 					          title="<fmt:message  key="icInformation.editItem"/>" alt="<fmt:message  key="icInformation.editItem"/>"/>
	 					        </a>
	 					       </c:if>
	    				 	</c:if>
	    				 	
	 						<!-- 报单中心发送会员   0-新增  1-已管控   指派   只有在已管控模块有-->
	 						<c:if test="${icInformation.status<=1 }">
	 						  <c:if test="${param.strAction == 'controlIcInformation' }">
    				 			<a href="editIcInformation.jhtml?strAction=controlIcInformation&uniNo=${icInformation.uniNo}"  >
    				 			   <img  src="${ctx}/themes/${theme }/images/icons/replymsg.gif" border="0" align="absmiddle" style="cursor:pointer"
    								title="<fmt:message  key='icInformation.control'/>" alt="<fmt:message  key='icInformation.control'/>" />
    						    </a>		
    				 		  </c:if>
	 						</c:if>
    				 		
    				 		<!-- 报单中心发送会员   0-新增  1-已管控   回复-->
    				 		<c:if test="${icInformation.status<=1 }">
    				 			<c:if test="${param.strAction!='managerIcInformation' }">
    				 			  <a href="editIcInformation.jhtml?strAction=replyIcInformation&uniNo=${icInformation.uniNo}"  >
	    				 			<img  src="${ctx}/themes/${theme }/images/icons/edit.gif" border="0" align="absmiddle" style="cursor:pointer"
	    								title="<fmt:message  key='icInformation.reply'/>" alt="<fmt:message  key='icInformation.reply'/>"/></a>
	    				 		  <br/>
	    				 		</c:if>
    				 		</c:if>
    				 		 
    				 		 <br>${fn:replace(icInformation.replyContent, vEnter, '<br>')}
    				 	</c:when>
    				 	
    				 	<c:when test="${icInformation.sendRoute =='0' }">
    				 	 	<!-- 公司发送 -->	 					
	 							<font color='#888888'><fmt:message  key="stStockAdjust.creatorCode"/>:</font>
    				 		 	${icInformation.createUser}&nbsp;&nbsp;&nbsp;
    				 		 	<font color='#888888'><fmt:message  key="pd.createUserNo"/>:</font>	
    				 			${icInformation.createName}
    							<br/>
    							
	 					    <!-- 已管控状态    amEmail.sender：发送人账号    amSiteMessage.senderName：发送人-->
	 						<c:if test="${icInformation.status ==1 }"> 
								<font color='#888888'><fmt:message  key="amEmail.sender"/>:</font>
	    						<font color='blue'>${ icInformation.replyUser }1</font>&nbsp;&nbsp;
	    						<font color='#888888'><fmt:message  key="amSiteMessage.senderName"/>:</font>
	    						<font color='blue'>${ icInformation.replyName }1</font>&nbsp;&nbsp;
	    						<font color='blue'>${ icInformation.replyTime }</font>&nbsp;&nbsp;
	    				 	</c:if>
    				 	 	 <br>${fn:replace(icInformation.replyContent, vEnter, '<br>')}
    				 	</c:when>
    				 </c:choose>
					</td>
    				</tr>
    				
    				</table>
    			</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcInformation(){
	 
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkUniNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icInformationFunctionForm;
	theForm.selectedUniNos.value=selectedValues;
	theForm.strAction.value="multiDeleteIcInformation";
	
	showLoading();
	theForm.submit();
}

function multiCheckIcInformation(){
	 
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkUniNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.check.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.check'/>.")){
		return;
	}
	var theForm=document.icInformationFunctionForm;
	theForm.selectedUniNos.value=selectedValues;
	theForm.strAction.value="multiCheckIcInformation";
	
	showLoading();
	theForm.submit();
}

function multiAppointIcInformation(){
	 
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkUniNo2"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.appoint.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.appoint'/>.")){
		return;
	}
	var theForm=document.icInformationFunctionForm;
	theForm.selectedUniNo2s.value=selectedValues;
	theForm.strAction.value="multiAppointIcInformation";
	
	showLoading();
	theForm.submit();
}
 

$(function() {
	$( "#sendStartTime,#sendEndTime,#replyStartTime,#replyEndTime" ).datepicker();
});
</script>