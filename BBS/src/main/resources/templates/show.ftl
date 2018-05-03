<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="cache-control" content="no-cache">
    <title>哈理工贴吧</title>

    <!-- Bootstrap framework -->
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/bootstrap/css/bootstrap-responsive.min.css" />
    <!-- jQuery UI theme -->
    <link rel="stylesheet" href="/lib/jquery-ui/css/Aristo/Aristo.css" />
    <!-- theme color-->
    <link rel="stylesheet" href="/css/blue.css" id="link_theme" />
    <!-- tooltips-->
    <link rel="stylesheet" href="/lib/jBreadcrumbs/css/BreadCrumb.css" />
    <!-- tooltips-->
    <link rel="stylesheet" href="/lib/qtip2/jquery.qtip.min.css" />
    <!-- colorbox -->
    <link rel="stylesheet" href="/lib/colorbox/colorbox.css" />
    <!-- code prettify -->
    <link rel="stylesheet" href="/lib/google-code-prettify/prettify.css" />
    <!-- notifications -->
    <link rel="stylesheet" href="/lib/sticky/sticky.css" />
    <!-- aditional icons -->
    <link rel="stylesheet" href="/img/splashy/splashy.css" />
    <!-- flags -->
    <link rel="stylesheet" href="/img/flags/flags.css" />
    <!-- calendar -->
    <link rel="stylesheet" href="/lib/fullcalendar/fullcalendar_gebo.css" />
    <!-- datepicker -->
    <link rel="stylesheet" href="/lib/datepicker/datepicker.css" />
    <!-- tag handler -->
    <link rel="stylesheet" href="/lib/tag_handler/css/jquery.taghandler.css" />
    <!-- uniform -->
    <link rel="stylesheet" href="/lib/uniform/Aristo/uniform.aristo.css" />
    <!-- multiselect -->
    <link rel="stylesheet" href="/lib/multi-select/css/multi-select.css" />
    <!-- enhanced select -->
    <link rel="stylesheet" href="/lib/chosen/chosen.css" />
    <!-- wizard -->
    <link rel="stylesheet" href="/lib/stepy/css/jquery.stepy.css" />
    <!-- upload -->
    <link rel="stylesheet"
          href="/lib/plupload/js/jquery.plupload.queue/css/plupload-gebo.css" />
    <!-- CLEditor -->
    <link rel="stylesheet" href="/lib/CLEditor/jquery.cleditor.css" />
    <!-- colorpicker -->
    <link rel="stylesheet" href="/lib/colorpicker/css/colorpicker.css" />
    <!-- smoke_js -->
    <link rel="stylesheet" href="/lib/smoke/themes/gebo.css" />



    <!-- main styles -->
    <link rel="stylesheet" href="/css/style.css" />



    <!-- favicon -->
    <link rel="shortcut icon" href="favicon.ico" />

    <link href="/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
          type="text/css" />


    <!-- CKeditor -->


    <script type="text/javascript" src="/js/jquery.cookie.js"></script>


    <!--[if lte IE 8]>
	<link rel="stylesheet" href="/css/ie.css"  />
    <![endif]-->

    <!--[if lt IE 9]>
	<script src="/js/ie/html5.js" ></script>
	<script src="/js/ie/respond.min.js" ></script>
	<script src="/lib/flot/excanvas.min.js" ></script>
    <![endif]-->
    <script>
        //* hide all elements & show preloader
        document.documentElement.className += 'js';
    </script>

    <link rel="stylesheet" href="/editor/themes/default/default.css" />
    <script charset="utf-8" src="/editor/kindeditor-min.js"></script>
    <script charset="utf-8" src="/editor/lang/zh_CN.js"></script>
    <script type="text/javascript">
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                allowFileManager : true
            });

        });
    </script>
</head>

