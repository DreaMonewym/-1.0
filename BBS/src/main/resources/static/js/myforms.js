/* [ ---- Gebo Admin Panel - extended form elements ---- ] */

	$(document).ready(function() {
	
		
		//* password strength checker
		gebo_pass_check.init();
		
	});

	
	//* password strength checker
	gebo_pass_check = {
		init: function() {
			$("#repassword").complexify({
					minimumChars: '6',
					strengthScaleFactor: '0.8'
				}, function (valid, complexity) {
				if (!valid) {
					$('#pass_progress .bar').css({'width':complexity + '%'}).parent().removeClass('progress-success').addClass('progress-danger');
				} else {
					$('#pass_progress .bar').css({'width':complexity + '%'}).parent().removeClass('progress-danger').addClass('progress-success');
				}
			});
		}
	};
	