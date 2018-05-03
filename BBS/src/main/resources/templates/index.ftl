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
</head>
<body class="sidebar_hidden">

<div id="loading_layer" style="display: none">
    <img src="/img/ajax_loader.gif" alt="" />
</div>
<div class="style_switcher">
    <div class="sepH_c">
        <p>选择标题颜色:</p>
        <div class="clearfix">
            <a href="javascript:void(0)"
               class="style_item jQclr blue_theme style_active" title="blue">蓝色</a>
            <a href="javascript:void(0)" class="style_item jQclr dark_theme"
               title="dark">黑色</a> <a href="javascript:void(0)"
                                      class="style_item jQclr green_theme" title="green">绿色</a> <a
                href="javascript:void(0)" class="style_item jQclr brown_theme"
                title="brown">brown</a> <a href="javascript:void(0)"
                                           class="style_item jQclr eastern_blue_theme" title="eastern_blue">eastern
            blue</a> <a href="javascript:void(0)"
                        class="style_item jQclr tamarillo_theme" title="tamarillo">tamarillo</a>
        </div>
    </div>
    <div class="sepH_c">
        <p>选择背景纹理:</p>
        <div class="clearfix">
            <span class="style_item jQptrn style_active ptrn_def" title=""></span>
            <span class="ssw_ptrn_a style_item jQptrn" title="ptrn_a"></span> <span
                class="ssw_ptrn_b style_item jQptrn" title="ptrn_b"></span> <span
                class="ssw_ptrn_c style_item jQptrn" title="ptrn_c"></span> <span
                class="ssw_ptrn_d style_item jQptrn" title="ptrn_d"></span> <span
                class="ssw_ptrn_e style_item jQptrn" title="ptrn_e"></span>
        </div>
    </div>
    <div class="sepH_c">
        <p>布局:</p>
        <div class="clearfix">
            <label class="radio inline"><input type="radio"
                                               name="ssw_layout" id="ssw_layout_fluid" value="" checked /> 流动布局</label> <label
                class="radio inline"><input type="radio" name="ssw_layout"
                                            id="ssw_layout_fixed" value="gebo-fixed" /> 固定布局</label>
        </div>
    </div>

    <div class="sepH_c">
        <p>菜单显示方式</p>
        <div class="clearfix">
            <label class="radio inline"><input type="radio"
                                               name="ssw_menu" id="ssw_menu_click" value="" checked /> 点击</label> <label
                class="radio inline"><input type="radio" name="ssw_menu"
                                            id="ssw_menu_hover" value="menu_hover" /> 悬浮</label>
        </div>
    </div>
    <div class="sepH_c">
        <p>选项卡方向选择：</p>
        <div class="clearfix btns_state">
            <label
                    class="radio inline">
                <input type="radio" checked="checked" value="top" id="rtab" name="rtab"/>
                上显示
            </label>
            <label
                    class="radio inline">
                <input type="radio" value="left"  id="rtab" name="rtab"/>
                左显示
            </label>
            <label
                    class="radio inline">
                <input type="radio" value="right" id="rtab" name="rtab"/>
                右显示
            </label>


        </div>
    </div>
    <div class="gh_button-group"></div>
    <div class="hide">
        <ul id="ssw_styles">
            <li class="small ssw_mbColor sepH_a" style="display: none">body
                {<span class="ssw_mColor sepH_a" style="display: none">
					color: #<span></span>;
			</span> <span class="ssw_bColor" style="display: none">background-color:
					#<span></span>
			</span>}
            </li>
            <li class="small ssw_lColor sepH_a" style="display: none">a {
                color: #<span></span> }
            </li>
        </ul>
    </div>
</div>


</body>
</html>







