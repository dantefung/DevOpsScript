<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title>收益条目审核结果</title>
    <meta name="heading" content="收益条目审核结果"/>
</head>

<div class="contentBody">
	<table class="detail">
		<tr>
			<td>
				<c:if test="${not empty messages}">
					<c:forEach items="${messages}" var="messageVar">
						> ${messageVar }<br/>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<div class="buttonBar">
					<button type="submit" name="cancel" onclick="window.location='fiBonusChangesChk.jhtml?strAction=listFiBonusChangesChk&needReload=1';"><fmt:message key="operation.button.return"/></button>
				</div>
			</td>
		</tr>
	</table>
</div>