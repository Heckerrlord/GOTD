app.controller("order-ctrl", function ($scope, $http) {
    var url ="/rest/order";
    $scope.roles = [];
    $scope.items = [];
    $scope.form = {};

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    $scope.initialize = function (trangThai) {
        $http.get(url, { params: { tt: trangThai } })
            .then(function(response) {
                $scope.items = response.data;
            })
            .catch(function(error) {
                console.error('Lỗi khi lấy dữ liệu đơn hàng', error);
            });
    }

    //khoi dau
    $scope.initialize(0);



    //hien thi len form


    $scope.xacNhan = function (item) {
        item.tongTien = parseFloat(item.tongTien) + parseFloat(item.phiGiaoHang);
        item.trangThai = 1;
        $http.put(`${url}/${item.id}`, item).then(resp => {
            sweetalert("Cập nhật chất liệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật chất liệu!");
            console.log("Error", error);
        });
    }
    $scope.tuChoi = function (item) {
        item.tongTien = parseFloat(item.tongTien) + parseFloat(item.phiGiaoHang);;
        item.trangThai = 2;
        $http.put(`${url}/${item.id}`, item).then(resp => {
            sweetalert("Cập nhật chất liệu thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật chất liệu!");
            console.log("Error", error);
        });
    }




    //phan trang
    $scope.pager = {
        page: 0,
        size: 10,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.items.length / this.size)
        },
        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }

});