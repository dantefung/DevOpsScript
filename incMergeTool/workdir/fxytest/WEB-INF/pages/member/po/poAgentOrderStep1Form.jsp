<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="sec.purchase.discount"/></title>
	<meta name="heading" content="<fmt:message key='sec.purchase.discount'/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="poAgentOrderStep1.jhtml"  name="miMemberForm" id="miMemberForm">
    <input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    <spring:bind path="miMember.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="alert alert-danger alert-dismissible fade in error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    
    <table class="detail">
    	
    	<tr>
    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="mi.mustred"/></td>
    	</tr>
    	<tr>
    		<th  class="required">&nbsp;<fmt:message key="miMember.memberNo"/>:</th>
    		<td>${newOrderMap.memberNo}
    			<input type="hidden" name="memberNo" id="memberNo" value="${newOrderMap.memberNo}"/>
    			<font color="red" id="memberNo_err"></font>
    		</td>
    	</tr>
   		<tr id="preSell_show" <c:if test="${isFlag!='1' }">style="display: none;"</c:if>>
    		<th class="required">&nbsp;<fmt:message key="order.is.pre.sell.lable"/>:</th>
    		<td>
    			<input type="hidden" name="isPreSell" value="0"/>
    			<%-- <win:list name="isPreSell" id="isPreSell" listCode="yesno" defaultValue="" value="${newOrderMap.isPreSell }" showBlankLine="true" onchange="getDate()"/> --%>
    		</td>
   		</tr>
   		<tr id="preSell_date_show"  style="display: none;">
   			<th  class="required">&nbsp;<fmt:message key="order.pre.sell.date.lable"/>:</th>
    		<td>
    			<select name="preSellYear" id="preSellYear" onchange="getMonth()"></select> <fmt:message key="labe.year"/>&nbsp;&nbsp;
    			<select name="preSellMonth" id="preSellMonth"></select> <fmt:message key="label.month"/>
    			<%-- <input name="preSellDate" id="preSellDate" value="${preSellDate}" readonly="readonly" /> --%><br>
    			<font color="red" id="pre_remark"></font>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" value="${param.strAction }" name="strAction" />
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    				<button type="button" name="next" class="btn btn-success" onclick="bCancel=false;validateForm()"><fmt:message key="button.next"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
    <input type="hidden" value="${isFlag }" name="isFlag" id="isFlag"/>
</div>

<script type="text/javascript">
$("#memberNo").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 

