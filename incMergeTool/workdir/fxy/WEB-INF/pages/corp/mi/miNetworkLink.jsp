<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<head>
    <title><fmt:message key="linkno.search"/></title>
    <meta name="heading" content="<fmt:message key="linkno.search"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/jquery.orgchart.css" />
<script type="text/javascript" src="${ctx}/scripts/jquery.orgchart.js"></script>

<div class="searchBar">
	<form method="get" action="miNetworkLink.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="topMemberNo" value="${param.topMemberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="miNetworkLink"/>
			</dd>
		</dl>
	</form>
</div>

			
<div class="contentBody">
	<c:if test="${not empty topMemberNo }">
		<ul class="nav">
			<li><fmt:message key="lang.current.place"/>：</li>
			<c:forEach items="${upLinkTree }" var="upLinkTreVar">
				<c:if test="${memberNo==upLinkTreVar }">
					<li class="active">${upLinkTreVar }</li>
				</c:if>
				<c:if test="${memberNo!=upLinkTreVar }">
					<li><a href="miNetworkLink.jhtml?topMemberNo=${topMemberNo }&memberNo=${upLinkTreVar }">${upLinkTreVar }</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</c:if>
	
	<ul id="basic-chart-source" class="hide">
		<c:if test="${not empty miMembers}">
			<c:forEach items="${miMembers}" var="miMemberVar">
				<c:if test="${miMemberVar.level==0 }">
					<li>
						<h2>${miMemberVar.member_no}</h2>
						${miMemberVar.last_name}
						<br/><win:code listCode="member.card.type" value="${miMemberVar.card_type}"/>
						
						<table border="0" class="pvShow text-center" width="100%">
							<tr>
								<td><fmt:message key="bdBonus.tree.organize"/>:</td>
								<c:forEach items="${miMembers}" var="subMiMemberVar">
									<c:if test="${subMiMemberVar.link_no==miMemberVar.member_no}">
									<td style="width:50%;">
										${subMiMemberVar.ac_group_sell}
									</td>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<td><fmt:message key="pv.keep"/>:</td>
								<c:forEach items="${miMembers}" var="subMiMemberVar">
									<c:if test="${subMiMemberVar.link_no==miMemberVar.member_no}">
									<td style="width:50%;">
										${subMiMemberVar.bl_group_pv}
									</td>
									</c:if>
								</c:forEach>
							</tr>
						</table>

						<ul>
							<c:forEach items="${miMembers}" var="miMemberVar2">
								<c:if test="${miMemberVar2.level==1 && miMemberVar2.link_no==miMemberVar.member_no}">
									<li>
										<h2>${miMemberVar2.member_no}</h2>
										${miMemberVar2.last_name}
										<br/><win:code listCode="member.card.type" value="${miMemberVar2.card_type}"/>
										
										<table border="0" class="pvShow text-center" width="100%">
											<tr>
												<td><fmt:message key="bdBonus.tree.organize"/>:</td>
												<c:forEach items="${miMembers}" var="subMiMemberVar">
													<c:if test="${subMiMemberVar.link_no==miMemberVar2.member_no}">
													<td style="width:50%;">
														${subMiMemberVar.ac_group_sell}
													</td>
													</c:if>
												</c:forEach>
											</tr>
											<tr>
												<td><fmt:message key="pv.keep"/>:</td>
												<c:forEach items="${miMembers}" var="subMiMemberVar">
													<c:if test="${subMiMemberVar.link_no==miMemberVar2.member_no}">
													<td style="width:50%;">
														${subMiMemberVar.bl_group_pv}
													</td>
													</c:if>
												</c:forEach>
											</tr>
										</table>
										
										<a class="view-child" href="miNetworkLink.jhtml?topMemberNo=${param.topMemberNo }&memberNo=${miMemberVar2.member_no}">
											<fmt:message key="function.menu.view"/>
										</a>
										
										<ul>
											<c:forEach items="${miMembers}" var="miMemberVar3">
												<c:if test="${miMemberVar3.level==2 && miMemberVar3.link_no==miMemberVar2.member_no}">
													<li>
														<h2>${miMemberVar3.member_no}</h2>
														${miMemberVar3.last_name}
														<br/><win:code listCode="member.card.type" value="${miMemberVar3.card_type}"/>
														
														<table border="0" class="pvShow text-center" width="100%">
															<tr>
																<td><fmt:message key="bdBonus.tree.organize"/>:</td>
																<c:forEach items="${miMembers}" var="subMiMemberVar">
																	<c:if test="${subMiMemberVar.link_no==miMemberVar3.member_no}">
																	<td style="width:50%;">
																		${subMiMemberVar.ac_group_sell}
																	</td>
																	</c:if>
																</c:forEach>
															</tr>
															<tr>
																<td><fmt:message key="pv.keep"/>:</td>
																<c:forEach items="${miMembers}" var="subMiMemberVar">
																	<c:if test="${subMiMemberVar.link_no==miMemberVar3.member_no}">
																	<td style="width:50%;">
																		${subMiMemberVar.bl_group_pv}
																	</td>
																	</c:if>
																</c:forEach>
															</tr>
														</table>
										
														<a class="view-child" href="miNetworkLink.jhtml?topMemberNo=${param.topMemberNo }&memberNo=${miMemberVar3.member_no}">
															<fmt:message key="function.menu.view"/>
														</a>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</c:if>
			</c:forEach>
		</c:if>
	</ul>
	
	<div id="chart">
	</div>
		
</div>
			
<SCRIPT type="text/javascript">
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}

function validateSearch(theForm) {
	if(theForm.topMemberNo.value==""){
		alert("<fmt:message key='pl.plate.memberNo.required'/>.");
		theForm.topMemberNo.focus();
		return false;
	}/* else if(!isEmpty(theForm.layerId.value)){
		if(isNaN(theForm.layerId.value)){
			alert("<fmt:message key="bdBonus.tree.level"/><fmt:message key="register.us.select.number"/>");
			return false;
		}
	} */
	showLoading();
	return true;
}

$(document).ready(function() {
	$("#basic-chart-source").orgChart({container: $("#chart")});
});

</SCRIPT>
