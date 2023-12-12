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

    $scope.openModal = function (item) {
        $scope.selectedOrder = angular.copy(item);
        $('#orderDetailModal').modal('show');
    };
    $scope.closeModal = function () {
        $('#orderDetailModal').modal('hide'); // Đóng modal
    };
    $scope.formatDate = function(dateString) {
        var date = new Date(dateString);
        var formattedDate = ('0' + date.getHours()).slice(-2) + ':' +
            ('0' + date.getMinutes()).slice(-2) + ' ' +
            ('0' + date.getDate()).slice(-2) + '/' +
            ('0' + (date.getMonth() + 1)).slice(-2) + '/' +
            date.getFullYear();
        return formattedDate;
    };



    //hien thi len form


    $scope.xacNhan = function (item) {
        item.tongTien = parseFloat(item.tongTien) + parseFloat(item.phiGiaoHang);
        item.trangThai = 1;
        $http.put(`${url}/update/${item.id}`, item).then(resp => {
            sweetalert("Đơn hàn đã được xác nhận!");
        }).catch(error => {
            sweetalert("Lỗi khi cập nhật trạng thái đơn hàng!");
            console.log("Error", error);
        });
    }
    $scope.tuChoi = function (item) {
        item.tongTien = parseFloat(item.tongTien) + parseFloat(item.phiGiaoHang);
        item.trangThai = 2;
        $http.put(`${url}/update/${item.id}`, item).then(resp => {
            sweetalert("Đơn hàng đã bị từ chối!");
        }).catch(error => {
            sweetalert("Lỗi khi cập nhật trạng thái đơn hàng !");
            console.log("Error", error);
        });
    }
    $scope.giaoHang = function (item) {
        item.tongTien = parseFloat(item.tongTien) + parseFloat(item.phiGiaoHang);
        item.trangThai = 3;
        $http.put(`${url}/update/${item.id}`, item).then(resp => {
            sweetalert("Đơn hàng đã được giao cho đơn vị vận chuyển !");
        }).catch(error => {
            sweetalert("Lỗi khi cập nhật trạng thái đơn hàng!");
            console.log("Error", error);
        });
    }
    $scope.hoanThanh = function (item) {
        item.tongTien = parseFloat(item.tongTien) + parseFloat(item.phiGiaoHang);
        item.trangThai = 4;
        $http.put(`${url}/update/${item.id}`, item).then(resp => {
            sweetalert("Đơn hàng đã hoàn thành ! ");
        }).catch(error => {
            sweetalert("Lỗi khi cập nhật trạng thái đơn hàng!");
            console.log("Error", error);
        });
    }


    $.doiHang = function (item){

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