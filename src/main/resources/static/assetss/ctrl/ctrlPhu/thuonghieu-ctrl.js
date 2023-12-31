app.controller("thuonghieu-ctrl", function ($scope, $http) {
    var url = "/rest/thuonghieu";
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
            $timeout(function () {
                // Đây là nơi bạn khởi tạo DataTables và niceScroll
                $(".boxscroll").niceScroll({
                    cursorborder: "",
                    cursorcolor: "#eff3f6",
                    boxzoom: true
                });
                $('#datatable').DataTable();
                var table = $('#datatable-buttons').DataTable({
                    lengthMenu: [
                        [10, 25, 50, -1],
                        [10, 25, 50, 'All']
                    ],
                    pagingType: 'full_numbers',
                    lengthChange: false,
                    buttons: ['excel', 'pdf', 'print',  'copyHtml5']
                });
                table.buttons().container().appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
            }, 0);
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

    $scope.editForm = {};

    $scope.openEditModal = function(item) {
        // Gán dữ liệu cần chỉnh sửa vào biến editForm
        $scope.editForm = angular.copy(item); // Sử dụng angular.copy để sao chép dữ liệu mà không ảnh hưởng đến dữ liệu ban đầu

        // Hiển thị modal khi người dùng nhấp vào nút chỉnh sửa
        $('#editModal').modal('show');
    };


    //them sp moi
    $scope.create = function () {
        var item = angular.copy($scope.form);
        $http.post(`${url}`, item).then(resp => {
            $scope.items.push(resp.data);
            $scope.reset();
            sweetalert("Thêm mới thương hiệu!");
        }).catch(error => {
            sweetalert("Lỗi thêm mới thương hiệu!");
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
            sweetalert("Cập nhật thương hiệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật thương hiệu!");
            console.log("Error", error);
        });
    }

    //xoa sp
    $scope.delete = function (item) {
        $http.delete(`${url}/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            sweetalert("Xóa thương hiệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi xóa thương hiệu!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.doiTT = function (item) {
        item.tt = 0;
        $http.put(`${url}/${item.id}`, item).then(resp => {
            $scope.reset();
            sweetalert("Cập nhật thương hiệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật thương hiệu!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.doiTT2 = function (item) {
        item.tt = 1;
        $http.put(`${url}/${item.id}`, item).then(resp => {
            $scope.reset();
            sweetalert("Cập nhật thương hiệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật thương hiệu!");
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
        }).catch(error => {
            sweetalert("Lỗi tải lên hình ảnh!");
            console.log("Error", error);
        })
    }

    //phan trang
    //    $scope.pager = {
    //        page: 0,
    //        size: 10,
    //        get items() {
    //            var start = this.page * this.size;
    //            return $scope.items.slice(start, start + this.size);
    //        },
    //        get count() {
    //            return Math.ceil(1.0 * $scope.items.length / this.size)
    //        },
    //        first() {
    //            this.page = 0;
    //        },
    //        prev() {
    //            this.page--;
    //            if (this.page < 0) {
    //                this.last();
    //            }
    //        },
    //        next() {
    //            this.page++;
    //            if (this.page >= this.count) {
    //                this.first();
    //            }
    //        },
    //        last() {
    //            this.page = this.count - 1;
    //        }
    //    }

});