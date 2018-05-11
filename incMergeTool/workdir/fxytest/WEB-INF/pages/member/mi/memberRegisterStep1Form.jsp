<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="mi.registmember"/></title>
    <meta name="heading" content="<fmt:message key="mi.registmember"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/SysIdAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/jquery-entropizer.min.css"/>
<script type="text/javascript" src="${ctx}/scripts/entropizer.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery-entropizer.min.js"></script>

<style>
    #meter2 .entropizer-track {
        background-color: #e8e8e8;
        border-radius: 2px;
        height: 4px;
    }

    #meter2 .entropizer-bar {
        height: 4px;
    }

    #memberNoLabel {
        font-size: 16px;
        font-weight: bold;
        color: red;
    }
</style>

<form:form commandName="miMember" method="post" action="memberRegisterStep1.jhtml" onsubmit="return validateForm(this)"
           name="memberRegisterForm" id="memberRegisterForm" enctype="multipart/form-data" cssClass="form-horizontal">
    <input type="hidden" id="newMemberKey" name="newMemberKey" value="${newMemberKey}"/>
    <spring:bind path="miMember.*">
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

    <p class="text-muted"><fmt:message key="item.in.bold.required"/></p>
    <fmt:message key="mi.mustred"/>
    <hr/>

    <div class="row">
        <div class="col-md-7">
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label required"><fmt:message key="miMember.memberNo"/>:</label>
                <div class="col-sm-9">
                    <form:hidden path="memberNo" id="memberNo"/>
                    <span id="memberNoLabel">${miMember.memberNo }</span>
                    <button type="button" name="refresh" class="btn btn-info btn-sm"
                            onclick="javascript:changeMemberNo();"
                            title="<fmt:message key="mi.exchange"/>">
                        <i class="fa fa-refresh" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label required"><fmt:message key="sysUser.password"/>:</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" name="password" id="password"
                           placeholder="<fmt:message key="sysUser.password"/>"/>
                    <div id="meter2"></div>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label required"><fmt:message key="sysUser.repeatPassword"/>:</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" name="rePassword" id="rePassword"
                           placeholder="<fmt:message key="sysUser.repeatPassword"/>"/>
                    <p class="help-block"><fmt:message key="notice.password1.same.password2"/></p>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="lastName" class="col-sm-3 control-label required"><fmt:message key="mi.realname"/>:</label>
                <div class="col-sm-9">
                    <form:input path="lastName" id="lastName" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="petName" class="col-sm-3 control-label required"><fmt:message
                        key="mi.register.petName"/>:</label>
                <div class="col-sm-9">
                    <form:input path="petName" id="petName" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="idType" class="col-sm-3 control-label required"><fmt:message
                        key="miMember.certificateType"/>:</label>
                <div class="col-sm-9">
                    <win:list name="idType" listCode="member.cardtype" defaultValue="" value="${miMember.idType}"
                              styleClass="form-control"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="idNo" class="col-sm-3 control-label required"><fmt:message key="miMember.cardNo"/>:</label>
                <div class="col-sm-9">
                    <form:input path="idNo" id="idNo" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="mobile" class="col-sm-3 control-label required"><fmt:message
                        key="mi.register.mobil"/>:</label>
                <div class="col-sm-9">
                    <form:input path="mobile" id="mobile" maxlength="11" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="email" class="col-sm-3 control-label"><fmt:message key="mi.email"/>:</label>
                <div class="col-sm-9">
                    <form:input path="email" id="email" cssClass="form-control"/>
                </div>
            </div>
            <fmt:message key="mi.register.position.explain"/>
            <hr/>
            <div class="form-group form-group-sm">
                <label for="recommendNo" class="col-sm-3 control-label required"><fmt:message
                        key="mi.recommendNo"/>:</label>
                <div class="col-sm-9">
                    <div class="input-group input-group-sm">
                        <form:input path="recommendNo" id="recommendNo" cssClass="form-control"/>
                        <div class="input-group-btn">
                            <button type="button" name="showRecommendNameBtn" class="btn btn-info"
                                    onclick="showName(this.form.recommendNo.value,'recommendName');"
                                    title="<fmt:message key="miMember.recommendName"/>">
                                <i class="fa fa-check" aria-hidden="true"></i>
                            </button>
                        </div>
                        <span class="input-group-addon glyphicon" id="recommendName" aria-hidden="true"></span>
                    </div>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="linkNo" class="col-sm-3 control-label required"><fmt:message
                        key="mi.lable.linkNo"/>:</label>
                <div class="col-sm-9">
                    <div class="input-group input-group-sm">
                        <form:input path="linkNo" id="linkNo" cssClass="form-control"/>
                        <div class="input-group-btn">
                            <button type="button" name="showLinkNameBtn" class="btn btn-info"
                                    onclick="showName(this.form.linkNo.value,'linkName');"
                                    title="<fmt:message key="miMember.linkName"/>">
                                <i class="fa fa-check" aria-hidden="true"></i>
                            </button>
                        </div>
                        <span class="input-group-addon glyphicon" id="linkName" aria-hidden="true"></span>
                    </div>
                </div>
            </div>

            <div class="form-group form-group-sm">
                <label for="leafType" class="col-sm-3 control-label required"><fmt:message
                        key="lang.position"/>:</label>
                <div class="col-sm-9">
                    <win:list name="leafType" listCode="tree_left_right" defaultValue="0" value="${miMember.leafType }"
                              styleClass="form-control"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label for="cardType" class="col-sm-3 control-label required"><fmt:message
                        key="mi.register.cardType"/>:</label>
                <div class="col-sm-9">
                    <div class="input-group">
                        <select name="cardType" class="form-control">
                            <c:forEach items="${typeList }" var="ttype">
                                <c:if test="${ttype.key!='0' }">
                                    <option value="${ttype.key }"
                                            <c:if test="${ttype.key==miMember.cardType  }">selected="selected"</c:if>>
                                        <fmt:message key="${ttype.value }"/></option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <span class="input-group-addon glyphicon" aria-hidden="true">
		    				<fmt:message key="lang.required.pv"/>：<strong><span id="cardTypeRange"
                                                                                class="text-warning"></span></strong>
		    			</span>
                    </div>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label required">服务中心:</label>
                <div class="col-sm-9">
                    <div class="input-group input-group-sm">
                        <input name="ttLinkNo" id="ttLinkNo" class="form-control" value="${ttLinkNo}"/>
                        <div class="input-group-btn">
                            <button type="button" name="showAgentNameBtn" class="btn btn-info"
                                    onclick="showName(this.form.ttLinkNo.value,'agentName');"
                                    title="<fmt:message key="miMember.recommendName"/>">
                                <i class="fa fa-check" aria-hidden="true"></i>
                            </button>
                        </div>
                        <span class="input-group-addon glyphicon" id="agentName" aria-hidden="true"></span>
                    </div>
                </div>
            </div>
                <%--	<div class="form-group form-group-sm">
                        <label for="cardType" class="col-sm-3 control-label required"><fmt:message key="lang.regist.count"/>:</label>
                        <div class="col-sm-9">
                            <win:list name="registerCount" listCode="first_register_count" defaultValue="1" value="${registerCount}" styleClass="form-control"/>
                        </div>
                    </div>--%>
            <hr/>
            <div class="form-group form-group-sm">
                <div class="col-sm-12 text-center">
                    <!-- 来源属性  默认为  新加入会员 -->
                    <input type="hidden" value="1" name="registerType"/>
                    <input type="hidden" value="1" name="registerCount"/>
                    <input type="hidden" value="${form.token}" name="_form_uniq_id"/>
                    <!--
    				<button type="button" name="cancel" onclick="window.location='memberRegisterStep0.jhtml?needReload=1'"><fmt:message key="button.previous"/></button>
    				 -->
                    <button type="submit" name="save" class="btn btn-success" onclick="bCancel=false"><fmt:message
                            key="button.next"/></button>
                </div>
            </div>
        </div>
    </div>

