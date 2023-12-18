app.controller("order-ctrl", function ($scope, $http,$timeout) {
    var url = "/rest/order";
    $scope.roles = [];
    $scope.items = [];
    $scope.form = {};
    $scope.thanhPho = [];
    $scope.huyen = [];
    $scope.xa = [];
    $scope.form = {
        ten: '',
        thanhpho: '',
        huyen: ''
    };

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    $scope.initialize = function (trangThai) {
        // Gọi API hoặc lấy dữ liệu tương ứng cho từng bảng dựa vào trạng thái (trangThai) được truyền vào
        // Sử dụng các biến $scope.items1, $scope.items2, $scope.items3 để lưu trữ dữ liệu cho từng bảng

        $http.get(url, { params: { tt: trangThai } })
            .then(function (response) {
                if (trangThai === 0) {
                    $scope.items = response.data;

                    $timeout(function () {
                        $(".boxscroll").niceScroll({
                            cursorborder: "",
                            cursorcolor: "#eff3f6",
                            boxzoom: true
                        });
                        $('#datatable-buttons-1').DataTable().destroy();
                        var table = $('#datatable-buttons-1').DataTable({
                            pagingType: 'full_numbers',
                            lengthChange: false,
                            buttons: ['excel', 'pdf', 'print']
                        });
                        table.buttons().container().appendTo('#datatable-buttons-1_wrapper .col-md-6:eq(0)');
                    }, 0);
                } else if (trangThai === 1) {
                    $scope.items1 = response.data;
                    $timeout(function () {
                        $(".boxscroll").niceScroll({
                            cursorborder: "",
                            cursorcolor: "#eff3f6",
                            boxzoom: true
                        });
                        $('#datatable-buttons-2').DataTable().destroy();
                        var table = $('#datatable-buttons-2').DataTable({
                            pagingType: 'full_numbers',
                            lengthChange: false,
                            buttons: ['excel', 'pdf', 'print']
                        });
                        table.buttons().container().appendTo('#datatable-buttons-2_wrapper .col-md-6:eq(0)');
                    }, 0);

                } else if (trangThai === 2) {
                    $scope.items2 = response.data;
                    $timeout(function () {
                        $(".boxscroll").niceScroll({
                            cursorborder: "",
                            cursorcolor: "#eff3f6",
                            boxzoom: true
                        });
                        $('#datatable-buttons-3').DataTable().destroy();
                        var table = $('#datatable-buttons-3').DataTable({
                            pagingType: 'full_numbers',
                            lengthChange: false,
                            buttons: ['excel', 'pdf', 'print']
                        });
                        table.buttons().container().appendTo('#datatable-buttons-3_wrapper .col-md-6:eq(0)');
                    }, 0);
                }
                else if (trangThai === 3) {
                    $scope.items3 = response.data;
                    $timeout(function () {
                        $(".boxscroll").niceScroll({
                            cursorborder: "",
                            cursorcolor: "#eff3f6",
                            boxzoom: true
                        });
                        $('#datatable-buttons-4').DataTable().destroy();
                        var table = $('#datatable-buttons-4').DataTable({
                            pagingType: 'full_numbers',
                            lengthChange: false,
                            buttons: ['excel', 'pdf', 'print']
                        });
                        table.buttons().container().appendTo('#datatable-buttons-4_wrapper .col-md-6:eq(0)');
                    }, 0);
                }
                else if (trangThai === 4) {
                    $scope.items4 = response.data;
                    $timeout(function () {
                        $(".boxscroll").niceScroll({
                            cursorborder: "",
                            cursorcolor: "#eff3f6",
                            boxzoom: true
                        });
                        $('#datatable-buttons-5').DataTable().destroy();
                        var table = $('#datatable-buttons-5').DataTable({
                            pagingType: 'full_numbers',
                            lengthChange: false,
                            buttons: ['excel', 'pdf', 'print']
                        });
                        table.buttons().container().appendTo('#datatable-buttons-5_wrapper .col-md-6:eq(0)');
                    }, 0);

                }

            })
            .catch(function (error) {
                console.error('Lỗi khi lấy dữ liệu đơn hàng', error);
            });
    };



    //khoi dau
    $scope.initialize(0);

    $scope.xoaKhoiDonHang = function (id) {
        $http.post(`${url}/delete/` + id).then(resp => {
            for (var i = 0; i < $scope.selectedOrder.chiTietDonHangList.length; i++) {
                if ($scope.selectedOrder.chiTietDonHangList[i].id === id) {
                    $scope.selectedOrder.chiTietDonHangList.splice(i, 1);
                    break;
                }
            }
            sweetalert("Đã xóa khỏi giỏ hàng!");
            if ($scope.selectedOrder.chiTietDonHangList.length==0){
                $scope.tuChoi($scope.selectedOrder);
            }
        }).catch(error => {
            sweetalert("Lỗi khi cập nhật trạng thái đơn hàng!");
            console.log("Error", error);
        });
    }
    $scope.openModal = function (item) {
        $scope.selectedOrder = angular.copy(item);
        console.log("$scope.selectedOrder ", $scope.selectedOrder)
        $scope.getAddress();
        $('#orderDetailModal').modal('show');

    };

    $scope.getAddress = function () {
        var selectedOption = $scope.thanhPho.find(function (option) {
            return option.name === $scope.selectedOrder.tinh;
        });
        // Nếu tìm thấy, đặt giá trị của model ($scope.form.thanhpho) để kích hoạt binding AngularJS
        if (selectedOption) {
            setTimeout(function () {
                $("#thanhpho").val(selectedOption.code).addClass('selected');
                $scope.changeThanhPho();
            }, 100);
        }
        if (selectedOption) {
            setTimeout(function () {
                var huyenOption = $scope.huyen.find(function (option) {
                    return option.name === $scope.selectedOrder.huyen;
                });
                if (huyenOption) {
                    setTimeout(function () {
                        $("#huyen").val(huyenOption.code).addClass('selected');
                        $scope.changeHuyen();
                        setTimeout(function () {
                            var xaOption = $scope.xa.find(function (option) {
                                return option.name === $scope.selectedOrder.xa;
                            });
                            if (xaOption) {

                                setTimeout(function () {
                                    $("#xa").val(xaOption.code).addClass('selected');
                                    $scope.changeXa();
                                    // $("#nav-tab a[data-target='#edit']").addClass("active");
                                    // $("#nav-tab a[data-target='#list']").removeClass("active");

                                    // // Hiển thị nội dung của tab đầu tiên
                                    // $("#edit").addClass("show active");
                                    // $("#list").removeClass("show active");

                                }, 500);
                            }

                        }, 500);
                    }, 200);
                }

            }, 300);
        }
    }
    $scope.closeModal = function () {
        $('#orderDetailModal').modal('hide'); // Đóng modal
    };

    $scope.formatDate = function (dateString) {
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
            sweetalert("Đơn hàng đã được xác nhận!");
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

    $.doiHang = function (item) {

    }

    $scope.update = function () {

        $scope.selectedOrder.tinh = $("#thanhpho option:selected").text();
        $scope.selectedOrder.huyen = $("#huyen option:selected").text();
        $scope.selectedOrder.xa = $("#xa option:selected").text();
        var temp = 0;
        for (var i = 0; i < $scope.selectedOrder.chiTietDonHangList.length; i++) {
            var detail = $scope.selectedOrder.chiTietDonHangList[i];
            temp = temp + (detail.soLuong * detail.donGia);
        }
        temp = temp + $scope.selectedOrder.phiGiaoHang - $scope.selectedOrder.tienGiam;
        $scope.selectedOrder.tongTien = temp;
        var item = angular.copy($scope.selectedOrder);
        console.log("$scope.selectedOrder", $scope.selectedOrder);

        $http.put("/rest/order/update/" + item.id, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            // $scope.reset();
            $scope.closeModal();
            sweetalert("Cập nhật đơn hàng thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật đơn hàng!");
            $scope.closeModal();
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



    const host = "https://provinces.open-api.vn/api/";
    var callAPI = (api) => {
        return $http.get(api)
            .then((response) => {
                $scope.thanhPho = response.data;
                renderData(response.data, "thanhpho");
            });
    }
    callAPI('https://provinces.open-api.vn/api/?depth=1');
    var callApiDistrict = (api) => {
        return $http.get(api)
            .then((response) => {
                $scope.huyen = response.data.districts;
                $("#xa").val("").addClass('selected');
                renderData(response.data.districts, "huyen");
            });
    }
    var callApiWard = (api) => {
        return $http.get(api)
            .then((response) => {
                $scope.xa = response.data.wards;
                renderData(response.data.wards, "xa");
            });
    }

    var renderData = (array, select) => {
        let row = ' <option disable value="">chọn</option>';
        array.forEach(element => {
            row += `<option  value="${element.code}">${element.name}</option>`
        });
        document.querySelector("#" + select).innerHTML = row
    }

    $scope.changeThanhPho = () => {
        callApiDistrict(host + "p/" + $("#thanhpho").val() + "?depth=2");
        printResult();
    };
    $scope.changeHuyen = () => {
        callApiWard(host + "d/" + $("#huyen").val() + "?depth=2");
        printResult();
    };
    $scope.changeXa = () => {
        printResult();
    };
    $("#xa").change(() => {
        printResult();
    })
    var printResult = () => {
        if ($("#huyen").val() != "" && $("#thanhpho").val() != "" &&
            $("#xa").val() != "") {
            let result = $("#thanhpho option:selected").text() +
                " | " + $("#huyen option:selected").text() + " | " +
                $("#xa option:selected").text();
            $("#result").text(result)
        }
    }




});