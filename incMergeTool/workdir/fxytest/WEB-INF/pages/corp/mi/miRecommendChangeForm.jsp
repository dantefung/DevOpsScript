<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.recommend.change.apply"/></title>
    <meta name="heading" content="<fmt:message key="mi.recommend.change.apply"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="miMemberApply" method="post" action="miRecommendChangeForm.jhtml" onsubmit="return validateForm(this)" id="miForm">
    
   	<div class="error" style="display: none;">
    </div>
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td><input type="text" name="memberNo" id="memberNo" onchange="getMemberInfo(this.value);" value="${param.memberNo }"/>
    			<!-- <span id="member_name" style="color: green"></span> -->
    		</td>
    	</tr>
    	<tr id="show_id" style="display: none;"><th></th>
    		<td style="color: green" id="member_name"></td>
    	</tr
    	<tr>
    		<th class="required"><fmt:message key="mi.department.apply"/>:</th>
    		<td><win:list listCode="mi.department.list" name="applyDepartmemt" id="applyDepartmemt" value="${param.applyDepartmemt }" defaultValue="" showBlankLine="true"/></td>
    	</tr>
   		<tr>
    		<th  class="required"><fmt:message key="miMember.newRecommendNo"/>:</th>
    		<td><input type="text" name="recommendNo" id="recommendNo" value="${param.recommendNo }" style="width:80px;" onchange="getRecommendMember(this.value);"/>
    			<span id="recommendNo_show"></span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="busi.common.remark"/>:</th>
    		<td><textarea cols="80" rows="10" name="remark">${param.remark }</textarea></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
   						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
   					</win:power>
    				<button type="button" name="cancel" onclick="window.location='miRecommendChanges.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(isEmpty(theForm.memberNo.value)){
		alert("<fmt:message key='memberNo.required'/>！");
		theForm.memberNo.focus();
		return false;
	}
	
	if(isEmpty(theForm.applyDepartmemt.value)){
		alert("<fmt:message key='mi.applyDepartmemt.apply.null.requie'/>！");
		theForm.applyDepartmemt.focus();
		return false;
	}
	if(isEmpty(theForm.recommendNo.value)){
		alert("<fmt:message key='mi.newRecommend.null.requied'/>！");
		theForm.recommendNo.focus();
		return false;
	}
	
	if(isEmpty(theForm.remark.value)){
		alert("<fmt:message key='ic.remark.null.requie'/>！");
		theForm.remark.focus();
		return false;
	}
	
	showLoading();
	return true;
}
function getMemberInfo(val) {
	if(isEmpty(val)) return;
	document.getElementById("show_id").style.display = "";
	MiMemberAjax.getMiMemberInfo2(val,"1", function(data) {
		if (data != null) {
			document.getElementById("member_name").innerHTML ="<fmt:message key='poOrder.memberName'/>:"+ data.lastName+"<br/><fmt:message key='mi.recommendNo'/>:"+ data.recommendNo+"<br/><fmt:message key='poOrder.memberName'/>:"+ data.recommendName;
		} else {
			document.getElementById("member_name").innerHTML = "<fmt:message key='prompt.member.inexitance'/>";
		}
			
	});
}
function getRecommendMember(recommendNo){
	if(isEmpty(recommendNo)) return;
	MiMemberAjax.getMiMemberInfo2(recommendNo,"2", function(data) {
		if (data != null) {
			if(data.activityStatus=="0"){
				document.getElementById("recommendNo_show").innerHTML = "<fmt:message key='mi.recommand.agentNo.not.activity'/>";
			}else if(data.exitStatus=="1"){
				document.getElementById("recommendNo_show").innerHTML = "<fmt:message key='mi.recommend.exited'/>";
			}else{
				document.getElementById("recommendNo_show").innerHTML = data.lastName;
			}
		} else {
			document.getElementById("recommendNo_show").innerHTML = "<fmt:message key='mi.recommend.notFound'/>";
		}
			
		});
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}

$("document").ready(function() {
	var mno = $id("memberNo").value;
	var rno = $id("recommendNo").value;
	if(!isEmpty(mno)){
		getMemberInfo(mno);
	}
	if(!isEmpty(rno)){
		getRecommendMember(rno);
	}
});
function $id(tagId){
	return document.getElementById(tagId);
}
</script>