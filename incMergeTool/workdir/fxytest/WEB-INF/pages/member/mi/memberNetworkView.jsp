<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<head>
	<title><fmt:message key="function.menu.memberRecommendNetwork"/></title>
	<meta name="heading" content="<fmt:message key="function.menu.memberRecommendNetwork"/>"/>
</head>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>

<style>
	.cardType{
		color: #ff0000;
	}

	.cardType0{
		color: #333;
	}
</style>

<form method="get" class="form-inline" action="memberRecommendNet.jhtml" onsubmit="return validateSearch(this)">
	<div class="form-group">
		<input type="text" class="form-control" name="memberNo" id="memberNo" value="${param.memberNo }" size="12" placeholder="<fmt:message key="miMember.memberNo"/>"/>
	</div>
	<div class="form-group">
		<input id="layerId" type="text" class="form-control" name="layerId" value="${param.layerId}" size="12" placeholder="<fmt:message key="miMember.layerId"/>"/>
	</div>
	<div class="form-group">
		<div class="input-group">
			<input type="text" class="form-control" name="captchaCode" size="12" placeholder="<fmt:message key="login.verifyCode"/>"/>
			<span class="input-group-addon">
				<a href="javascript:refreshCaptchaImage('captchaImg');"><img id="captchaImg" src="${ctx}/captcha.jhtml?rnd=<%=Math.random() * 1000000%>" width="60" height="18" border="0"/></a>
			</span>
		</div>
	</div>

	<button type="submit" class="btn btn-info" name="search"><fmt:message key="operation.button.search"/></button>
	<input type="hidden" name="strAction" value="${param.strAction }"/>
</form>


<div class="zTreeDemoBackground left">
	<ul id="memberTree" class="ztree"></ul>
</div>

<SCRIPT type="text/javascript">
    $("#memberNo").blur(function(e) {
        $(this).val($(this).val().toUpperCase());
    });

    function isEmpty(str){
        if(/^\s*$/g.test(str)){
            return true;
        }
        return false;
    }

    $(document).ready(function () {
        console.log("123:"+"${userCompanyCode}")
    });

    function validateSearch(theForm) {
        if(theForm.memberNo.value==""){
            confirm("<fmt:message key='pl.plate.memberNo.required'/>.");
            theForm.memberNo.focus();
            return false;
        }else if(theForm.captchaCode.value==""){
            alert("<fmt:message key='me.inputyzm'/>.");
            theForm.captchaCode.focus();
            return false;
        }else if(!isEmpty(theForm.level.value)){
            if(isNaN(theForm.level.value)){
                alert("<fmt:message key="bdBonus.tree.level"/><fmt:message key="register.us.select.number"/>");
                return false;
            }
        }
        showLoading();
        return true;
    }
    var setting = {
        view : {
            expandSpeed : "",
            nameIsHTML: true,
            showIcon: false,
            showTitle: false,
            txtSelectedEnable : true
        },
        data: {
            simpleData: {
                enable: true
            }

        }
    };
    var simpleNodes =[
        <c:if test="${not empty miMembers}">
        <c:set var="loopCount" value="0"/>
        <c:forEach items="${miMembers}" var="miMemberVar">
        <c:if test="${loopCount>0}">,</c:if>
        //判断是推荐网络图还是接点网络图
        <c:set var="pid" value="${miMemberVar.recommend_no}"/>

        <c:set var="color_member" value="black"/>
        <c:if test="${miMemberVar.active_status == 0}">
        <c:set var="color_member" value="gray"/>
        </c:if>
        <c:if test="${miMemberVar.company_code eq userCompanyCode}" >
        {id:"${miMemberVar.member_no}",pId:"${pid}",<c:if test="${miMemberVar.level == 0}">open:true,</c:if>name:"<font color='${color_member }'>${miMemberVar.member_no} - ${miMemberVar.pet_name}</font>"
        +"<c:if test="${sessionScope.sessionLoginUser.companyCode!=miMemberVar.company_code}"> [${miMemberVar.company_code}] </c:if>"
        +"<font color='red'>${miMemberVar.level}</font>"
        +"<c:if test="${miMemberVar.active_status == 1}">"
        +"<c:if test="${miMemberVar.freeze_status==1}">[<font color='red'><win:code listCode="sysuser.freezestatus" value="${miMemberVar.freeze_status}"/></font>]</c:if>"
        +"<c:if test="${miMemberVar.suspend_status==1}">[<font color='red'><win:code listCode="sysuser.suspendstatus" value="${miMemberVar.suspend_status}"/></font>]</c:if>"
        +"<c:if test="${miMemberVar.exit_status==1}">[<font color='red'><win:code listCode="mimember.exitstatus" value="${miMemberVar.exit_status}"/></font>]</c:if>"
        +"[<font color='red'><win:code listCode="member.card.type" value="${miMemberVar.card_type}"/></font>]"
        +"[<fmt:message key="miMember.joinDate"/>:${miMemberVar.active_time }"
        +"<c:if test="${not empty miMemberVar.etime}"><font color='fuchsia'>[${miMemberVar.etime }]</font></c:if>"
        +"]</c:if>"
        +"<c:if test="${miMemberVar.active_status == 0}">[<font color='gray'><fmt:message key="label.auto.ship.status.inactive"/></font>]</c:if>"
        }
        </c:if>
        <c:if test="${miMemberVar.company_code ne userCompanyCode}" >
        {
            id:"",
            pId:"",
            <c:if test="${miMemberVar.level == 0}">open:true,</c:if>
            name:"<span aria-hidden='true' style='color: rgb(255, 0, 0);'>X  </span> - <fmt:message key="miMember.haiwaixian"/>"
        }
        </c:if>
        <c:set var="loopCount" value="${loopCount+1}"/>
        </c:forEach>
        </c:if>
    ];

    function reloadTree() {
        $.fn.zTree.init($("#memberTree"), setting, simpleNodes);
    }
    $(document).ready( function() {
        reloadTree();
        //expandAll();
    });

    function expandAll(){
        var zTree = $.fn.zTree.getZTreeObj("memberTree");
        zTree.expandAll(true);
    }
    --></SCRIPT>