<body class="sidebar_hidden">
<!-- 布局 -->
<#include "layout.ftl">
<div id="maincontainer" class="clearfix">
    <header>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="brand"><i
                            class="icon-home icon-white"></i> 哈理工贴吧 <span class="sml_t"></span></a>



                    <ul class="nav user_menu pull-right">
                        <li class="hidden-phone hidden-tablet">
                            <div class="nb_boxes clearfix">
                                <a data-toggle="modal" data-backdrop="static" href="#login"
                                   class="label ttip_b" title="登录"
                                   onclick="javascript:document.getElementById('submenu').innerHTML='登录'">
                                    <i class="splashy-calendar_week"></i>
                                </a>
                            </div>


                        </li>


                        <li class="divider-vertical hidden-phone hidden-tablet"></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                data-toggle="dropdown">

                            <#if user??>
                                <img src="user?action=pic&id=${user.userid}" alt="请登录" class="user_avatar" />
                               ${user.username}
                            <#else>
                                <img src="img/user_avatar.png" alt="请登录" class="user_avatar" />
                                游客
                            </#if>


                            <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a data-toggle="modal" id="my"
                                       data-backdrop="static"
                                       href="#login" title="登录"
                                       onclick="javascript:document.getElementById('submenu').innerHTML='登录'">登录
                                </a></li>
                                <li><a data-toggle="modal" id="my" data-backdrop="static"
                                       href="#register" title="注册"
                                       onclick="javascript:document.getElementById('submenu').innerHTML='注册'">注册</a>


                                </li>

                            <#if user??>
                                <li><a href="#post" title="发帖" data-toggle="modal"
                                       id="myp" data-backdrop="static"
                                       onclick="javascript:addz();document.getElementById('submenu').innerHTML='发帖'">发帖</a>



                                </li>
                            </#if>



                                <li class="divider"></li>
                                <li><a href="user?action=out"
                                       onclick="javascript:document.getElementById('submenu').innerHTML=''">退出当前用户</a></li>
                            </ul></li>
                    </ul>

                </div>
            </div>
        </div>



        <!-- 发帖 ,和回复贴,回复贴展示-->












        <!-- 登录 -->


        <!-- 注册 -->


	<#include "login.ftl">

	<#include "register.ftl">

    </header>
    <!-- 显示帖子列表,浏览主贴时显示，浏览回帖时不显示 -->

<#include "rshow.ftl">

<#include "table.ftl">
<#include "post.ftl">

</div>



<script src="js/jquery.min.js" charset="utf-8"></script>
<script src="lib/jquery-ui/jquery-ui-1.8.23.custom.min.js"></script>
<!-- touch events for jquery ui-->
<script src="js/forms/jquery.ui.touch-punch.min.js"></script>
<!-- easing plugin -->
<script src="js/jquery.easing.1.3.min.js"></script>
<!-- smart resize event -->
<script src="js/jquery.debouncedresize.min.js"></script>
<!-- js cookie plugin -->
<script src="js/jquery.cookie.min.js"></script>
<!-- main bootstrap js -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- bootstrap plugins -->
<script src="js/bootstrap.plugins.min.js"></script>
<!-- code prettifier -->
<script src="lib/google-code-prettify/prettify.min.js"></script>
<!-- sticky messages -->
<script src="lib/sticky/sticky.min.js"></script>
<!-- tooltips -->
<script src="lib/qtip2/jquery.qtip.min.js"></script>
<!-- lightbox -->
<script src="lib/colorbox/jquery.colorbox.min.js"></script>
<!-- jBreadcrumbs -->
<script src="lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min.js"></script>
<!-- hidden elements width/height -->
<script src="js/jquery.actual.min.js"></script>
<!-- scroll -->
<script src="lib/antiscroll/antiscroll.js"></script>
<script src="lib/antiscroll/jquery-mousewheel.js"></script>
<!-- fix for ios orientation change -->
<script src="js/ios-orientationchange-fix.js"></script>
<!-- to top -->
<script src="lib/UItoTop/jquery.ui.totop.min.js"></script>
<!-- mobile nav -->
<script src="js/selectNav.js"></script>

<!-- common functions -->
<script src="js/gebo_common.js"></script>


<!-- datatable -->
<script src="lib/datatables/jquery.dataTables.min.js"></script>
<!-- additional sorting for datatables -->
<script src="lib/datatables/jquery.dataTables.sorting.js"></script>
<script src="js/gebo_notifications.js" charset="GBK"></script>
<!-- masked inputs -->
<script src="js/forms/jquery.inputmask.min.js"></script>

<script src="lib/complexify/jquery.complexify.min.js"></script>
<!-- form functions -->
<script src="js/myforms.js"></script>


<!-- tables functions -->
<script>
    /* [ ---- Gebo Admin Panel - tables ---- ] */

    $(document).ready(function() {
        //* datatable must be rendered first
        gebo_galery_table.init();

    });

    //* gallery table view
    gebo_galery_table = {
        init : function() {
            $('#dt_gal')
                    .dataTable(
                            {
                                "sDom" : "<'row'<'span6'<'dt_actions'>l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
                                "sPaginationType" : "bootstrap",
                                "bPaginate" : false,//不分页
                                "aaSorting" : [ [ 0, "asc" ] ],//默认的方式：从第0列开始,以第4列倒序排列
                                "oLanguage" : {
                                    "sProcessing" : "正在加载中......",
                                    "sLengthMenu" : "每页显示 _MENU_ 条记录",
                                    "sZeroRecords" : "对不起，查询不到相关数据！",
                                    "sEmptyTable" : "表中无数据存在！",
                                    "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                                    "sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
                                    "sSearch" : "搜索"
                                },
                                "bFilter" : false,
                                "aoColumns" : [ {
                                    "bSortable" : "string"
                                }, {
                                    "bSortable" : false
                                }, {
                                    "sType" : "string"
                                }, {
                                    "sType" : "string"
                                }, {
                                    "sType" : "eu_date"
                                }, {
                                    "bSortable" : false
                                } ]
                            });
            $('.dt_actions').html($('.dt_gal_actions').html());
        }
    };
