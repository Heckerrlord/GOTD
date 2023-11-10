const app = angular.module("shopping-app", []);

app.run(function ($http, $rootScope) {
    $http.get(`/rest/auth/authentication`).then(resp => {
        if (resp.data) {
            $auth = $rootScope.$auth = resp.data;

        }
    });
})

app.controller("shopping-ctrl", function ($scope, $http) {
    var url = "/rest/products";
    var url1 = "/rest/cart";
    var url2 = "/rest/order";
    $scope.items = [];
    $scope.cates = [];
    $scope.form = {};

    var sweetalert = function (text, callback) {
        Swal.fire({
            title: text,
            showConfirmButton: true,
            timer: 2000,
        }).then(function () {
            if (callback) {
                callback();
            }
        });
    }

    $scope.cartItems = [];
    $scope.gioHangChiTiet = {};


    $scope.showCart = function() {
        $http.get('/rest/cart/view').then(function(response) {
            $scope.cartItems = response.data;
        });
    };


    $scope.addToCart = function(productId) {
        $http.post('/rest/cart/add/' + productId)
            .then(function(response) {
            })
            .catch(function(error) {
            });
    };


    $scope.updateCartItem = function(item) {
        var data = {
            newQuantity: item.soLuong
        };

        $http.put('/rest/cart/' + item.id, data)
            .then(function(response) {
               console.log(data);
                console.log("Mục đã được cập nhật thành công");
            })
            .catch(function(error) {
                // Xử lý lỗi ở đây (nếu cần)
                console.error("Lỗi khi cập nhật mục trong giỏ hàng", error);
            });
    };


    $scope.getSubtotal = function() {
        var subtotal = 0;
        for (var i = 0; i < $scope.cartItems.length; i++) {
            subtotal += $scope.cartItems[i].soLuong * $scope.cartItems[i].donGia;
        }
        return subtotal;
    };
    $scope.getTotalMoney = function() {
        // Sử dụng hàm getSubtotal để tính Subtotal
        var subtotal = $scope.getSubtotal();
        // Thêm các khoản phí khác nếu cần
        var otherFees = 0; // Thay bằng các khoản phí khác nếu có
        var totalMoney = subtotal + otherFees;
        return totalMoney;
    };


    $scope.getProductCount = function() {
        var productCount = 0;
        for (var i = 0; i < $scope.cartItems.length; i++) {
            productCount += $scope.cartItems[i].soLuong;
        }
        return productCount;
    };
    $scope.removeItem = function(id) {
        $http.delete('/rest/cart/remove/' + id)
            .then(function(response) {
                // Xóa thành công, loại bỏ mục hàng từ danh sách hiển thị
                var index = $scope.cartItems.findIndex(item => item.id === id);
                if (index !== -1) {
                    $scope.cartItems.splice(index, 1);
                }
            })
            .catch(function(error) {
                console.error("Lỗi khi xóa mục hàng khỏi giỏ hàng", error);
            });
    };

    $scope.clearCart = function() {
        $http.delete('/rest/cart/clear')
            .then(function(response) {
                console.log("Giỏ hàng đã được xóa");
                $scope.cartItems = []; // Xóa tất cả mục hàng trên giao diện người dùng
            })
            .catch(function(error) {
                console.error("Lỗi khi xóa giỏ hàng", error);
            });
    };

    $scope.gioHang = {
        maGiamGia: "",
        soDienThoai: "",
        tinh: "",
        huyen: "",
        xa: "",
        dcChiTiet: "",
        tienGiam: 0,
        tongTien: 0,
        phiGiaoHang: 0,
        trangThai: 1,
        ngayDatHang: new Date(),
        account: { username: $("#username").text() },
        purchase() {
            console.log(this.soDienThoai)
            if (!this.soDienThoai || !$("#thanhpho option:selected").text() || !$("#huyen option:selected").text() || !$("#xa option:selected").text() || !this.dcChiTiet) {
                sweetalert("Vui lòng điền đầy đủ thông tin '*'");
                return;
            }
            var gioHang = angular.copy(this);
            gioHang.tongTien = $scope.getTotalMoney();
            gioHang.tinh = $("#thanhpho option:selected").text();
            gioHang.huyen = $("#huyen option:selected").text();
            gioHang.xa = $("#xa option:selected").text();

            $http.post(url2, gioHang).then(resp => {
                sweetalert("Đặt hàng thành công!", function() {
                    window.location.href = '/';
                });

            }).catch(error => {
                sweetalert("Đặt hàng lỗi!");
                console.log("Error", error);
            })
        }
    };


//yêu thích
    var url12 = "/rest/favorites";

    $scope.addFavorite = function (ma, user1) {
        ngay = new Date();
        user1 = userLogin;
        if (user1) {

            let favoriteData = {
                sanPham: ma,
                accounts: user1,
                date: ngay,
                trangThai: 0
            };
            $http.post(url12, favoriteData).then(function (response) {
                console.log(favoriteData.sanPham);
                location.reload();
            }).catch(function (error) {
                console.log(favoriteData);
                console.error("Lỗi: " + error.data);
            });
        }else{
            window.location.href= 'auth/login/form';
        }
    };


    $scope.removeFavorite = function (ma, username) {
        username = userLogin;
        $http.delete(url12 + '?ma=' + ma + '&username=' + username).then(function (resp) {
            console.log("Đã xóa khỏi yêu thích");
            location.reload();
        }).catch(function (err) {
            console.error("Lỗi: " + err.data);
        });
    }


    //Dia Chi
    const host = "https://provinces.open-api.vn/api/";
    var callAPI = (api) => {
        return  $http.get(api)
            .then((response) => {
                renderData(response.data, "thanhpho");
            });
    }
    callAPI('https://provinces.open-api.vn/api/?depth=1');
    var callApiDistrict = (api) => {
        return $http.get(api)
            .then((response) => {
                renderData(response.data.districts, "huyen");
            });
    }
    var callApiWard = (api) => {
        return $http.get(api)
            .then((response) => {
                renderData(response.data.wards, "xa");
            });
    }

    var renderData = (array, select) => {
        let row = ' <option disable value="">Chọn</option>';
        array.forEach(element => {
            row += `<option value="${element.code}">${element.name}</option>`
        });
        document.querySelector("#" + select).innerHTML = row
    }

    $scope.changeThanhPho  = ()=> {
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
    /*địa chỉ*/
    var urldiachi = "/rest/diachi/address"
    var urladd = "/rest/diachi"
    $scope.address = []
    $scope.form = {
        xa: '',
        thanhpho: '',
        huyen: ''
    }

    $scope.initialize = function () {
        //load product
        $http.get(urldiachi).then(resp => {
            $scope.address = resp.data;
        });
    }
    $scope.reset = function () {
        $scope.form = {};
    }
    //khoi dau
    $scope.initialize();
    $scope.showModal = true;
    $('.modal-backdrop').remove();

    $scope.createDiachi = function (user) {
        user = userLogin;
        let diachiData = {
            thanhpho: $("#thanhpho option:selected").text(),
            huyen: $("#huyen option:selected").text(),
            xa: $("#xa option:selected").text(),
            chiTiet: $scope.form.chiTiet,
            accounts: {
                username: user
            }
        }
        $http.post(urladd, diachiData).then(resp => {
            $scope.address.push(resp.data);
            $scope.reset();
            $scope.initialize();
            sweetalert("Thêm địa chỉ thành công")
            $('.modal-backdrop').remove();
            $scope.showModal = false;}).catch(err => {
            sweetalert("Thêm địa chỉ lỗi");
            console.log("thêm thất bại", err);
        })
    }

    $scope.edit = function (item) {
        $scope.form = angular.copy(item);
        $scope.isEditing = true;
    }
    $scope.deleteAdd = function (item) {
        Swal.fire({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn muốn xóa địa chỉ này?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy"
        }).then((result) => {
            if (result.isConfirmed) {
                $http.delete(`${urladd}/${item.id}`)
                    .then(function (resp) {
                        var index = $scope.address.indexOf(item);
                        if (index !== -1) {
                            $scope.address.splice(index, 1);

                        } else {

                        }
                        $scope.reset();
                        $scope.initialize();
                    })
                    .catch(function (err) {

                        console.log("Error", err);
                    });
            }
        });
    }

    $scope.updateAdd = function () {
        let user = userLogin;
        let diachiData = {
            id: $scope.form.id, // Truyền id của đối tượng cần cập nhật
            thanhpho: $("#thanhpho option:selected").text(),
            huyen: $("#huyen option:selected").text(),
            xa: $("#xa option:selected").text(),
            chiTiet: $scope.form.chiTiet,
            accounts: {
                username: user
            }
        }
        $http.put(`${urladd}/${diachiData.id}`, diachiData).then(resp => {
            var index = $scope.address.findIndex(p => p.id == diachiData.id);
            if (index !== -1) {
                $scope.address[index] = diachiData;
                $scope.reset();
                sweetalert("Cập nhật địa chỉ thành công!");
                $('.modal-backdrop').remove();
                $scope.showModal = false;

            } else {
                sweetalert("Không tìm thấy đối tượng để cập nhật!");
            }
        }).catch(error => {
            sweetalert("Lỗi cập nhật địa chỉ!");
            console.log("Error", error);
        });
    }

    $scope.showCart();
});
