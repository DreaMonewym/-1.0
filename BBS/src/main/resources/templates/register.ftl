<div class="modal hide fade" id="register">
				<div class="modal-header">
					<button class="close" data-dismiss="modal"
					 onclick="">×</button>
					<h2>注册用户</h2>


				</div>
				<div class="modal-body" data-backdrop="static">

					<div class="cnt_b">
						<form method="post" action="user" name="File_form"
							method="post" enctype="multipart/form-data" id="File_form">
							<div class="formRow">
								<div class="control-group formSep">
									<div class="alert alert-info">
											
										
										<div class="controls">
											<div data-fileupload="image"
												class="fileupload fileupload-new">
												<div style="width: 60px; height: 60px;"
													class="fileupload-new thumbnail">
													<img src="upload/cuy.jpg" name="portrait" id="portrait"
														alt="请选择自己的头像" />

												</div>
												<div style="width: 80px; height: 80px; line-height: 80px;"
													class="fileupload-preview fileupload-exists thumbnail">

												</div>

												<span class="btn btn-file"> <span
													class="fileupload-new">*选择头像</span> <span
													class="fileupload-exists">更换</span> <input type="file"
													id="file0" name="file0" class="uni_style" />

															<strong>仅支持JPG、PNG、GIF、BMP格式.</strong>
												</span> 
												
												
											</div>
										</div>
									</div>

								</div>

							</div>

							<div class="formRow">
								<div class="control-group formSep">

									<div class="controls">
										<div class="alert alert-info">
											<label for="u_fname" class="control-label">注册账号</label> <input
												type="text" id="u_fname" name="reusername"
												class="input-xlarge" value="WYM" /> <strong>账号*</strong>
											请认真填写！
										</div>


									</div>
								</div>
							</div>
							<div class="formRow">
								<div class="control-group formSep">

									<div class="controls">
										<div class="alert alert-info">
											<label for="u_fname" class="control-label">注册密码*</label>
											
	
												<div class="row-fluid">
													<div class="span10">
														<input type="password" placeholder="密码最少6位" 
														class="span9" 
														id="repassword"  name="repassword"/>
														<strong>密码*</strong>最少6位，最大100位，请认真填写！
														<div id="pass_progress" 
														class="progress progress-danger" 
														style="width:60%">
															
															<div class="bar" style="width: 0"></div>
														</div>
													</div>
												</div>
											
											


										</div>



									</div>
								</div>
							</div>


							<div class="formRow">
								<div class="control-group formSep">

									<div class="controls">
										<div class="alert alert-info">
											<label for="u_fname" class="control-label">再次输入密码*</label>
											<div class="sepH_b">
												<input type="password" name="rerepassword" id="rerepassword"
													class="input-xlarge" value="" /> <strong>两次输入密码</strong>必须一致！
											</div>


										</div>




									</div>
								</div>
							</div>
						</form>
					</div>



					<div class="modal-footer">
						<button class="btn btn-inverse pull-right" type="button"
							onclick="register()">注册</button>

					</div>

				</div>
			</div>

    