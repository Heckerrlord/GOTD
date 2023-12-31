app.controller("chatlieu-ctrl", function ($scope, $http) {
    var url = "/rest/chatlieu";
    var url2 = "/rest/upload/images";
    $scope.items = [];
    $scope.cates = [];
    $scope.form = {};

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    $scope.initialize = function () {
        //load product
        $http.get(url).then(resp => {
            $scope.items = resp.data;
        });
    }

    //khoi dau
    $scope.initialize();

    //xoa form
    $scope.reset = function () {
        $scope.form = {
            image: 'cloud-upload.jpg',
        };
    }

    //hien thi len form
    $scope.edit = function (item) {
        $scope.form = angular.copy(item);
        $(".nav-tabs a:eq(0)").tab('show');
    }

    //them sp moi
    $scope.create = function () {
        var item = angular.copy($scope.form);
        $http.post(`${url}`, item).then(resp => {
            $scope.items.push(resp.data);
            $scope.reset();
            sweetalert("Thêm mới chất liệu!");
        }).catch(error => {
            sweetalert("Lỗi thêm mới chất liệu!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.update = function () {
        var item = angular.copy($scope.form);
        $http.put(`${url}/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.reset();
            sweetalert("Cập nhật chất liệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật chất liệu!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.doiTT = function (item) {
        item.tt = 0;
        $http.put(`${url}/${item.id}`, item).then(resp => {
            $scope.reset();
            sweetalert("Cập nhật chất liệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật chất liệu!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.doiTT2 = function (item) {
        item.tt = 1;
        $http.put(`${url}/${item.id}`, item).then(resp => {
            $scope.reset();
            sweetalert("Cập nhật chất liệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật chất liệu!");
            console.log("Error", error);
        });
    }

    //xoa sp
    $scope.delete = function (item) {
        $http.delete(`${url}/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            sweetalert("Xóa chất liệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi xóa chất liệu!");
            console.log("Error", error);
        });
    }

    //upload hinh
    $scope.imageChanged = function (files) {
        var data = new FormData();
        data.append('file', files[0]);
        $http.post(url2, data, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).then(resp => {
            $scope.form.image = resp.data.name;
        }).catch(error => {
            sweetalert("Lỗi tải lên hình ảnh!");
            console.log("Error", error);
        })
    }
});