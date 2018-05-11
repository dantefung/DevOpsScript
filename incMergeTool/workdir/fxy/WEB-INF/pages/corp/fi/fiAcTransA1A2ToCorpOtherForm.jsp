<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="报单币互转"/></title>
    <meta name="heading" content="<fmt:message key="报单币互转"/>"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<form:form commandName="fiAcTrans" method="post" action="fiAcTransA1A2ToCorpOtherForm.jhtml" onsubmit="return validateForm(this)" id="sysUserForm">
    <div class="contentBody">
        <spring:bind path="fiAcTrans.*">
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
                <td class="title" colspan="2" style="font-weight: normal;">
                    <fmt:message key="fi.zzxz"/>：
                    <br/><b><fmt:message key="member.changemoney"/></b><fmt:message key="member.xydy"/><b><fmt:message key="fi.dqkyye"/></b>；
                    <br/><b><fmt:message key="接收会员"/></b><fmt:message key="须与转出会员处于"/><b><fmt:message key="同一网络"/></b>；
                </td>
            </tr>
            <tr>
                <th>&nbsp;</th>
                <td>
    			<span class="form-tips">
    				<fmt:message key="item.in.bold.required"/>
    			</span>
                </td>
            </tr>
            <tr>
                <th><fmt:message key="label.fi.out.account"/>：</th>
                <td>
                    <form:input path="outMemberNo" id="outMemberNo"/>&nbsp;
                    <button type="button" name="showNameBtn" onclick="showOutName(this.form.outMemberNo.value);"><fmt:message key="mi.get.memberName"/></button>
                    <span id="memberName"></span>
                </td>
            </tr>
            <tr>
                <th class="required"><fmt:message key="fi.lable.account.type"/>：</th>
                <td>
                    <c:forEach items="${fiAcBalances }" var="fiAcBalanceVar">
                        <c:if test="${fiAcBalanceVar.ac_type=='A1'}">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="outAcType" id="outAcType_${fiAcBalanceVar.ac_type }" value="${fiAcBalanceVar.ac_type }"<c:if test="${fiAcBalanceVar.ac_type==fiAcTrans.outAcType}"> checked</c:if>/>
                                    <win:code listCode="bank_account_types" value="${fiAcBalanceVar.ac_type }"/>
                                    <br><fmt:message key="fi.userBalance"/>：<span class="redFont" id="AONE" ><fmt:formatNumber value="${fiAcBalanceVar.balance }" type="number" pattern="###,###,##0.00"/></span>
                                </label>
                            </div>
                        </c:if>
                        <c:if test="${fiAcBalanceVar.ac_type=='A2'}">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="outAcType" id="outAcType_${fiAcBalanceVar.ac_type }" value="${fiAcBalanceVar.ac_type }"<c:if test="${fiAcBalanceVar.ac_type==fiAcTrans.outAcType}"> checked</c:if>/>
                                    <win:code listCode="bank_account_types" value="${fiAcBalanceVar.ac_type }"/>
                                    <br><fmt:message key="fi.userBalance"/>：<span class="redFont" id="ATWO" ><fmt:formatNumber value="${fiAcBalanceVar.balance }" type="number" pattern="###,###,##0.00"/></span>
                                </label>
                            </div>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th class="required"><fmt:message key="fi.jshyba"/>：</th>
                <td><form:input path="inMemberNo" cssClass="form-control input-sm" onkeyup="showName(this.value)"/></td>
            </tr>
            <tr>
                <th class="required"><fmt:message key="fi.jshyxm"/>：<input type="hidden" name="inMemberName" id="inMemberName" value="${param.inMemberName }"/></th>
                <td id="show_name"></td>
            </tr>
            <tr>
                <th class="required"><fmt:message key="label.fi.out.coin"/>：</th>
                <td>
                    <form:input path="outMoney" cssClass="form-control input-sm"/>
                </td>
            </tr>
            <%--<tr>
                <th class="required"><fmt:message key="mi.second.pwd"/>：</th>
                <td><input type="password" name="advPassword" id="advPassword" class="form-control input-sm"/></td>
            </tr>--%>
            <tr>
                <th><fmt:message key="busi.common.remark"/>：</th>
                <td>
                    <form:textarea path="memo" rows="6" cols="50" class="form-control input-sm"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <div class="buttonBar">
                        <form:hidden path="id"/>
                        <input type="hidden" name="strAction" value="corpEditFiAcTransToOther"/>
                        <input type="hidden" value="${form.token}" name="_form_uniq_id" />
                        <button type="submit" class="btn btn-success" name="save" onclick="bCancel=false"><fmt:message key="operation.button.confirm"/></button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form:form>
<script type="text/javascript">
    $("#inMemberNo").blur(function(e) {
        $(this).val($(this).val().toUpperCase());
    });

    $(function() {
        showName("${param.inMemberNo}");
    });

    function validateForm(theForm) {
        if(bCancel){
            showLoading();
            return true;
        }
        //其它验证
        if(theForm.outAcType.value==""){
            alert("<fmt:message key="info.choose.out.account.type"/>");
            return false;
        }
        if(theForm.inMemberNo.value==""){
            alert("<fmt:message key='fi.qsrjshy'/>");
            theForm.inMemberNo.focus();
            return false;
        }

        if(theForm.outMoney.value=="" || !isUnsignedInteger(theForm.outMoney.value) || parseInt(theForm.outMoney.value)<=0){
            alert("<fmt:message key="info.please.input.correct.number"/>");
            theForm.outMoney.focus();
            return false;
        }
        if(theForm.advPassword.value==""){
            alert("<fmt:message key='member.inputpwd'/>");
            theForm.advPassword.focus();
            return false;
        }

        if(confirm("<fmt:message key="fi.sfqrzh"/>?")){
            showLoading();
            return true;
        }else {
            return false;
        }
    }
    function showName(val){
        if(val==null||val=="") return;
        MiMemberAjax.getMiMemberInfo(val.toUpperCase(),function(data) {
            if(data!=null){
                document.getElementById("show_name").innerHTML = data.lastName;
                document.getElementById("inMemberName").value = data.lastName;
            }else{
                document.getElementById("show_name").innerHTML = "";
                document.getElementById("inMemberName").value = "";
            }
        });
    }
    function showOutName(val) {
        MiMemberAjax.getMiMemberInfoIncBDB(val, function(data) {
            if (data != null) {
                if(data.fiAcBalances != null){
                    var A1="0.00";
                    var A2="0.00";
                    var arr=data.fiAcBalances;
                    for(var i=0;i<arr.length;i++){
                         if(arr[i].ac_type=='A1'){
                             A1=arr[i].balance;
                         }
                         if(arr[i].ac_type=='A2'){
                             A2=arr[i].balance;
                         }
                    }
                    document.getElementById("AONE").innerHTML = A1;
                    document.getElementById("ATWO").innerHTML = A2;
                }
                document.getElementById("memberName").innerHTML = data.lastName;
            } else {
                document.getElementById("memberName").innerHTML = "<fmt:message key='miMember.notFound'/>";//会员不存在
            }

        });
    }
</script>