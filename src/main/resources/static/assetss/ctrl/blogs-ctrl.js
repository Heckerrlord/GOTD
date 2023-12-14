app.controller("blogs-ctrl", function ($scope, $http) {
    var url = "/rest/blogs";
    var url2 = "/rest/upload/images";
    $scope.items = [];
    $scope.cates = [];
    $scope.form = {};

    $scope.blogs = null


    $scope.listBlogs = function (){
        $http.get(url+'/getAll').then(function (resp){
            $scope.blogs = resp.data;
            console.log("thu thao nee " + $scope.blogs)
        });
    }
    $scope.listBlogs()





    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    //xoa form
    $scope.reset = function () {
        $scope.form = {

        }
        ;
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
            sweetalert("Đăng bài thành công!");
            $scope.listBlogs()
        }).catch(error => {
            sweetalert("Lỗi đăng bài!");
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
            sweetalert("Cập nhật bài viết thành công!");
            $scope.listBlogs()
        }).catch(error => {
            sweetalert("Lỗi cập nhật bài viết!");
            console.log("Error", error);
        });
    }

    $scope.updatett = function (item) {
        // var item = angular.copy($scope.form);
        $http.put(`${url}/updatett/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.reset();
            sweetalert("Lưu trữ bài viết thành công!");
            $scope.listBlogs()
        }).catch(error => {
            sweetalert("Lỗi lưu trữ bài viết!");
            console.log("Error", error);
        });
    }

    $scope.updatett1 = function (item) {
        // var item = angular.copy($scope.form);
        $http.put(`${url}/updatett1/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.reset();
            sweetalert("Khôi phục bài viết thành công!");
            $scope.listBlogs()
        }).catch(error => {
            sweetalert("Lỗi khôi phục bài viết!");
            console.log("Error", error);
        });
    }
    //xoa sp
    $scope.delete = function (item) {
        $http.delete(`${url}/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            sweetalert("Xóa bài viết thành công!");
            $scope.listBlogs()
        }).catch(error => {
            sweetalert("Lỗi xóa bài viết!");
            console.log("Error", error);
        });
    }

    //upload hinh
    $scope.imageChanged = function (files) {
        var data = new FormData();
        data.append('file', files[0]);
        $http.post(url2, data, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.form.image = resp.data.name;
        })
    }
    function resetModal() {
        // Đặt giá trị rỗng cho các trường input, textarea và img trong modal
        $('#user-form-modal input[name="title"]').val('');
        $('#user-form-modal textarea[name="content"]').val('');
        $('#user-form-modal img').attr('src', '');
    }
});