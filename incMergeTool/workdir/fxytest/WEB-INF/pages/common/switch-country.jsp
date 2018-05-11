<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="modal fade" id="countryModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"><fmt:message key="sysManager.countryCode.required"/></h4>
			</div>
			<div class="modal-body switch-country-body">
				<div class="container-fluid">
					<div class="row" id="countryArea"></div>
				</div>
			</div>
			<div class="modal-footer" style="text-align: left;">
				<fmt:message key="register.notice"/>：<fmt:message key="label.choose.country.notice"/>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
	<c:if test="${empty sessionScope.sessionLoginUser.shopCompanyCode || sessionScope.sessionLoginUser.shopCompanyCode=='CN'}">	
	$(document).ready(function(){
		$('#countryModal').modal(
			{
				show:true,
				backdrop:'static',
				keyboard: false
			}
		);
	});
	</c:if>
	
	$('#countryModal').on('show.bs.modal', function (e) {
		var button = $(e.relatedTarget);
		if(button!=undefined && button.attr("id")=="switchLangLink"){
			$("#countryArea").html("");
			$(".modal-title").text("<fmt:message key="register.language.select"/>");
			$(".modal-footer").css("display","none");
			$.getJSON("${ctx}/alLangAjax.jhtml", {}, function(json){
				var childRegionStr="";
				if(json!=null && json.length>0){
					for(var i=0;i<json.length;i++){
						childRegionStr+="<div class='col-md-4'>";
						if(json[i][0]=="${sessionScope.sessionLoginUser.locale}"){
							childRegionStr+="<span class='redFont'>";
							childRegionStr+=json[i][1];
							childRegionStr+="</span>";
						}else{
							childRegionStr+="<a href=\"<c:url value='/index.jhtml'/>?l="+json[i][0]+"\">";
							childRegionStr+=json[i][1];
							childRegionStr+="</a>";
						}
						
						childRegionStr+="</div>";
					}
				}
				$("#countryArea").html(childRegionStr);
			});
		}else{
			$("#countryArea").html("");
			$(".modal-title").text("<fmt:message key="sysManager.countryCode.required"/>");
			$(".modal-footer").css("display","");
			$.getJSON("${ctx}/alRegionAjax.jhtml", {parentRegionId:"0"}, function(json){
				var childRegionStr="";
				if(json!=null && json.length>0){
					for(var i=0;i<json.length;i++){
						childRegionStr+="<div class='col-md-4'>";
						if(json[i][1]=="${sessionScope.sessionLoginUser.shopCompanyCode}"){
							childRegionStr+="<span class='redFont'>";
							childRegionStr+=json[i][2];
							childRegionStr+="</span>";
						}else{
							childRegionStr+="<a href=\"<c:url value='/index.jhtml'/>?c="+json[i][1]+"\">";
							childRegionStr+=json[i][2];
							childRegionStr+="</a>";
						}
						childRegionStr+="</div>";
					}
				}
				$("#countryArea").html(childRegionStr);
			});
		}
	});
</script>