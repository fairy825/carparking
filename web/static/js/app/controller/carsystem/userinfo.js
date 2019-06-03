'use strict'

myapp.controller('UserInfoCtrl', function($scope, $log, $window, $http, $state, $timeout, codeService){

	var init = function(){
		$scope.modal = {
			"title": "添加",
			"type": "0"
		}
		
		$scope.userinfo = {
			"userId":"",
			"userName": "",
			"phone": "",
			"type": -1,
			"password": ""
		};
	};
	
	init();
	
    var oTbl;
    $timeout(function(){
		oTbl = $("#tbl").DataTable({
			"ajax" : function (data, callback, settings) {
				//封装请求参数

				var returnData = {};
				returnData.recordsTotal = 0;//返回数据全部记录
				returnData.recordsFiltered = 0;//后台不实现过滤功能，每次查询均视作全部结果
				returnData.data = [];//返回的数据列表
				$http.post('userInfo/getEntitys', $scope.userinfo).then(function(response){
//					console.log(response);
					var data = response.data;
					returnData.recordsTotal = data.length;//返回数据全部记录
					returnData.recordsFiltered = data.length;//后台不实现过滤功能，每次查询均视作全部结果
					returnData.data = data;//返回的数据列表
					// $log.info(resultData);
					callback(returnData);
				}, function(err){
					alert("数据加载请求异常");
				});
			},
			"serverSide": true,
			"language":$scope.datatables_lang,  //提示信息
			"renderer": "bootstrap",  //渲染样式：Bootstrap和jquery-ui
			"pagingType": "full_numbers",  //分页样式：simple,simple_numbers,full,full_numbers
			"bFilter": true,
			"bSort": false,
            /*"scrollX": true,*/
			"fnInitComplete": function (oSettings, json) {

			},
			"columns": [
				{
					data : function(row){
						return '<label class="i-checks"><input type="checkbox" value=""><i></i></label>';
					}
				},
                {
                    data : "userName"
                },
				{
					data : "phone"
				},
				{
					data : function(row){
						var type = row.type != null ? row.type : "";
						type = type == "0" ? "系统用户" : (type == "1" ? "普通用户" : "未知")
						return type;
					}
				},
				{
					data : "createTime"
				},
				{
					data : function(row){
						var htmlStr = '<span class="btn btn-info btn-sm" style="margin-left:3px;" name="info">编辑</span>';
						if(row.verifyStatus == "1"){
							htmlStr = '<span class="btn btn-primary btn-sm" name="del">删除</span>' + htmlStr;
						}
						return htmlStr;
					}
				}
			]
		});

	}, 10);

    
    $scope.add = function(){
    	$("#myModal").modal("show");
    }
    
    
	
    $scope.save = function(){
//    	console.log($scope.userinfo);
    	var type = $scope.modal.type;
    	var url = type == '0' ? 'userInfo/save' : 'userInfo/update';
    	$http.post(url, $scope.userinfo).then(function(response){
    		console.log(response);
    		oTbl.ajax.reload();
    		init();
    		$("#myModal").modal("hide");
		}, function(err){
			alert("数据加载请求异常");
		});
    }
    
    $("#tbl tbody").on('click', 'span[name="info"]', function(e){
        var rowData = oTbl.row($(e.target).parents("tr")).data();
//        console.log(rowData);
        $scope.modal = {
    			"title": "编辑",
    			"type": "1"
    	}
        
        for(var key in $scope.userinfo){
        	$scope.userinfo[key] = rowData[key];
        }
//        console.log($scope.userinfo);
        $("#myModal").modal("show");
    });
    
    $scope.query = function(){
//    	console.log($scope.userinfo);
    	oTbl.ajax.reload();
    };
    
    $scope.clear = function(){
    	init();
    	oTbl.ajax.reload();
    }
});
