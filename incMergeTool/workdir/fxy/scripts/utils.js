var bCancel = false;

/**
 * 获取并返回一组checkbox中被选中的值
 * @param objectsArray
 * @returns 被选中的值，如: a,b,c
 */
function getCheckedBoxesValue(objectsArray) {
	var tmpValue = new Array();
	var j = 0;
	for(var i=0;i<objectsArray.length;i++){
		if (objectsArray[i].checked) {
			tmpValue[j] = objectsArray[i].value;
			j++;
		}
	}
	return tmpValue.join();
}

/**
 * 获取jquery.ztree-3.2中所选取的节点的值,以逗号分隔
 * @param treeObj jquery.ztree-3.2树对象
 * @returns 被选中的值，如: a,b,c
 */
function getCheckedNodesValueFromTree(treeObj){
	var nodes = treeObj.getCheckedNodes();
	var tmpValue = new Array();
	if(nodes!=undefined && nodes.length>0){
		for(var i=0;i<nodes.length;i++){
			tmpValue[i] = nodes[i].id;
		}
	}
	return tmpValue.join();
}

/**
 * 刷新验证码图片
 * @param imageId 图片ID
 */
function refreshCaptchaImage(imageId){     
    var imgSrc = $("#"+imageId);     
    var srcTemp = imgSrc.attr("src").split("=");
    //时间戳     
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳     
    var timestamp = (new Date()).valueOf();     
    imgSrc.attr("src",srcTemp[0]+"="+timestamp);
}

var digitArray = new Array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');

function toHex( n ) {
	var result = '';
	var start = true;
	
	for ( var i=32; i>0; ) {
		i -= 4;
		var digit = ( n >> i ) & 0xf;
		if (!start || digit != 0) {
		    start = false;
		    result += digitArray[digit];
		}
	}
	
	if(result == ''){
		return '0';
	}else{
		if(result.length==7){
			return '0'+result;
		}else{
			return result;
		}
	}
}

/**
 * @param filePathName
 *            文件名称,包括路径名
 * @return String 小写的后缀名,如.jpg;如果没有,则返回空
 */
function getFileType(filePathName){
	var pos = filePathName.lastIndexOf(".");
	if(pos==-1){
		return "";
	}else{
		return filePathName.substring(pos,filePathName.length).toLowerCase();  
		// 此处文件后缀名也可用数组方式获得str.split(".")
	}
}

//准备等待对象
var loading;
/*
 * $(function() { try{ //loading=new ol.loading({id:"mainPage"}); }catch(err){ }
 * });
 */

/**
 * 显示等待层
 */
function showLoading(){
	// loading.show();
	$.blockUI({
		message:null,
		overlayCSS: { 
			backgroundColor: "#fff",
			opacity: 0.6
		}
	});
}
/**
 * 隐藏等待层
 */
function hideLoading(){
	// loading.hide();
	$(document).ajaxStop($.unblockUI);
}
/**
 * 确认是否删除
 * 
 * @param theForm
 * @param obj
 * @returns {Boolean}
 */
function confirmDelete(theForm, obj) {
	if (confirm(confirmDeleteMsg)) {
		theForm.strAction.value = "delete" + obj;
		return true;
	} else {
		return false;
	}
}
/**
 * 确认是否提交
 * 
 * @param theForm
 * @param obj
 * @returns {Boolean}
 */
function confirmSubmit(theForm, strAction) {
	if (confirm(confirmSubmitMsg)) {
		theForm.strAction.value = strAction;
		return true;
	} else {
		return false;
	}
}

function showSelfAlert(msg){
	$("#divAlertModalContent").html(msg);
	$('#divAlertModal').modal('show');
	setTimeout(function(){
		closeSelfAlert();
    },2000);
}

function closeSelfAlert(){
	$('#divAlertModal').modal('hide');
}

