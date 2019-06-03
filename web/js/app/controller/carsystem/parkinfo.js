'use strict'

myapp.controller('ParkInfoCtrl', function($scope, $log, $window, $http, $state, $timeout, $rootScope){

	var init = function(){
		$scope.modal = {
			"title": "添加",
			"type": "0"
		}
		
		$scope.parkinfo = {
			"parkId":"",
			"parkNo": "",
			"message": "",
			"monthPrice": 0,
			"dayPrice": 0,
			"status": -1
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
				$http.post('parkInfo/getEntitys', $scope.parkinfo).then(function(response){
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
                    data : "parkNo"
                },
				{
					data : "message"
				},
				{
					data : "monthPrice"
				},
				{
					data : "dayPrice"
				},
				{
					data : function(row){
						var status = row.status;
						return status == "0"? "空闲" : (status == "1"? "被预定" : "被占用");
					}
				},
				{
					data : function(row){
						var htmlStr = '<span class="btn btn-info btn-sm" style="margin-left:3px;" name="del">删除</span>';
						
						if(row.status == "1" && $rootScope.appUserInfo.type == "0"){
							htmlStr = '<span class="btn btn-primary btn-sm" style="margin-left:3px; name="info">审核</span>' + htmlStr;
						}
						
						if($rootScope.appUserInfo.type == "1" && row.status == "0"){
							htmlStr = '<span class="btn btn-primary btn-sm" name="order">预定</span>' + htmlStr;
						}
						return htmlStr;
					}
				}
			]
		});

	}, 0);

    
    $scope.add = function(){
    	$("#myModal").modal("show");
    }
    
    
	
    $scope.save = function(){
//    	console.log($scope.parkinfo);
    	var type = $scope.modal.type;
    	var url = type == '0' ? 'parkInfo/save' : 'parkInfo/update';
    	$http.post(url, $scope.parkinfo).then(function(response){
    		console.log(response);
    		init();
    		oTbl.ajax.reload();
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
        
        for(var key in $scope.parkinfo){
        	$scope.parkinfo[key] = rowData[key];
        }
//        console.log($scope.parkinfo);
        $("#myModal").modal("show");
    });
    
    $("#tbl tbody").on('click', 'span[name="del"]', function(e){
        var rowData = oTbl.row($(e.target).parents("tr")).data();
        if(rowData.status != "0"){
        	alert("该车位正在使用中,无法删除")
        }else{
        	$http.post('parkInfo/delete', {"parkId": rowData.parkId}).then(function(response){
        		oTbl.ajax.reload();
        		alert("车位删除成功")
			}, function(err){
				alert("数据加载请求异常");
			});
        }
        
    });
    
    $("#tbl tbody").on('click', 'span[name="order"]', function(e){
        var rowData = oTbl.row($(e.target).parents("tr")).data();
        
        $http.post("parkOrder/save", $scope.parkinfo).then(function(response){
		}, function(err){
			alert("数据加载请求异常");
		});
    });
    
    $scope.query = function(){
    	console.log($scope.parkinfo);
    	oTbl.ajax.reload();
    };
    
    $scope.clear = function(){
    	init();
    	oTbl.ajax.reload();
    };
 
});
