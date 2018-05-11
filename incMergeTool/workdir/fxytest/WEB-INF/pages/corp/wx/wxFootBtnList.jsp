<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>微信底部菜单管理</title>
    <meta name="heading" content="微信底部菜单管理"/>
</head>

<div class="contentBody">
	<br/>
	注意：一级菜单最多3个，每个一级菜单下最多5个二级菜单，如果超出后微信将不受理；
	<br/>菜单同步后，由于微信会缓存之前的菜单，因此不会马上更新，如果需要马上看到效果，可以取消关注后再关注公众号。
	<br/><br/>
	<form name="wxFootBtnFunctionForm" id="wxFootBtnFunctionForm" action="editWxFootBtn.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxFootBtn">
				<a href="editWxFootBtn.jhtml?strAction=addWxFootBtn" name="add">增加一级按钮</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="synchWxFootBtn">
				<a href="javascript:synchWxFootBtn()" name="refresh">同步至公众号</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedButtonIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<div class="eXtremeTable" >
		<table id="wxFootBtnListTable_table"  border="0"  cellspacing="0"  cellpadding="4"  class="tableRegion"  width="100%" >
			<thead>
			<tr>
				<td class="tableHeader" >操作</td>
				<td class="tableHeader">按钮文字</td>
				<td class="tableHeader">按钮类型</td>
				<td class="tableHeader">按钮KEY值</td>
				<td class="tableHeader">按钮动作(回复信息)</td>
				<td class="tableHeader">跳转链接</td>
				<td class="tableHeader">创建人</td>
				<td class="tableHeader">创建时间</td>
				<td class="tableHeader">最后修改人</td>
				<td class="tableHeader">最后修改时间</td>
				<td class="tableHeader">是否显示</td>
			</tr>
			</thead>
			<tbody class="tableBody" >
				<c:forEach items="${wxFootBtns}" var="wxFootBtnVar">
					<tr class="odd">
						<td>
							<win:power powerCode="editWxFootBtn">
								<a href="editWxFootBtn.jhtml?strAction=editWxFootBtn&buttonId=${wxFootBtnVar.buttonId}" name="edit"><fmt:message key="button.edit"/></a>
							</win:power>
							<c:if test="${wxFootBtnVar.parentId==0 }">
								<win:power powerCode="addWxFootBtn">
									<a href="editWxFootBtn.jhtml?strAction=addWxFootBtn&parentId=${wxFootBtnVar.buttonId}" name="add">增加二级按钮</a>
								</win:power>
							</c:if>
						</td>
						<td>${wxFootBtnVar.buttonTitle }</td>
						<td><win:code listCode="foot_btn_type" value="${wxFootBtnVar.buttonType }"></win:code> </td>
						<td>${wxFootBtnVar.buttonKey }</td>
						<td>${wxFootBtnVar.wxReMsg.interDesc }</td>
						<td>${wxFootBtnVar.navUrl }</td>
						<td>${wxFootBtnVar.creatorCode }</td>
						<td>${wxFootBtnVar.createTime }</td>
						<td>${wxFootBtnVar.editorCode }</td>
						<td>${wxFootBtnVar.editorName }</td>
						<td><win:code listCode="yesno" value="${wxFootBtnVar.isVisible }"/></td>
					</tr>
					<c:if test="${not empty wxFootBtnVar.subWxFootBtns}">
						<c:forEach items="${wxFootBtnVar.subWxFootBtns}" var="subWxFootBtnVar">
							<tr class="odd">
								<td>
									<win:power powerCode="editWxFootBtn">
										<a href="editWxFootBtn.jhtml?strAction=editWxFootBtn&buttonId=${subWxFootBtnVar.buttonId}" name="edit"><fmt:message key="button.edit"/></a>
									</win:power>
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${subWxFootBtnVar.buttonTitle }</td>
								<td><win:code listCode="foot_btn_type" value="${subWxFootBtnVar.buttonType }"></win:code> </td>
								<td>${subWxFootBtnVar.buttonKey }</td>
								<td>${subWxFootBtnVar.wxReMsg.interDesc }</td>
								<td>${subWxFootBtnVar.navUrl }</td>
								<td>${subWxFootBtnVar.creatorCode }</td>
								<td>${subWxFootBtnVar.createTime }</td>
								<td>${subWxFootBtnVar.editorCode }</td>
								<td>${subWxFootBtnVar.editorName }</td>
								<td><win:code listCode="yesno" value="${subWxFootBtnVar.isVisible }"/></td>
							</tr>
						</c:forEach>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
	
<script type="text/javascript">
$(function() {
	$("a[name='add']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-add"
        },
        text: false
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function synchWxFootBtn(){
	if(!confirm("确定同步当前菜单至微信公众号？")){
		return;
	}
	var theForm=document.wxFootBtnFunctionForm;
	theForm.strAction.value="synchWxFootBtn";
	
	showLoading();
	theForm.submit();
}
</script>