/*
 * Project: Twitter Bootstrap Hover Dropdown
 * Author: Cameron Spear
 * Contributors: Mattia Larentis
 *
 * Dependencies?: Twitter Bootstrap's Dropdown plugin
 *
 * A simple plugin to enable twitter bootstrap dropdowns to active on hover and provide a nice user experience.
 *
 * No license, do what you want. I'd love credit or a shoutout, though.
 *
 * http://cameronspear.com/blog/twitter-bootstrap-dropdown-on-hover-plugin/
 */
;(function($, window, undefined) {
    // outside the scope of the jQuery plugin to
    // keep track of all dropdowns
    var $allDropdowns = $();

    // if instantlyCloseOthers is true, then it will instantly
    // shut other nav items when a new one is hovered over
    $.fn.dropdownHover = function(options) {

        // the element we really care about
        // is the dropdown-toggle's parent
        $allDropdowns = $allDropdowns.add(this.parent());

        return this.each(function() {
            var $this = $(this).parent(),
                defaults = {
                    delay: 500,
                    instantlyCloseOthers: true
                },
                data = {
                    delay: $(this).data('delay'),
                    instantlyCloseOthers: $(this).data('close-others')
                },
                options = $.extend(true, {}, defaults, options, data),
                timeout;

            $this.hover(function() {
                if(options.instantlyCloseOthers === true)
                    $allDropdowns.removeClass('open');

                window.clearTimeout(timeout);
                $(this).addClass('open');
            }, function() {
                timeout = window.setTimeout(function() {
                    $this.removeClass('open');
                }, options.delay);
            });
        });
    };

    $('[data-hover="dropdown"]').dropdownHover();
})(jQuery, this);

/** 
 * 将数值四舍五入(保留2位小数)后格式化成金额形式 
 * 
 * @param num 数值(Number或者String) 
 * @return 金额格式的字符串,如'1,234,567.45' 
 * @type String 
 */  
function formatCurrency(num) {  
    num = num.toString().replace(/\$|\,/g,'');  
    if(isNaN(num))  
    num = "0";  
    sign = (num == (num = Math.abs(num)));  
    num = Math.floor(num*100+0.50000000001);  
    cents = num%100;  
    num = Math.floor(num/100).toString();  
    if(cents<10)  
    cents = "0" + cents;  
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
    num = num.substring(0,num.length-(4*i+3))+','+  
    num.substring(num.length-(4*i+3));  
    return (((sign)?'':'-') + num + '.' + cents);  
}  
   
/** 
 * 将数值四舍五入(保留1位小数)后格式化成金额形式 
 * 
 * @param num 数值(Number或者String) 
 * @return 金额格式的字符串,如'1,234,567.4' 
 * @type String 
 */  
function formatCurrencyTenThou(num) {  
    num = num.toString().replace(/\$|\,/g,'');  
    if(isNaN(num))  
    num = "0";  
    sign = (num == (num = Math.abs(num)));  
    num = Math.floor(num*10+0.50000000001);  
    cents = num%10;  
    num = Math.floor(num/10).toString();  
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
    num = num.substring(0,num.length-(4*i+3))+','+  
    num.substring(num.length-(4*i+3));  
    return (((sign)?'':'-') + num + '.' + cents);  
}  
  
// 添加金额格式化  
jQuery.extend({  
    formatFloat:function(src, pos){  
        var num = parseFloat(src).toFixed(pos);  
        num = num.toString().replace(/\$|\,/g,'');  
        if(isNaN(num)) num = "0";  
        sign = (num == (num = Math.abs(num)));  
        num = Math.floor(num*100+0.50000000001);  
        cents = num%100;  
        num = Math.floor(num/100).toString();  
        if(cents<10) cents = "0" + cents;  
        for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
        num = num.substring(0,num.length-(4*i+3))+','+num.substring(num.length-(4*i+3));  
        return (((sign)?'':'-') + num + '.' + cents);  
    }  
});  
