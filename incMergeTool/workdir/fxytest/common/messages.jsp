<%-- 错误信息 --%>
<c:if test="${not empty errors}">
	<div class="alert alert-danger alert-dismissible fade in error">
	    <ul>
	        <c:forEach var="error" items="${errors}">
	            <li>${error}</li>
	        </c:forEach>
	    </ul>
    </div>
    <c:remove var="errors"/>
</c:if>

<%-- 成功信息 --%>
<c:if test="${not empty successMessages}">
	<div class="alert alert-info alert-dismissible fade in notice">
		<ul>
	        <c:forEach var="msg" items="${successMessages}">
	            <li>${msg}</li>
	        </c:forEach>
	    </ul>
    </div>
    <c:remove var="successMessages" scope="session"/>
</c:if>
