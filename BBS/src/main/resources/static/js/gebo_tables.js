/* [ ---- Gebo Admin Panel - tables ---- ] */

	$(document).ready(function() {
		//* datatable must be rendered first
        gebo_galery_table.init();
        
	});

	
	
	
       
	
    //* gallery table view
    gebo_galery_table = {
        init: function() {
			$('#dt_gal').dataTable({
				"sDom": "<'row'<'span6'<'dt_actions'>l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
				"sPaginationType": "bootstrap",
				"bPaginate": false,//不分页
                "aaSorting": [[ 2, "asc" ]],
                "oLanguage": {
                    "sProcessing": "正在加载中......",
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "对不起，查询不到相关数据！",
                    "sEmptyTable": "表中无数据存在！",
                    "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                    "sSearch": "搜索",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": "末页"
                    }},
                    "bFilter": false,
				"aoColumns": [
					{ "bSortable": false },
					{ "bSortable": false },
					{ "sType": "string" },
					{ "sType": "formatted-num" },
					{ "sType": "eu_date" },
					{ "bSortable": false }
				]
			});
           $('.dt_actions').html($('.dt_gal_actions').html());
        }
    };