$(function() {
	/* $( "#preSellDate" ).datepicker({
		dateFormat: "yy-mm" ,
		minDate: "1m",
		maxDate: "13m"
	}); */

	if(!isEmpty('${isPreSell}')){
		$id("preSell_show").style.display = "";
		$id("pre_remark").innerHTML = "<fmt:message key="order.pre.sell.remark"/>";
		getDate();
	}
	iniDate();
});
function validateForm() {
	if(bCancel){
		showLoading();
		$id("miMemberForm").submit();
		return;
	}
	if (isEmpty($id("memberNo").value)) {
		alert("<fmt:message key='memberNo.required'/>.");
		theForm.memberNo.focus();
	}
	if(!isEmpty($id("isFlag").value)){
		if($id("isFlag").value=="1" && isEmpty($id("isPreSell").value)){
			alert("<fmt:message key='order.is.pre.sell.null.requeid'/>.");
			theForm.isPreSell.select();
		} else if($id("isPreSell").value=="1" && isEmpty($id("preSellYear").value)){
			alert("<fmt:message key='order.pre.sell.date.null.requeid'/>.");
			theForm.preSellYear.select();
		} else if($id("isPreSell").value=="1" && isEmpty($id("preSellMonth").value)){
			alert("<fmt:message key='order.pre.sell.date.null.requeid'/>.");
			theForm.preSellMonth.select();
		}/* else if($id("isPreSell").value=="1" && isEmpty($id("preSellDate").value)){
			alert("<fmt:message key='order.pre.sell.date.null.requeid'/>.");
			theForm.preSellDate.focus();
		} */else{
			showLoading();
			$id("miMemberForm").submit();
		}
	}else{
		showLoading();
		$id("miMemberForm").submit();
	}
}
//年对应月份
var yearToMonthMap = null;
//初始化可选择年月
function iniDate(){
	var date = new Date();
	//获取当前所在年度
	var yearNow = date.getFullYear();
	//获取当前所在月份
	var monthNow = date.getMonth()+1;
	
	//当年可选月份
	var monthMap1 = getMap();
	//第二年可选月份
	var monthMap2 = null;
	
	var yearMap = getMap();
	//只能选择将来12个月，如果当前月为12月，则只有明年一年可以选
	if(monthNow==12){
		yearNow = yearNow+1;
		yearMap.put(yearNow,yearNow);
	}else{
		yearMap.put(yearNow,yearNow);
		yearMap.put(yearNow+1,yearNow+1);
		monthMap2 = getMap();
	}
	//年对应月份
	 yearToMonthMap = getMap();
	//可选择的月份,只能选择将来12个月
	for(var i=1;i<=12; i++){
		if(i<monthNow+1 && monthMap2!=null){//第二年可选择的月份
			monthMap2.put(i,i);
		}else{//第一年可选择的月份
			monthMap1.put(i,i);
		}
	}
	yearToMonthMap.put(yearNow,monthMap1);
	if(monthMap2!=null){
		yearToMonthMap.put(yearNow+1,monthMap2);
	}
	
	dwr.util.removeAllOptions("preSellYear");
	dwr.util.addOptions("preSellYear", yearMap);
	
	dwr.util.removeAllOptions("preSellMonth");
	dwr.util.addOptions("preSellMonth", monthMap1);
	
	$id("preSellYear").value = '${year}';
	$id("preSellMonth").value = '${month}';
}
function getMonth(){
	var year = $id("preSellYear").value;
	var map = eval(yearToMonthMap.get(year));
	
	dwr.util.removeAllOptions("preSellMonth");
	dwr.util.addOptions("preSellMonth", map);
}
//中国区的返单可参加预购重消
function getInfo(){
	//if('${strAction}'!== 'poOrderProducts') return;
	var memberNo = $id("memberNo").value;
	if(isEmpty(memberNo)) return;
	MiMemberAjax.getMiMemberInfo(memberNo,function(data){
		if(data!=null &&data.companyCode=="CN"){
			$id("preSell_show").style.display = "";
			$id("pre_remark").innerHTML = "<fmt:message key="order.pre.sell.remark"/>";
			$id("isFlag").value = "1";
		}else{
			$id("preSell_show").style.display = "none";
			$id("pre_remark").innerHTML = "";
			$id("preSell_date_show").style.display = "none";
			$id("isPreSell").value = "none";
			//$id("preSellDate").value = "";
			$id("isFlag").value = "-1";
		}
	});
	
}
function getDate(){
	var isPreSell = $id("isPreSell").value;
	if(isPreSell=="1"){
		$id("preSell_date_show").style.display = "";
		$id("pre_remark").innerHTML = "<fmt:message key="order.pre.sell.remark"/>";
		$id("memberNo_err").innerHTML = "";
	}else{
		$id("preSell_date_show").style.display = "none";
		//$id("preSellDate").value = "";
	}
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
function $id(tagId){
	return document.getElementById(tagId);
}
function getMap() {//初始化map_,给map_对象增加方法，使map_像Map    
      var map_ = new Object();    
      map_.put = function(key, value) {    
          map_[key] = value;    
      };    
      map_.get = function(key) {    
          return map_[key];    
      };    
      map_.remove = function(key) {    
          delete map_[key];    
      };    
      var str = ",put,get,remove,keyset,";
      map_.keyset = function() {    
          var ret = "";    
          for(var p in map_) {    
              if(typeof p == 'string' && str.indexOf(","+p+",") ==-1) {    
                  ret += ",";    
                  ret += p.substring(0,p.length);    
              }    
          }    
          if(ret == "") {    
              return ret.split(",");    
          } else {    
             return ret.substring(1).split(",");    
          }    
    };    
 	 return map_;    
}    
</script>