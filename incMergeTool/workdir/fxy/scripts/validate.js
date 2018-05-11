/*去除空格*/
function trim(str){
	return str.replace(/^\s+|\s+$/g, '');
}

/**
* IP
**/
function isIP(s) {
	var patrn=/^((1?\d?\d|(2([0-4]\d|5[0-5])))\.){3}(1?\d?\d|(2([0-4]\d|5[0-5])))$/;
	return patrn.test(s);
}

/**
*是否是完整的正则表达式
*只有开始标记与结束标记相匹配才为TRUE
*HTML Tag
*/
function isHtmlTag(s){
	var patrn = /^<(.*)>.*<\/\1>|<(.*) \/>$/;
	return patrn.test(s);
}

/**
*中文
*/
function isChineseString(s){
	var patrn = /^[\u4e00-\u9fa5]+$/
	return patrn.test(s);
}
/**
*双字节
*/
function isDoubleByteString(s){
	var patrn = /^[^x00-xff]+$/;
	return patrn.test(s);
}
/**
*是否包含首尾空格，如果包含，返回TRUE
*/
function hasHESpace(s){
	var patrn = /^\s+|\s+$/;
	return patrn.test(s);
}

/**
*是否闰年
**/
function isLeapYear(y){
	return (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
}

/**
*日期
*yyyy-mm-dd格式或yyyy/mm/dd格式，年用两位表示亦可
*Regex author:Michael Ash
*支持1600年以后
*/
function isDateYMD(s){
	var patrn = /^(?:(?:(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(\/|-|\.)(?:0?2\1(?:29)))|(?:(?:(?:1[6-9]|[2-9]\d)?\d{2})(\/|-|\.)(?:(?:(?:0?[13578]|1[02])\2(?:31))|(?:(?:0?[1,3-9]|1[0-2])\2(29|30))|(?:(?:0?[1-9])|(?:1[0-2]))\2(?:0?[1-9]|1\d|2[0-8]))))$/;
	return patrn.test(s);
}
/**
*日期
*dd-mm-yyyy格式或dd/mm/yyyy格式，年用两位表示亦可
*Regex author:Marco Storti
*支持1600年以后
*/
function isDateDMY(s){
	var patrn = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
	return patrn.test(s);
}
/**
*日期
*mm-dd-yyyy格式或mm/dd/yyyy格式，年用两位表示亦可
*Regex author:Michael Ash
*支持1600年以后
*/
function isDateMDY(s){
	var patrn =  /^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[13-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
	return patrn.test(s);
}
/**
*日期时间：M/d/y hh:mm:ss
*Regex author:Michael Ash
*支持1600年以后
*/
function isDateTimeMDY(s){
	var patrn = /^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
	return patrn.test(s);
}
/**
*日期时间 yyyy/mm/dd hh:mm:ss 或 yyyy-mm-dd hh:mm:ss
*Date Regex author:Michael Ash
*Modified by Shaw Sunkee
*支持1600年以后
*/
function isDateTimeYMD(s){
	var patrn = /^(?:(?:(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(\/|-|\.)(?:0?2\1(?:29)))|(?:(?:(?:1[6-9]|[2-9]\d)?\d{2})(\/|-|\.)(?:(?:(?:0?[13578]|1[02])\2(?:31))|(?:(?:0?[1,3-9]|1[0-2])\2(29|30))|(?:(?:0?[1-9])|(?:1[0-2]))\2(?:0?[1-9]|1\d|2[0-8]))))[ ]([0-1]?[0-9]|[2][0-3]):([0-5]?[0-9]):([0-5]?[0-9])$/;;
	return patrn.test(s);
}
/**
*时间
*hh:mm:ss 24小时制 0 ~ 23 hour
*/
function isTime(s){
	var patrn = /^([0-1]?[0-9]|[2][0-3]):([0-5]?[0-9]):([0-5]?[0-9])$/;
	return patrn.test(s);
}

/**
*	是否包含非特殊字符(正常字符包括字母数字，下划线，和点号，空格，@#$% 和双字节)
*	若包含，返回 true
*/
var validation_specialChars = new Array('\'','\"','\n','\r','\t',';',':','=','<','>',',','|','\\','<','>','/','^','~','`');
function containsSpecialChar(str){
	for(var i = 0;i<validation_specialChars.length;i++){
		if(str.indexOf(validation_specialChars[i]) > -1){
			return true;
		}
	}
	return false;
}

/**字母串
*	两种调用方式：
*	一种是一个参数，传入要验证的值
*	二种是带三个参数，第二和第三个参数分别代表最小长度和最大长度
*/
function isLetter(){
	return judgePattrnAndLen("[A-Za-z]",arguments);
}

/**
*	大写字母
*	两种调用方式：
*	一种是一个参数，传入要验证的值
*	二种是带三个参数，第二和第三个参数分别代表最小长度和最大长度
*/
function isUpperLetter(){
	return judgePattrnAndLen("[A-Z]",arguments);
}
/**
*	小写字母
*	两种调用方式：
*	一种是一个参数，传入要验证的值
*	二种是带三个参数，第二和第三个参数分别代表最小长度和最大长度
*/
function isLowerLetter(){
	return judgePattrnAndLen("[a-z]",arguments);
}
/**数字与字符串*/
function isLetterNumString(){
	return judgePattrnAndLen("[A-Za-z0-9]",arguments);
}
/**数字，字母，下划线字符串*/
function isLNUString(s){
	return judgePattrnAndLen("\\w",arguments);
}

//验证日期, 不兼容Firefox
function javaValidDate(mydt){
	var mydate = '' ; mytime = ''
	var tmp,dttmp

	if (mydt.indexOf(" ") == -1) { 
		mydate = mydt
	}else{
		dttmp = mydt.split(" ")
		mydate = dttmp[0]
		if (dttmp[1]) { mytime = dttmp[1] }
	}
	
	
	//************* check date
	mydate = mydate.replace("-","/")
	mydate = mydate.replace("-","/")

	var dttmp = mydate.split("/")
	
	if( dttmp.length != 3 ){ return false }
	mydate = new Date(mydate)
	if( isNaN(mydate) ){ return false }

	tmp = mydate.getYear()
	if(tmp < 100){ tmp = tmp + 1900}
	if(tmp > 2099){ return false}
	if(dttmp[0] != tmp){ return false }

	if(dttmp[1] != mydate.getMonth()+1){ return false }
	if(dttmp[2] != mydate.getDate()){ return false }
	
	//********* datetime is valid
	if ('' == mytime) { return true }

	//************* check time
	
	var dttmp = mytime.split(":")
	if (dttmp.length > 3) { return false }
	if (dttmp.length >= 1){
		tmp = dttmp[0]
		if (isNaN(tmp) || tmp == '') { return false }
		tmp = parseInt(tmp)
		if (tmp < 0 || tmp > 24){ return false }
	}
	if (dttmp.length >= 2){
		tmp = dttmp[1]
		if (isNaN(tmp) || tmp == '') { return false }
		tmp = parseInt(tmp)
		if (tmp < 0 || tmp > 60){ return false }
	}
	if (dttmp.length == 3){
		tmp = dttmp[2]
		if (isNaN(tmp) || tmp == '') { return false }
		tmp = parseInt(tmp)
		if (tmp < 0 || tmp > 60){ return false }
	}
	
	//********* datetime is valid
	return true
}

	//判断字符串是否是有效的日期格式
//日期的正确格式：2004-09-15 2004/09/15 20040915
//separator:分隔符
function isValidDateFormat(objStr,separator){
	var dateExp;
	//var dateArray;
	switch(separator){
		case "-":
			dateExp=/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/;
			break;
		case "/":
			dateExp=/^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})$/;
			break;
		default:
			dateExp=/^([0-9]{4})([0-9]{2})([0-9]{2})$/;
			break;	
	}
	if(dateExp.test(objStr)){
		var dateArray = objStr.match(dateExp);
		var year = dateArray[1];
		var month = dateArray[2];
		var day = dateArray[3];
		if(month<1 || month>12) return false;
		if(day<1 || day>31) return false;
		if((month==4 || month==6 || month==9 || month==11) && day>30) return false;//平月最大日期为30
		if(month==2){
			if(isLeapYear(year) && day>29) return false;//闰年2月最大29
			if(!isLeapYear(year) && day>28) return false;//平年2月最大28
		}
		return true;			
	}
	return false;			
}

/**Emai*/
function isEmail(s){
	var patrn = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	return patrn.test(s);
}

//检查是否为任意数（实数）  
function   isNumeric(strNumber)   {  
	var   newPar=/^(-|\+)?\d+(\.\d+)?$/  
	return   newPar.test(strNumber);  
}  
//检查是否为正数  
function   isUnsignedNumeric(strNumber)   {  
	var   newPar=/^\d+(\.\d+)?$/  
	return   newPar.test(strNumber);  
}  
//检查是否为整数  
function   isInteger(strInteger)   {  
	var   newPar=/^(-|\+)?\d+$/  
	return   newPar.test(strInteger);  
}  
//检查是否为正整数  
function   isUnsignedInteger(strInteger)   {  
	var   newPar=/^\d+$/  
	return   newPar.test(strInteger);  
}
//检查是否全为大写字母
function isAllUpperLetter(str){
	var newPar=/^[A-Z]+$/;
	return newPar.test(str);
}

//检查是否为可用用户帐号:所有包含一个以上的字母、数字或下划线的字符串
function isValidateUserCode(str){
	var newPar=/^[a-zA-Z0-9]+$/;
	return newPar.test(str);
}

function isValidatePassword(str){
	var newPar=/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i; 
	return str.length>=8 && str.length<=16;
}

/**
 * 判断是否合法手机号码
 * @param s
 * @returns {Boolean}
 */
function isMobile(s){
	return (isUnsignedInteger(s)&&(s.length==11));
}