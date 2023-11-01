const app = angular.module("shopping-app", []);

app.run(function ($http, $rootScope) {
    $http.get(`/rest/auth/authentication`).then(resp => {
        if (resp.data) {
            $auth = $rootScope.$auth = resp.data;
            $http.defaults.headers.common["Authorization"] = $auth.token;
        }
    });
})

app.controller("shopping-ctrl", function ($scope, $http) {
    var url = "/rest/products";
    var url1 = "/rest/orders";

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    $scope.cart = {
        items: [],
        add(id) {
            var item = this.items.find(item => item.id == id);
            if (item) {
                item.qty++;
                this.saveToLocalStorage();
            }
            else {
                $http.get(`${url}/${id}`).then(resp => {
                    resp.data.qty = 1;
                    this.items.push(resp.data);
                    this.saveToLocalStorage();
                }).catch(error => {
                    console.error("Lỗi trong quá trình thêm sản phẩm vào giỏ hàng:", error);
                });
            }
        },
        remove(id) {
            var index = this.items.findIndex(item => item.id == id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },
        clear() {
            this.items = [];
            this.saveToLocalStorage();
        },
        amt_of(item) { },
        get count() {
            return this.items
                .map(item => item.qty)
                .reduce((total, qty) => total += qty, 0);
        },
        get amount() {
            return this.items
                .map(item => item.qty * item.price)
                .reduce((total, qty) => total += qty, 0);
        },
        saveToLocalStorage() {
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },
        loadFromLocalStorage() {
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        }
    }

    $scope.cart.loadFromLocalStorage();


    $scope.cart.loadFromLocalStorage();

    $scope.DonHang = {
        ngayDatHang: new Date(),
        soDienThoai: "",
        dcChiTiet: "",
        maGiamGia: "",
        tienGiam: 0, // Sửa thành giá trị số hạ giảm
        phiGiaoHang: 0, // Sửa thành giá trị phí giao hàng
        account: { username: $("#username").text() },
        tongTien: 0, // Sửa thành giá trị tổng tiền
        DonHangChiTiet: [], // Sửa thành một mảng chi tiết đơn hàng
        purchase() {
            // Tạo mảng chi tiết đơn hàng từ các sản phẩm trong giỏ hàng
            this.DonHangChiTiet = $scope.cart.items.map(item => {
                return {
                    chiTietSanPham: { id: item.id },
                    donGia: item.price,
                    soLuong: item.qty,
                    trangThai: 1
                }
            });

            // Tạo đối tượng đơn hàng
            var order = {
                ngayDatHang: this.ngayDatHang,
                soDienThoai: this.soDienThoai,
                dcChiTiet: this.dcChiTiet,
                soDienThoai: this.soDienThoai,
                tienGiam: this.tienGiam,
                phiGiaoHang: this.phiGiaoHang,
                account: this.account,
                tongTien: this.tongTien,
                DonHangChiTiet: this.DonHangChiTiet
            };

            $http.post(url1, order).then(resp => {
                sweetalert("Đặt hàng thành công!");
                $scope.cart.clear();
                location.href = "/order/detail/" + resp.data.id;
            }).catch(error => {
                sweetalert("Đặt hàng lỗi!");
                console.log("Error", error);
            })
        }
    }
})
