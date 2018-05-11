<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="memberInfo.ExportReport"/></title>
    <meta name="heading" content="<fmt:message key="memberInfo.ExportReport"/>"/>
</head>



<form:form commandName="bdBonusSub" method="post" action="miMemberInfoExportReport.jhtml" onsubmit="return validateForm(this)" id="bdJiangjinJieSuanReportForm">
    

<div class="searchBar">
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="inMemberNo" id="inMemberNo" value="${param.inMemberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="poOrder.memberName"/></dt>
			<dd><input type="text" name="fullName" id="fullName" value="${param.fullName }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="icAnnounce.checkTime"/></dt>
			<dd><input type="text" name="startDate" id="startDate" value="${param.startDate }" size="10"/> - <input type="text" name="endDate" id="endDate" value="${param.endDate }" size="10"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<!--
				<button type="submit" name="search">
					<fmt:message key="button.report"/>
						</button>
				-->
						
				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.report"/></button>
			</dd>
		</dl>
	
</div>

<div class="contentBody">
    
    <spring:bind path="bdBonusSub.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <tr>
                <c:forEach var="error" items="${status.errorMessages}">
                    <td>${error}</td>
                </c:forEach>
            </tr>
        </div>
        </c:if>
    </spring:bind>
    
    <table class="detail">
    	<tr>
    		<td class="title"><fmt:message key="report.field"/></td>
    	</tr>
    	
    	<tr>
    		<td>
    			<table>
	    			<tr>
	    				<td>
	    					<input type="checkbox" value="memberNo" name="memberNo" id="memberNo" class="checkbox" checked="checked" />
	    					<fmt:message key="miMember.memberNo"/>
	    				</td>
						<td>
							<input type="checkbox" value="memberName" name="memberName" id="memberName" class="checkbox" checked="checked" />
							<fmt:message key="poOrder.memberName"/>
						</td>	
						<td>
							<input type="checkbox" value="recommendNo" name="recommendNo" id="recommendNo" class="checkbox" checked="checked" />
							<fmt:message key="mi.recommendNo"/>
						</td>
						<td>
							<input type="checkbox" value="recommendName" name="recommendName" id="recommendName" class="checkbox" checked="checked" />
							<fmt:message key="miMember.recommendName"/>
						</td>
						<td>
							<input type="checkbox" value="linkNo" name="linkNo" id="linkNo" class="checkbox" checked="checked" />
							<fmt:message key="mi.linkNo"/>
						</td>
						<td>
							<input type="checkbox" value="linkName" name="linkName" id="linkName" class="checkbox" checked="checked" />
							<fmt:message key="mi.linkName"/>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" value="cardType" name="cardType" id="cardType" class="checkbox" checked="checked" />
							<fmt:message key="miMember.cardType"/>
						</td>
						<td>
							<input type="checkbox" value="memberStatus" name="memberStatus" id="memberStatus" class="checkbox" checked="checked" />				
							<fmt:message key="mi.memberStatus"/>
						</td>
						<td>	
							<input type="checkbox" value="activitystatus" name="activitystatus" id="activitystatus" class="checkbox" checked="checked" />
							<fmt:message key="mi.activity.status"/>
						</td>
						<td>	
							<input type="checkbox" value="congelationstatus" name="congelationstatus" id="congelationstatus" class="checkbox" checked="checked" />
							<fmt:message key="mi.congelation.status"/>
						</td>
						<td>	
							<input type="checkbox" value="limitstatus" name="limitstatus" id="limitstatus" class="checkbox" checked="checked" />
							<fmt:message key="mi.lable.limit.status"/>
						</td>
						<td>	
							<input type="checkbox" value="conclestatus" name="conclestatus" id="conclestatus" class="checkbox" checked="checked" />
							<fmt:message key="mi.concle.status"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="creatorCode" name="creatorCode" id="creatorCode" class="checkbox" checked="checked" />
							<fmt:message key="poOrder.billFromPersonNo"/>
						</td>
						<td>
							<input type="checkbox" value="creatorName" name="creatorName" id="creatorName" class="checkbox" checked="checked" />
							<fmt:message key="poOrder.billFromPersonName"/>
						</td>
						<td>
							<input type="checkbox" value="activetime" name="activetime" id="activetime" class="checkbox" checked="checked" />
							<fmt:message key="mimember.activetime"/>
						</td>
						<td>
							<input type="checkbox" value="networkcount" name="networkcount" id="networkcount" class="checkbox" checked="checked" />
							<fmt:message key="recommend.network.count"/>
						</td>
						<%-- <td>
							<input type="checkbox" value="networknewcount" name="networknewcount" id="networknewcount" class="checkbox" checked="checked" />
							<fmt:message key="recommend.network.newcount"/>
						</td> --%>
						<td>
							<input type="checkbox" value="networkhandlecount" name="networkhandlecount" id="networkhandlecount" class="checkbox" checked="checked" />
							<fmt:message key="recommend.network.handlecount"/>
						</td>
						<td>
							<input type="checkbox" value="star" name="star" id="star" class="checkbox" checked="checked" />
							荣誉级别
						</td>
					</tr>
							
							
					<tr>
						<td>
							<input type="checkbox" value="sex" name="sex" id="sex" class="checkbox" checked="checked" />
							<fmt:message key="list.sex"/>
						</td>	
						<td>
							<input type="checkbox" value="certificateType" name="certificateType" id="certificateType" class="checkbox" checked="checked" />
							<fmt:message key="miMember.certificateType"/>
						</td>
						<td>				
							<input type="checkbox" value="cardNo" name="cardNo" id="cardNo" class="checkbox" checked="checked" />				
							<fmt:message key="mi.lable.cardNo"/>
						</td>
						<td>
							<input type="checkbox" value="birthday" name="birthday" id="birthday" class="checkbox" checked="checked" />
							<fmt:message key="gsMember.birthday"/>
						</td>
						<td>
							<input type="checkbox" value="mobilePhone" name="mobilePhone" id="mobilePhone" class="checkbox" checked="checked" />
							<fmt:message key="miMember.delivery.moblie"/>
						</td>
						<td>
							<input type="checkbox" value="email" name="email" id="email" class="checkbox" checked="checked" />
							<fmt:message key="ssCustomer.email"/>
						</td>
					</tr>
							
							
					<tr>
						<td>
							<input type="checkbox" value="country" name="country" id="country" class="checkbox" checked="checked" />
							<fmt:message key="label.country"/>
						</td>
						<td>
							<input type="checkbox" value="state" name="state" id="state" class="checkbox" checked="checked" />
							<fmt:message key="sys.state"/>
						</td>
						<td>
							<input type="checkbox" value="city" name="city" id="city" class="checkbox" checked="checked" />
							<fmt:message key="busi.city"/>
						</td>
						<td>
							<input type="checkbox" value="area" name="area" id="area" class="checkbox" checked="checked" />
							<fmt:message key="miMember.area"/>
						</td>
						<td>
							<input type="checkbox" value="addrees" name="addrees" id="addrees" class="checkbox" checked="checked" />
							<fmt:message key="mi.addrees.detail"/>
						</td>
						<td>
							<input type="checkbox" value="zipCode" name="zipCode" id="zipCode" class="checkbox" checked="checked" />
							<fmt:message key="alProvinceCity.zipCode"/>
						</td>
					</tr>
							
					<tr>
						
					</tr>
				</table>
    		</td>
    	</tr>    	
    	

    	
    	    	
   
    	<tr>
    		<td>
    			<div class="buttonBar">

    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				
    				<!--
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.report"/></button>
    				-->
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
	
	
function validateForm(theForm) {
	var inMemberNo = document.getElementById("inMemberNo");
	var fullName = document.getElementById("fullName");
	var startDate = document.getElementById("startDate");
	var endDate = document.getElementById("endDate");
	
	if (inMemberNo.value == "" && fullName.value == "" && startDate.value == "" && endDate.value == "") {
		alert("<fmt:message key='please.input.least.one.query.conditions'/>");
		inMemberNo.focus();
		return false;
	}
	
	
	
	
	if(bCancel){
		showLoading();
		//return true;
	} 
	//其它验证
	showLoading();
	//return true;
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});
</script>