'use strict'

myapp.controller('CarOrderCtrl', function($scope, $log, $window, $http, $state, $timeout, codeService){

	var init = function(){
		$scope.modal = {
			"title": "添加",
			"type": "0"
		}
		
		$scope.parkinfo = {
			"carOrderId":"",
			"carId": "",
			"userId": "",
			"type": 0,
			"status": 0
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
				$http.post('carOrder/getEntitys', {}).then(function(response){
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
                    data : "carId"
                },
				{
					data : "userId"
				},
				{
					data : function(row){
						var type = row.type;
						return type == "0"? "求租" : (type == "1"? "出租" : "");
					}
				},
				{
					data : function(row){
						var status = row.status;
						return status == "0"? "待审核" : (status == "1"? "出租中" : "租赁失败");
					}
				},
				{
					data : function(row){
						if(row.status == "0"){
							var htmlStr = '<span class="btn btn-info btn-sm" style="margin-left:3px;" name="info">审核</span>';
						}
						
						htmlStr = '<span class="btn btn-primary btn-sm" name="del">删除</span>' + htmlStr;
						return htmlStr;
					}
				}
			]
		});

	}, 0);

    
    
	
    $scope.save = function(){
    	console.log($scope.parkinfo);
    	var type = $scope.modal.type;
    	var url = type == '0' ? 'carOrder/save' : 'carOrder/update';
    	$http.post(url, $scope.parkinfo).then(function(response){
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
        
        for(var key in $scope.parkinfo){
        	$scope.parkinfo[key] = rowData[key];
        }
        console.log($scope.parkinfo);
        $("#myModal").modal("show");
    });
});
