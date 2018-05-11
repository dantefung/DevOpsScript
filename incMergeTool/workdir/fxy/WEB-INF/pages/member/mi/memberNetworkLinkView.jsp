<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<head>
	<title><fmt:message key="linkno.search"/></title>
	<meta name="heading" content="<fmt:message key="linkno.search"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/jquery.orgchart.css" />
<script type="text/javascript" src="${ctx}/scripts/jquery.orgchart.js"></script>

<c:choose>
	<c:when test="${allowViewLink==true }">

		<form method="get" class="form-inline" action="memberLinkNet.jhtml" onsubmit="return validateSearch(this)">
			<input type="text" class="form-control" name="memberNo" value="${param.memberNo }" placeholder="<fmt:message key="miMember.memberNo"/>"/>
			<input id="layerId" type="hidden" class="form-control" name="layerId" value="2"/>
			<button type="submit" class="btn btn-info" name="search"><fmt:message key="operation.button.search"/></button>
			<input type="hidden" name="strAction" value="${param.strAction }"/>
		</form>

		<hr/>
		<ol class="breadcrumb">
			<li>当前位置：</li>
			<c:forEach items="${upLinkTree }" var="upLinkTreVar">
				<c:if test="${topestMemberNo==upLinkTreVar }">
					<li class="active">${upLinkTreVar }</li>
				</c:if>
				<c:if test="${topestMemberNo!=upLinkTreVar }">
					<li><a href="memberLinkNet.jhtml?memberNo=${upLinkTreVar }">${upLinkTreVar }</a></li>
				</c:if>
			</c:forEach>
		</ol>
		<br/>
		<ul id="basic-chart-source" class="hide">
			<c:if test="${not empty miMembers}">
				<c:forEach items="${miMembers}" var="miMemberVar">
					<c:if test="${miMemberVar.level==0 }">
						<li>
							<c:if test="${miMemberVar.diffNationConceal ne 'Y'}" >
								<h2>
									<i class="fa fa-user-o" aria-hidden="true"></i>
										${miMemberVar.member_no}
								</h2>
								${miMemberVar.last_name}
								<br/><win:code listCode="member.card.type" value="${miMemberVar.card_type}"/>

								<table border="0" class="pvShow text-center" width="100%">
									<tr>
										<td>组织:</td>
										<c:forEach items="${miMembers}" var="subMiMemberVar">
											<c:if test="${subMiMemberVar.link_no==miMemberVar.member_no}">
												<td style="width:50%;">
														${subMiMemberVar.ac_group_sell}
												</td>
											</c:if>
										</c:forEach>
									</tr>
									<tr>
										<td>保留:</td>
										<c:forEach items="${miMembers}" var="subMiMemberVar">
											<c:if test="${subMiMemberVar.link_no==miMemberVar.member_no}">
												<td style="width:50%;">
														${subMiMemberVar.bl_group_pv}
												</td>
											</c:if>
										</c:forEach>
									</tr>
								</table>
							</c:if>
							<c:if test="${miMemberVar.diffNationConceal eq 'Y'}" >
								<h2>
									<i class="fa fa-user-o" aria-hidden="true"></i>
									----------
								</h2>
								<table border="0" class="pvShow text-center" width="100%">
									<tr>
										<td>组织:</td>
										<td style="width:50%;">----------</td>
									</tr>
									<tr>
										<td>保留:</td>
										<td style="width:50%;">----------</td>
									</tr>
								</table>
							</c:if>
							<ul>
								<!-- 检查左右区 -->
								<c:set var="level1HasLeft" value="0"/>
								<c:set var="level1HasRight" value="0"/>
								<c:forEach items="${miMembers}" var="subMiMemberVar">
									<c:if test="${subMiMemberVar.link_no==miMemberVar.member_no && subMiMemberVar.leaf_type==0}">
										<c:set var="level1HasLeft" value="1"/>
									</c:if>
									<c:if test="${subMiMemberVar.link_no==miMemberVar.member_no && subMiMemberVar.leaf_type==1}">
										<c:set var="level1HasRight" value="1"/>
									</c:if>
								</c:forEach>
								<c:if test="${level1HasLeft==0 && miMemberVar.active_status==1 && miMemberVar.exit_status==0}">
									<li>
										<div style="height: 60px; padding-top: 10px;">
											<a title="注册" href="memberRegisterStep1.jhtml?recommendNo=${sessionScope.sessionLoginUser.userCode }&linkNo=${miMemberVar.member_no}&leafType=0">
												<i class="fa fa-plus-square-o fa-3x"></i>
											</a>
										</div>
									</li>
								</c:if>

								<c:forEach items="${miMembers}" var="miMemberVar2">
									<c:if test="${miMemberVar2.level==1 && miMemberVar2.link_no==miMemberVar.member_no}">
										<li>
											<c:if test="${miMemberVar2.diffNationConceal ne 'Y'}" >
												<h2>
													<i class="fa fa-user-o" aria-hidden="true"></i>
														${miMemberVar2.member_no}
												</h2>
												${miMemberVar2.last_name}
												<br/><win:code listCode="member.card.type" value="${miMemberVar2.card_type}"/>

												<table border="0" class="pvShow text-center" width="100%">
													<tr>
														<td>组织:</td>
														<c:forEach items="${miMembers}" var="subMiMemberVar">
															<c:if test="${subMiMemberVar.link_no==miMemberVar2.member_no}">
																<td style="width:50%;">
																		${subMiMemberVar.ac_group_sell}
																</td>
															</c:if>
														</c:forEach>
													</tr>
													<tr>
														<td>保留:</td>
														<c:forEach items="${miMembers}" var="subMiMemberVar">
															<c:if test="${subMiMemberVar.link_no==miMemberVar2.member_no}">
																<td style="width:50%;">
																		${subMiMemberVar.bl_group_pv}
																</td>
															</c:if>
														</c:forEach>
													</tr>
												</table>

												<a class="btn btn-xs btn-success btn-block" href="memberLinkNet.jhtml?memberNo=${miMemberVar2.member_no}">
													<i class="fa fa-angle-double-down" aria-hidden="true"></i>
												</a>
											</c:if>
											<c:if test="${miMemberVar2.diffNationConceal eq 'Y'}" >
												<h2>
													<i class="fa fa-user-o" aria-hidden="true"></i>
													----------
												</h2>
												<table border="0" class="pvShow text-center" width="100%">
													<tr>
														<td>组织:</td>
														<td style="width:50%;">----------</td>
													</tr>
													<tr>
														<td>保留:</td>
														<td style="width:50%;">----------</td>
													</tr>
												</table>
											</c:if>
											<ul>

												<!-- 检查左右区 -->
												<c:set var="level2HasLeft" value="0"/>
												<c:set var="level2HasRight" value="0"/>
												<c:forEach items="${miMembers}" var="subMiMemberVar">
													<c:if test="${subMiMemberVar.link_no==miMemberVar2.member_no && subMiMemberVar.leaf_type==0}">
														<c:set var="level2HasLeft" value="1"/>
													</c:if>
													<c:if test="${subMiMemberVar.link_no==miMemberVar2.member_no && subMiMemberVar.leaf_type==1}">
														<c:set var="level2HasRight" value="1"/>
													</c:if>
												</c:forEach>
												<c:if test="${level2HasLeft==0 && miMemberVar2.active_status==1 && miMemberVar2.exit_status==0 }">
													<li>
														<div style="height: 60px; padding-top: 10px;">
															<a title="注册" href="memberRegisterStep1.jhtml?recommendNo=${sessionScope.sessionLoginUser.userCode }&linkNo=${miMemberVar2.member_no}&leafType=0">
																<i class="fa fa-plus-square-o fa-3x"></i>
															</a>
														</div>
													</li>
												</c:if>

												<c:forEach items="${miMembers}" var="miMemberVar3">
													<c:if test="${miMemberVar3.level==2 && miMemberVar3.link_no==miMemberVar2.member_no}">
														<li>
															<c:if test="${miMemberVar3.diffNationConceal ne 'Y'}" >
																<h2>
																	<i class="fa fa-user-o" aria-hidden="true"></i>
																		${miMemberVar3.member_no}
																</h2>
																${miMemberVar3.last_name}
																<br/><win:code listCode="member.card.type" value="${miMemberVar3.card_type}"/>

																<table border="0" class="pvShow text-center" width="100%">
																	<tr>
																		<td>组织:</td>
																		<c:forEach items="${miMembers}" var="subMiMemberVar">
																			<c:if test="${subMiMemberVar.link_no==miMemberVar3.member_no}">
																				<td style="width:50%;">
																						${subMiMemberVar.ac_group_sell}
																				</td>
																			</c:if>
																		</c:forEach>
																	</tr>
																	<tr>
																		<td>保留:</td>
																		<c:forEach items="${miMembers}" var="subMiMemberVar">
																			<c:if test="${subMiMemberVar.link_no==miMemberVar3.member_no}">
																				<td style="width:50%;">
																						${subMiMemberVar.bl_group_pv}
																				</td>
																			</c:if>
																		</c:forEach>
																	</tr>
																</table>

																<a class="btn btn-xs btn-success btn-block" href="memberLinkNet.jhtml?memberNo=${miMemberVar3.member_no}">
																	<i class="fa fa-angle-double-down" aria-hidden="true"></i>
																</a>
															</c:if>
															<c:if test="${miMemberVar3.diffNationConceal eq 'Y'}" >
																<h2>
																	<i class="fa fa-user-o" aria-hidden="true"></i>
																	<fmt:message key="miMember.haiwaixian"/>
																</h2>
																<table border="0" class="pvShow text-center" width="100%">
																	<tr>
																		<td>组织:</td>
																		<td style="width:50%;">----------</td>
																	</tr>
																	<tr>
																		<td>保留:</td>
																		<td style="width:50%;">----------</td>
																	</tr>
																</table>
															</c:if>
														</li>
													</c:if>
												</c:forEach>

												<c:if test="${level2HasRight==0 && miMemberVar2.active_status==1 && miMemberVar2.exit_status==0 }">
													<li>
														<div style="height: 60px; padding-top: 10px;">
															<a title="注册" href="memberRegisterStep1.jhtml?recommendNo=${sessionScope.sessionLoginUser.userCode }&linkNo=${miMemberVar2.member_no}&leafType=1">
																<i class="fa fa-plus-square-o fa-3x"></i>
															</a>
														</div>
													</li>
												</c:if>
											</ul>
										</li>
									</c:if>
								</c:forEach>

								<c:if test="${level1HasRight==0 && miMemberVar.active_status==1 && miMemberVar.exit_status==0 }">
									<li>
										<div style="height: 60px; padding-top: 10px;">
											<a title="注册" href="memberRegisterStep1.jhtml?recommendNo=${sessionScope.sessionLoginUser.userCode }&linkNo=${miMemberVar.member_no}&leafType=1">
												<i class="fa fa-plus-square-o fa-3x"></i>
											</a>
										</div>
									</li>
								</c:if>
							</ul>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
		</ul>

		<div id="chart">
		</div>

		<br/><br/>

		<SCRIPT type="text/javascript">
            function isEmpty(str){
                if(/^\s*$/g.test(str)){
                    return true;
                }
                return false;
            }

            function validateSearch(theForm) {
                if(theForm.memberNo.value==""){
                    alert("<fmt:message key='pl.plate.memberNo.required'/>.");
                    theForm.memberNo.focus();
                    return false;
                }else if(!isEmpty(theForm.layerId.value)){
                    if(isNaN(theForm.layerId.value)){
                        alert("<fmt:message key="bdBonus.tree.level"/><fmt:message key="register.us.select.number"/>");
                        return false;
                    }
                }
                showLoading();
                return true;
            }

            $(document).ready(function() {
                $("#basic-chart-source").orgChart({container: $("#chart")});
            });

		</SCRIPT>
	</c:when>
	<c:otherwise>
		<form method="post" class="form-inline" action="memberLinkNet.jhtml" onsubmit="return validateForm(this)">
			<fmt:message key="member.inputsecondpwd"/>：
			<input type="password" class="form-control" name="advPassword" placeholder="<fmt:message key="mi.second.pwd"/>"/>
			<button type="submit" class="btn btn-info" name="submit"><fmt:message key="button.submit"/></button>
			<input type="hidden" name="strAction" value="${param.strAction }"/>
		</form>

		<SCRIPT type="text/javascript">
            function validateForm(theForm) {
                if(theForm.advPassword.value==""){
                    confirm("<fmt:message key="member.inputsecondpwd"/>");
                    theForm.advPassword.focus();
                    return false;
                }
                showLoading();
                return true;
            }
		</SCRIPT>
	</c:otherwise>
</c:choose>