</form:form>

<script type="text/javascript">
    $("#recommendNo,#linkNo").blur(function (e) {
        $(this).val($(this).val().toUpperCase());
    });

    $("select[name='cardType']").change(function (e) {
        handleCardTypeChange();
    });

    $(document).ready(function () {
        handleCardTypeChange();

        $('#meter2').entropizer({
            target: '#password',
            update: function (data, ui) {
                ui.bar.css({
                    'background-color': data.color,
                    'width': data.percent + '%'
                });
            }
        });
    })

    function validateForm(theForm) {
        if (bCancel) {
            showLoading();
            return true;
        }

        if (theForm.password.value == "" || theForm.password.value.length < 8) {
            alert("<fmt:message key="tips.password"/>.");
            theForm.password.focus();
            return false;
        }
        if (theForm.rePassword.value == "") {
            alert("<fmt:message key="sysUser.repeatPassword.required"/>. <fmt:message key="tips.password"/>");
            theForm.rePassword.focus();
            return false;
        }
        if (theForm.password.value != theForm.rePassword.value) {
            alert("<fmt:message key="prompt.pwd.inconformity"/>.");
            return false;
        }
        if (theForm.ttLinkNo.value == "") {
            alert("<fmt:message key="请填写服务中心"/>.");
            return false;
        }

        if (theForm.lastName.value == null || theForm.lastName.value == '') {
            alert("<fmt:message key='mi.realName.null.requie'/>.");
            theForm.lastName.focus();
            return false;
        }

        if (theForm.petName.value == null || theForm.petName.value == '') {
            alert("<fmt:message key='mi.null.petname'/>.");
            theForm.petName.focus();
            return false;
        }

        if (theForm.idType.value == null || theForm.idType.value == '') {
            alert("<fmt:message key='mi.cardType.null.requie'/>.");
            theForm.idType.focus();
            return false;
        }

        if (theForm.idNo.value == null || theForm.idNo.value == '' || theForm.idNo.value.length < 6) {
            alert("<fmt:message key='prompt.idCard.format.wrong'/>.");
            theForm.idNo.focus();
            return false;
        }

        if (theForm.mobile.value == null || theForm.mobile.value == '') {
            alert("<fmt:message key='mi.telephone.null.requie'/>.");
            theForm.mobile.focus();
            return false;
        }

        if (theForm.recommendNo.value == null || theForm.recommendNo.value == '') {
            alert("<fmt:message key='mi.recommendNo.null.requie'/>.");
            theForm.recommendNo.focus();
            return false;
        }
        if (theForm.linkNo.value == null || theForm.linkNo.value == '') {
            alert("<fmt:message key='linkNo.isNotEmpty'/>.");
            theForm.linkNo.focus();
            return false;
        }

        //其它验证
        showLoading();
        return true;

        //dwr.engine.setAsync(true);
    }

    /* 获取会员编号 */
    function changeMemberNo() {
        SysIdAjax.getMemberNoForRegister("", function (data) {
            $("#memberNoLabel").html(data);
            $("#memberNo").val(data);
        });
    }

    function showName(val, showDiv) {
        MiMemberAjax.getMiMemberInfo(val, function (data) {
            if (data != null) {
                document.getElementById(showDiv).innerHTML = data.lastName;
            }
        });
    }

    function handleCardTypeChange() {
        var cardType = document.memberRegisterForm.cardType.value;
        MiMemberAjax.getCardTypeRequiredRange(cardType, function (data) {
            $("#cardTypeRange").text(data);
        });
    }
</script>