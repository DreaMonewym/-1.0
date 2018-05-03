<div id="rshow" class="modal hide fade">

	<div class="modal-header">
		<button class="close" data-dismiss="modal"
			onclick="">×</button>
		<h2>
			<span id="span_title"></span>
		</h2>

	</div>
	<div class="modal-body">

		<div class="row-fluid">


			<div class="span12">


				<div id='tab_1'>
					<div id="tab_head"></div>

					<div class="tab-content" id="tab_content"></div>
					
				</div>
			</div>
		</div>


	</div>
	<div class="modal-footer">


            <#if !user??>
			<a class="btn btn-warning" href="#login" title="登录" data-toggle="modal"
				id="myr" data-backdrop="static" title="登录"
				onclick="javascript:$('#rshow').modal('hide');document.getElementById('submenu').innerHTML='登录'">登录
			</a>
			</#if>
		
	
			<input type="hidden" id="rshowid" value="" name="rshowid"/>

            <#if user??>
			<a class="btn btn-info" href="" title="评论" data-toggle="modal"
				id="myr" data-backdrop="static"
				onclick="javascript:addc();document.getElementById('submenu').innerHTML='评论'">评论 </a>
			</#if>
	</div>
</div>



