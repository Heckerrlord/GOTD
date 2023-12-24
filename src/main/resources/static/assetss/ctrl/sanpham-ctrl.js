app.controller("sanpham-ctrl", function ($scope, $http,$timeout) {
    var url = "/rest/sanPham";
    var url2 = "/rest/upload/images";
    $scope.items = [];
    $scope.cates = [];
    $scope.form = {};
    $scope.imageInputs = [];

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    $scope.initialize = function () {
        $http.get(url).then(function (resp) {
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
                    buttons: ['excel', 'pdf', 'print']
                });
                table.buttons().container().appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
            }, 0);
        });
    };

// Gọi hàm initialize khi controller được tải
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
            sweetalert("Thêm mới sản phẩm!");
        }).catch(error => {
            sweetalert("Lỗi thêm mới sản phẩm!");
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
            sweetalert("Cập nhật sản phẩm thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật sản phẩm!");
            console.log("Error", error);
        });
    }


    //xoa sp
    $scope.delete = function (item) {
        $http.delete(`${url}/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            sweetalert("Xóa sản phẩm thành công!");
        }).catch(error => {
            sweetalert("Lỗi xóa sản phẩm!");
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

    //hinh anh



    $scope.addImage = function() {
        $scope.imageInputs.push({ file: null, preview: '/assetss/img/img.png' });
    };

    $scope.previewImage = function(imageInput) {
        const input = imageInput.file;

        if (input && input[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                // Update imageInput.preview with the data URL
                $scope.$apply(function() {
                    imageInput.preview = e.target.result;
                });
            };
            reader.readAsDataURL(input[0]);
        }
    };



});