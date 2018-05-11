<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title><fmt:message key="miMemberAccountDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="编辑银行卡"/>"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
</head>

<div class="contentBody">
    <form:form commandName="miMemberAccount" method="post" action="editMiMemberAccount.jhtml"
               onsubmit="return validateForm(this)" id="miMemberAccountForm">

        <spring:bind path="miMemberAccount.*">
            <c:if test="${not empty status.errorMessages}">
                <div class="error">
                    <ul>
                        <c:forEach var="error" items="${status.errorMessages}">
                            <li>${error}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
        </spring:bind>
        <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
        <table class="detail">
            <tr>
                <td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
            </tr>
            <tr>
                <th class="required"><fmt:message key="会员编号"/>:</th>
                <td><form:input path="memberNo" id="memberNo"/></td>
            </tr>
            <tr>
                <th class="required"><fmt:message key="开户行"/>:</th>
                <td><form:input path="openBank" id="openBank"/></td>
            </tr>
                <%--<tr>--%>
                <%--<th><fmt:message key="miMemberAccount.bcity"/>:</th>--%>
                <%--<td><form:input path="bcity" id="bcity"/></td>--%>
                <%--</tr>--%>
            <tr>
                <th class="required"><fmt:message key="开户人姓名"/>:</th>
                <td><form:input path="bname" id="bname"/></td>
            </tr>
            <tr>
                <th class="required"><fmt:message key="银行账号"/>:</th>
                <td><form:input path="bnum" id="bnum"/></td>
            </tr>
                <%--<tr>--%>
                <%--<th><fmt:message key="miMemberAccount.lastEditorCode"/>:</th>--%>
                <%--<td><form:input path="lastEditorCode" id="lastEditorCode"/></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th><fmt:message key="miMemberAccount.lastEditorName"/>:</th>--%>
                <%--<td><form:input path="lastEditorName" id="lastEditorName"/></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th><fmt:message key="miMemberAccount.lastEitTime"/>:</th>--%>
                <%--<td><form:input path="lastEitTime" id="lastEitTime"/></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th><fmt:message key="miMemberAccount.companyCode"/>:</th>--%>
                <%--<td><form:input path="companyCode" id="companyCode"/></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th><fmt:message key="miMemberAccount.bprovince"/>:</th>--%>
                <%--<td><form:input path="bprovince" id="bprovince"/></td>--%>
                <%--</tr>--%>
            <tr>
                <th class="required"><fmt:message key="支行名称"/>:</th>
                <td><form:input path="bbranch" id="bbranch"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="buttonBar">
                        <form:hidden path="accId"/>
                        <input type="hidden" name="strAction" value="${param.strAction }"/>
                        <input type="hidden" value="${form.token}" name="_form_uniq_id"/>
                        <win:power powerCode="${param.strAction }">
                            <button type="submit" name="save" onclick="bCancel=false"><fmt:message
                                    key="button.save"/></button>
                        </win:power>
                        <c:if test="${not empty miMemberAccount.accId }">
                            <win:power powerCode="deleteMiMemberAccount">
                                <button type="submit" name="delete"
                                        onclick="bCancel=true;return confirmDelete(this.form,'MiMemberAccount')">
                                    <fmt:message key="operation.button.delete"/></button>
                            </win:power>
                        </c:if>
                        <button type="button" name="cancel"
                                onclick="window.location='miMemberAccounts.jhtml?needReload=1'"><fmt:message
                                key="operation.button.cancel"/></button>
                    </div>
                </td>
            </tr>
        </table>

    </form:form>
</div>
<script type="text/javascript">
    function isEmpty(str) {
        if (/^\s*$/g.test(str)) {
            return true;
        }
        return false;
    }
    function validateForm(theForm) {
        if (bCancel) {
            showLoading();
            return true;
        }
        if (isEmpty(theForm.memberNo.value)) {
            alert("会员编号不能为空！");
            theForm.memberNo.focus();
            return false;
        }
        if (isEmpty(theForm.openBank.value)) {
            alert("开户行不能为空！");
            theForm.openBank.focus();
            return false;
        }
        if (isEmpty(theForm.bname.value)) {
            alert("开户人姓名不能为空！");
            theForm.bname.focus();
            return false;
        }
        if (isEmpty(theForm.bnum.value)) {
            alert("银行找好不能为空！");
            theForm.bnum.focus();
            return false;
        }
        if (isEmpty(theForm.bbranch.value)) {
            alert("支行名称不能为空！");
            theForm.bbranch.focus();
            return false;
        }

        //其它验证
        showLoading();
        return true;
    }
</script>