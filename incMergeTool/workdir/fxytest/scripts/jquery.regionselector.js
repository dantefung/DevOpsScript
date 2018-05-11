;
(function($, window, document, undefined) {
	// 定义Beautifier的构造函数
	var existsRegion;
	var districtObj;
	var regionObj;
	var RegionSelector = function(ele, opt) {
		this.$element = ele, this.defaults = {
			'companyCode':'',
			'regionCode':'',
			'startRegionId' : 0,
			'width' : "135px",
			'cssName' : '',
			'mustSelectLast':true,
			'onchanged':null
		}, this.options = $.extend({}, this.defaults, opt)
	}
	// 定义Beautifier的方法
	RegionSelector.prototype = {
		showSelect : function() {
			var _this=this;
			//
			_this.$element.html("");
			//
			districtObj=$("<input name='district' type='hidden'/>");
			regionObj=$("<input name='regionId' type='hidden'/>");
			_this.$element.append(districtObj);
			_this.$element.append(regionObj);
			$.getJSON("/alRegionAjax.jhtml?doType=showExists&companyCode="+_this.options.companyCode+"&regionCode="+_this.options.regionCode,function(result){
				existsRegion=result[0];
				_this.showRegionSelect(_this.options.companyCode,'', _this.options.startRegionId,1);
			});
			return;
		},
		showRegionSelect: function (companyCode, prevRegionId, parentRegionId, level){
			var _this=this;
			var selectorHtml="<select name='regionLevel_"+level+"'";
			selectorHtml+=" id='"+_this.$element.attr("id")+"_"+parentRegionId+"'";
			if(_this.options.width!=""){
				selectorHtml+=" style='width:"+_this.options.width+"'";
			}
			if(_this.options.cssName!=""){
				selectorHtml+=" class='"+_this.options.cssName+"'";
			}
			selectorHtml+="></select>";
			var selectVar=$(selectorHtml);
			selectVar.change(
				function(){
					//删除之后所有的列表框
					$(this).nextAll().remove();
					_this.showRegionSelect(companyCode,parentRegionId, $(this).val(),level+1);
					if(_this.options.onchanged!=null){
						$(this).bind("onchanged",_this.options.onchanged);
						$(this).trigger("onchanged",[$(this),$(this).val()]);
					}
				}
			);
			selectVar.append("<option value=''>---请选择---</option>");
			$.getJSON("/alRegionAjax.jhtml?companyCode="+companyCode+"&parentRegionId="+parentRegionId,function(result){
				if(parentRegionId==""){
					regionObj.val(prevRegionId);
				}else{
					regionObj.val(parentRegionId);
				}
				if(result.length>0){
					var selectedValue;
					$.each(result, function(index, map){
						var tmpHtml="<option value='"+map[0]+"'";
						if(existsRegion!=undefined && existsRegion[map[0]]!=undefined){
							selectedValue=map[0];
						}
						tmpHtml+=">";
				    	selectVar.append(tmpHtml+map[2]+"</option>");
				    });
					_this.$element.append(selectVar);
					if(selectedValue!=undefined && selectedValue!=""){
						selectVar.find("option[value='"+selectedValue+"']").attr("selected",true);
						selectVar.trigger("change");
					}
					districtObj.val('');
				}else if(_this.options.mustSelectLast){
					districtObj.val(parentRegionId);
				}
			});
		},
		refresh:function(companyCode){
			var _this=this;
			_this.$element.html("");
			_this.showSelect();
		}
	}
	// 在插件中使用对象
	$.fn.regionSelector = function(options) {
		// 创建实体
		var selector = new RegionSelector(this, options);
		// 调用其方法
		selector.showSelect();
		return selector;
	}
})(jQuery, window, document);