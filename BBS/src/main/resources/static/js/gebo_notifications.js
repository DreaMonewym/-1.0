/* [ ---- Gebo Admin Panel - notifications ---- ] */

	$(document).ready(function() {
		gebo_notifications.sticky();
		gebo_notifications.smoke_js();
	});

    gebo_notifications = {
        sticky: function() {
            $('#sticky_a').click(function(e){
                $.sticky("用户或密码错误，请重新输入！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a1').click(function(e){
                $.sticky("用户名不能为空，请重新输入！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a2').click(function(e){
                $.sticky("密码不能为空，请重新输入！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a3').click(function(e){
                $.sticky("重复密码不能为空，请重新输入！", {autoclose :5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a4').click(function(e){
                $.sticky("两次输入密码不一致，请重新输入！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a5').click(function(e){
                $.sticky("必须选择头像！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a6').click(function(e){
                $.sticky("帖子标题不能为空！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a7').click(function(e){
                $.sticky("帖子内容不能为空！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a8').click(function(e){
                $.sticky("请先登录，再发帖，谢谢！！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a9').click(function(e){
                $.sticky("密码的长度不能小于6个字符！！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_a10').click(function(e){
                $.sticky("校验密码的长度不能小于6个字符！！", {autoclose : 5000, position: "top-right", type: "st-error" });
            });
            $('#sticky_d').click(function(e){
                $.sticky("Lorem ipsum dolor sit&hellip;", {autoclose : 5000, position: "top-right" });
            });
            $('#sticky_d_st').click(function(e){
                $.sticky("Lorem ipsum dolor sit&hellip;", {autoclose : false, position: "top-right" });
            });
            $('#sticky_e').click(function(e){
                $.sticky("Lorem ipsum dolor sit&hellip;", {autoclose : 5000, position: "top-right" });
            });
            $('#sticky_f').click(function(e){
                $.sticky("Lorem ipsum dolor sit&hellip;", {autoclose : 5000, position: "top-center" });
            });
            $('#sticky_g').click(function(e){
                $.sticky("Lorem ipsum dolor sit&hellip;", {autoclose : 5000, position: "top-left" });
            });
            $('#sticky_h').click(function(e){
                $.sticky("Lorem ipsum dolor sit&hellip;", {autoclose : 5000, position: "bottom-right" });
            });
            $('#sticky_i').click(function(e){
                $.sticky("Lorem ipsum dolor sit&hellip;", {autoclose : 5000, position: "bottom-left" });
            });
        },
		smoke_js: function() {
			$('#smoke_signal').click(function(e){
                smoke.signal('This goes away after a few seconds...5 seconds, in fact.');
				e.preventDefault();
            });
			$('#smoke_alert').click(function(e){
                smoke.alert('This is a normal alert screen...nothing too fancy.');
				e.preventDefault();
            });
			$('#smoke_confirm').click(function(e){
                tstconfirm();
				e.preventDefault();
            });
			$('#smoke_prompt').click(function(e){
                tstprompt();
				e.preventDefault();
            });
			
			function tstconfirm(){
				smoke.confirm('This is still cool, yeah?',function(e){
					if (e){
						smoke.alert('"yeah it is" pressed', {ok:"close"});
					}else{
						smoke.alert('"no way" pressed', {ok:"close"});
					}
				}, {ok:"yeah it is", cancel:"no way"});
			}
			
			function tstprompt(){
				smoke.prompt('What\'s your name?',function(e){
					if (e){
						smoke.alert('Your name is '+e);
					}else{
						smoke.alert('no');
					}
				},{value:"your name"});
			}		
			
		}
    };