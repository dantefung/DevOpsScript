// 按钮图标定义
$(function() {
	// 搜索栏
	$("button[name='search']").button({
        icons: {
            primary: "ui-icon-search"
        }
    });
	// Form表单按钮
	$("button[name='save']").button({
        icons: {
            primary: "ui-icon-disk"
        }
    });
	$("button[name='cancel']").button({
        icons: {
            primary: "ui-icon-return"
        }
    });
	$("button[name='delete']").button({
        icons: {
            primary: "ui-icon-trash"
        }
    });
	$("button[name='submit']").button({
        icons: {
            primary: "ui-icon-check"
        }
    });
	$("button[name='mail']").button({
        icons: {
            primary: "ui-icon-mail"
        }
    });
	$("button[name='return']").button({
        icons: {
            primary: "ui-icon-return"
        }
    });
	// 功能栏按钮/链接
	$("a[name='add']",".functionBar").button({
        icons: {
            primary: "ui-icon-add"
        }
    });
	$("a[name='multiDelete']",".functionBar").button({
        icons: {
            primary: "ui-icon-trash"
        }
    });
	$("a[name='check']",".functionBar").button({
        icons: {
            primary: "ui-icon-check"
        }
    });
	$("a[name='uncheck']",".functionBar").button({
        icons: {
            primary: "ui-icon-uncheck"
        }
    });
	$("a[name='submit']",".functionBar").button({
        icons: {
            primary: "ui-icon-submit"
        }
    });
	$("a[name='unsubmit']",".functionBar").button({
        icons: {
            primary: "ui-icon-unsubmit"
        }
    });
	$("a[name='nosubmit']",".functionBar").button({
        icons: {
            primary: "ui-icon-nosubmit"
        }
    });
	$("a[name='refresh']",".functionBar").button({
        icons: {
            primary: "ui-icon-refresh"
        }
    });
	// 列表栏按钮/链接
	$("a[name='edit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-edit"
        },
        text: false
    });
	$("a[name='check']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-check"
        },
        text: false
    });
	$("a[name='uncheck']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-uncheck"
        },
        text: false
    });
	$("a[name='password']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-password"
        },
        text: false
    });
	$("a[name='lock']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-lock"
        },
        text: false
    });
	$("a[name='unlock']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-unlock"
        },
        text: false
    });
	$("a[name='view']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-search"
        },
        text: false
    });
	$("a[name='exit']",".eXtremeTable").button({
        icons: {
        	 primary: "ui-icon-exit"
        },
        text: false
    });
	$("a[name='join']",".eXtremeTable").button({
        icons: {
        	primary: "ui-icon-join"
        },
        text: false
    });
	$("a[name='profile']",".eXtremeTable").button({
        icons: {
        	primary: "ui-icon-profile"
        },
        text: false
    });
	$("a[name='logintool']",".eXtremeTable").button({
        icons: {
        	primary: "ui-icon-logintool"
        },
        text: false
    });
	$("a[name='attachment']",".eXtremeTable").button({
        icons: {
        	primary: "ui-icon-attachment"
        },
        text: false
    });
	/*
	 * $( "button, input:submit, input:button").button({ icons: { primary:
	 * "ui-icon-search" } });
	 */
	/* $( "a", ".demo" ).click(function() { return false; }); */
});

