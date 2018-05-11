<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title><fmt:message key="poOrder.orderBasicInformation"/></title>
    <meta name="heading" content="<fmt:message key='poOrder.orderBasicInformation'/>"/>

</head>

<div class="contentBody">
    <table class="detail" width="50%">

        <tr>
            <td colspan="4" class="title"><fmt:message key="导入规则"/></td>
        </tr>

        <tr>
            <td class=" redBold">1：请选择xls文件！！</td>
        </tr>
        <tr>
            <td class=" ">2：第一行为标题，故不汇入</td>
        </tr>
        <tr>
            <td></td>
        </tr>


        <tr>
            <td colspan="4" class="title"><fmt:message key="导入格式"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <ec:table

                        showPagination="false"
                        showStatusBar="false"
                >
                    <ec:row>
                        <ec:column property="" title="订单号"/>
                        <ec:column property=" " title="物流单号"/>
                        <ec:column property=" " title="物流公司"/>

                    </ec:row>

                </ec:table>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="title"><fmt:message key="选择文件"/></td>
        </tr>
        <form action="importOrder.jhtml" method="post" id="importForm" onsubmit="return validateImport()" enctype="multipart/form-data">
            <tr>


                <td><input type="file" name="importExcel" id="importExcel"></td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="buttonBar">
                        <button name="submit"><fmt:message
                                key="提交"/></button>
                        <button type="button" name="cancel" onclick="location.href='poShips.jhtml?needReload=1'"><fmt:message
                                key="operation.button.return"/></button>
                    </div>
                </td>
            </tr>
        </form>
    </table>
</div>
<script type="text/javascript">
    function validateImport(){
        var file = document.getElementById("importExcel");
        if (file.value == "") {
            alert("请选择要导入的excel文件");
            return false;
        }
        if (file.value.substring(file.value.lastIndexOf(".")) != ".xls") {
            alert("请选择xls文件");
            return false;
        }
        showLoading();
        return true;
    }


</script>