</script>



<script>
    $(document)
            .ready(
                    function() {
                        //* jQuery.browser.mobile (http://detectmobilebrowser.com/)
                        //* jQuery.browser.mobile will be true if the browser is a mobile device
                        (function(a) {
                            jQuery.browser.mobile = /android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i
                                            .test(a)
                                    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i
                                            .test(a.substr(0, 4))
                        })(navigator.userAgent || navigator.vendor
                                || window.opera);
                        //replace themeforest iframe
                        if (jQuery.browser.mobile) {
                            if (top !== self)
                                top.location.href = self.location.href;
                        }
                        //* show all elements & remove preloader
                        setTimeout('$("html").removeClass("js")', 1000);

                    });
</script>
<script type="text/javascript">
    $(function() {
        var username = $.cookie('papaoku'); // 获得cookie
        var password = $.cookie('papaokp');

        $('#username').val(username);//设置文本框
        $('#password').val(password);
        //选中
        $("input[name='sun']").attr("checked", "checked");

    });

    function login() {
        if (document.all.username.value == '') {

            document.getElementById("sticky_a1").click();
            return;
        }
        if (document.all.password.value == '') {

            document.getElementById("sticky_a2").click();
            return;
        }

        document.all.login_form.submit();

    }
    //删除从贴
    function del(id,rootid,duid) {

        $.ajax({
            type: "post",
            url: "article",
            data:"action=delc&id="+id+"&rootid="+rootid,
            dataType: "text json",
            statusCode : {
                200:function(data){
                    //刷新从贴
                    showhuitie($("#postrootid").val(),$('#userid').val(),duid,data);
                }

            }
        });
    }
    //灌贴和回帖保存内容
    function add() {
        //得到回帖内容数据
        //var txt=CKEDITOR.instances.content.getData();
		var txt=editor.html();


        if ($('#title').val() =='') {

            document.getElementById("sticky_a6").click();
            return;
        }

        if (txt =='') {

            document.getElementById("sticky_a7").click();
            return;
        }


        //获取textarea的值  ,赋值到hidden
        $('#content').val(txt);

        // document.all.addarticle.neirong.value=txt;

        if( $('#userid').val()==""){//没有登录

            document.getElementById("sticky_a8").click();
            return;
        }
        //新帖使用正常表单提交，回帖使用ajax异步
        if($("#postrootaction").val()==='reply'){//回帖使用异步，否则不能定位到model
            $.ajax({
                type: "post",
                url: "article",
                data:"action=reply&title="+$('#title').val()+"&content="+txt+"&rootid="+$("#postrootid").val()+"&userid="+$('#userid').val(),
                dataType: "text json",
                success : function(data){
                    //能回帖的肯定是同一用户，所以uid和duid相等
                    //先退出发帖窗体，在显示回帖查询model

                    $('#rshow').modal('show');
                    $('#post').modal('hide');
                    showhuitie($("#postrootid").val(),$('#userid').val(),$('#userid').val(),data);
                }

            });

        }
        //发主贴
        if($("#postrootaction").val()==='add'){//主帖
            $('#addarticle').submit();

        }



    }
    //content为内容组件的名字
    /*CKEDITOR.replace('content',{
        filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
        filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?type=Images',
        filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?type=Flash',
        filebrowserUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
        filebrowserImageUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
        filebrowserFlashUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
    });*/

    //执行发主贴窗体
    function addz() {

        $("#postrootid").val(0);
        //发主帖标志
        $('#postrootaction').val('add');
        $("#title").val("");
        $("#content").val("");
    }

    //执行发子贴窗体
    function addc() {

        //回子帖标志，对$("#postrootid")的赋值，在rshow方法里面
        $("#postrootaction").val("reply");
        $('#rshow').modal('hide');
        //清空title和content两个控件
        $('#title').val("");
        //CKEDITOR.instances.content.setData(' ');//清空内容框内容
		//editor.html("");
        $('#post').modal('show');

    }
    //在model上显示回帖
    /*
        //id主贴
        //uid:浏览用户id
        //duid:发本帖的用户id
        //显示回帖,用AJAX技术
        data:从异步返回来的json
    */
    function showhuitie(id,uid,duid,data){
        $('#tab_head').empty();
        $('#tab_content').empty();
        $('#tab_foot').empty();
        var head="";
        var content="";

        var footer="";


        $(data.list).each(function(i){
            //var info = comment.root;
            //遍历rshow页的<div id="tab_head">
            //和<div id="tab_content">内容
            // alert('ppp');
            // $('#tab_head').append('<span>'+data.list[i].title+'</span>');


            //增加删除重贴按钮,浏览用户和本帖用户相同的情况下，才能删除

            if(uid===duid||uid==data.list[i].user.userid){//字符串是否相等,删除从贴
                footer="<div id='foot"+i+"' > "+
                        "	<a class='btn btn-danger'  href='#' "+
                        "onclick='javascript:del("+data.list[i].id+","+data.list[i].rootid+","+duid+")'>删除 </a>"+

                        "</div> ";

            }else{

                footer="<div > "+

                        "</div> ";
            }


            //增加帖子的标题，在tab上
            if(i == 0){
                //标记上第一个值能够被激活显示
                head=head+

                        "<li class='active' ><a href='#tab_l"+i+"' data-toggle='tab'>"+data.list[i].title+"</a></li>";
            }else{
                head=head+

                        "<li><a href='#tab_l"+i+"' data-toggle='tab'>"+data.list[i].title+"</a></li>";
            }




            //增加帖子的内容，在tab上

            if(i==0){
                content=content+"<div class='tab-pane active' id='tab_l"+i+"'> "+footer+" <br/> <p>"+data.list[i].content+"</p>"+" </div>";

            }else{
                content=content+"<div class='tab-pane' id='tab_l"+i+"'> "+footer+" <br/> <p>"+data.list[i].content+"</p>"+" </div>";

            }





            $('#span_title').html(data.title);//添加主贴标题










        });



        $('#tab_head').append("<ul class='nav nav-tabs' >"+head+"</ul>");
        $('#tab_content').append(content);

    }

    //显示回帖的ajax
    function rshow(id,uid,duid) {
        //id主贴 uid:浏览用户  duid:本帖id
        //显示回帖,用AJAX技术
        //把该帖子的id值付给rshow model下的隐藏字段
        $("#rshowid").val(id);
        //把该主帖子的id值付给post model下的隐藏字段，代表该贴是子贴
        $("#postrootid").val(id);

        $.ajax({
            type: "post",
            url: "article",
            data:"action=queryid&id="+id,
            dataType: "text json",
            statusCode : {
                200:function(data){

                    //刷新从贴
                    showhuitie(id,uid,duid,data);
                }

            }
//            success : function(data){
//
//                //显示回帖内容，并且显示在model窗体中
//                showhuitie(id,uid,duid,data);
//
//            }
        });


    }
    function upload() {
        if (document.all.fileinput.value == '') {


            return;
        }
        document.all.File_form.submit();

    }
    function register() {


        if (document.all.reusername.value == '') {

            document.getElementById("sticky_a1").click();
            return;
        }
        if (document.all.repassword.value == '') {

            document.getElementById("sticky_a2").click();
            return;
        }

        if (document.all.repassword.value.length <6) {

            document.getElementById("sticky_a9").click();
            return;
        }
        if (document.all.rerepassword.value == '') {

            document.getElementById("sticky_a3").click();
            return;
        }
        if (document.all.rerepassword.value.length <6) {

            document.getElementById("sticky_a10").click();
            return;
        }

        if (document.all.rerepassword.value != document.all.repassword.value) {

            document.getElementById("sticky_a4").click();
            return;
        }


        var file;
        //取得FileList取得的file集合

        //file对象为用户选择的某一个文件
        //type name
        if(document.getElementById("file0").files.length==0){
            document.getElementById("sticky_a5").click();
            return ;
        }




        document.all.File_form.submit();


    }


</script>



<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push([ '_setAccount', 'UA-32339645-1' ]);
    _gaq.push([ '_trackPageview' ]);

    (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl'
                        : 'http://www')
                + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>
<!-- 加载头像，并显示 -->
<script type="text/javascript">
    $("#file0").change(function(){


        var objUrl = getObjectURL(this.files[0]) ;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#portrait").attr("src", objUrl) ;
        }
    }) ;
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;

        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>

<!-- 选项卡Button操作  -->
<script type="text/javascript">
    $(document).ready(function() {


        var rtab = $('[name="rtab"]:radio');
        rtab.click(function(){
            var value=$(this).attr("value");   //取值
            if(value.indexOf('right')!=-1){//右

                $("#tab").removeClass().addClass("tabbable tabs-right");

            }
            if(value.indexOf('left')!=-1){//左

                $("#tab").removeClass().addClass("tabbable tabs-left");

            }
            if(value.indexOf('top')!=-1){//上
                $("#tab").removeClass().addClass("tabbable");
            }
        });

    });
</script>
</body>
</html>






