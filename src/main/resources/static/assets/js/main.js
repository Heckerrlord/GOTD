const app = angular.module("shopping-app", []);

app.run(function ($http, $rootScope) {
    $http.get(`/rest/auth/authentication`).then(resp => {
        if (resp.data) {
            $auth = $rootScope.$auth = resp.data;

        }
    });
})


app.controller("shopping-ctrl", function ($scope, $http, $timeout, $rootScope) {

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

    toastr.options.positionClass = "toast-top-right";

    // var showToast = function (text, callback) {
    //     toastr.options = {
    //         closeButton: true,
    //         timeOut: 2000,
    //         positionClass: "toast-top-right", // Đặt vị trí ở góc trên bên phải
    //     };
    //
    //     toastr.success(text);
    //
    //     if (callback) {
    //         setTimeout(callback, 2000); // Gọi callback sau khi hiển thị Toast trong 2 giây
    //     }
    // };


    $scope.cartItems = [];
    $scope.gioHangChiTiet = {};


    $scope.showCart = function () {
        $http.get('/rest/cart/view').then(function (response) {
            $scope.cartItems = response.data;
        });
    };
    var url = window.location.pathname;
    var segments = url.split('/');
    $scope.sanPhamMa = segments[segments.length - 1] || '';
    $scope.p = {};
    $scope.selectedKichCo = null;
    $scope.selectedMauSac = null;
    $scope.searchDetail = function () {
        var url = 'rest/products/detail/' + $scope.sanPhamMa;
        var params = {};
        if ($scope.selectedKichCo) {
            params.kichCoCode = $scope.selectedKichCo;
        }
        if ($scope.selectedMauSac) {
            params.mauSacCode = $scope.selectedMauSac;
        }
        if ($scope.sanPhamMa != null) {
            $http.get(url, {params: params})
                .then(function (response) {
                    if (response || response.data.item) {
                        $scope.p = response.data.item;
                        $scope.m = response.data.m;
                        $scope.kc = response.data.kc;
                    }
                })
                .catch(function (error) {
                    sweetalert("Không tìm thấy sản phẩm");
                    console.error('Đã xảy ra lỗi:', error);
                });
        }
        ;
    };


    // Gọi hàm searchDetail khi controller được khởi tạo


    $scope.addToCart = function (productId) {
        $http.post('/rest/cart/add/' + productId)
            .then(function (response) {
            })
            .catch(function (error) {
            });
    };


    $scope.updateCartItem = function (item) {
        var data = {
            newQuantity: item.soLuong
        };

        $http.put('/rest/cart/' + item.id, data)
            .then(function (response) {
                console.log(item);
                console.log("Mục đã được cập nhật thành công");
            })
            .catch(function (error) {
                // Xử lý lỗi ở đây (nếu cần)
                console.error("Lỗi khi cập nhật mục trong giỏ hàng", error);
            });
    };


    $scope.getSubtotal = function () {
        var subtotal = 0;
        for (var i = 0; i < $scope.cartItems.length; i++) {
            subtotal += $scope.cartItems[i].soLuong * $scope.cartItems[i].donGia;
        }
        return subtotal;
    };


    $scope.getProductCount = function () {
        var productCount = 0;
        for (var i = 0; i < $scope.cartItems.length; i++) {
            productCount += $scope.cartItems[i].soLuong;
        }
        return productCount;
    };
    $scope.removeItem = function (id) {
        $http.delete('/rest/cart/remove/' + id)
            .then(function (response) {
                // Xóa thành công, loại bỏ mục hàng từ danh sách hiển thị
                var index = $scope.cartItems.findIndex(item => item.id === id);
                if (index !== -1) {
                    $scope.cartItems.splice(index, 1);
                }
            })
            .catch(function (error) {
                console.error("Lỗi khi xóa mục hàng khỏi giỏ hàng", error);
            });
    };

    $scope.clearCart = function () {
        $http.delete('/rest/cart/clear')
            .then(function (response) {
                console.log("Giỏ hàng đã được xóa");
                $scope.cartItems = []; // Xóa tất cả mục hàng trên giao diện người dùng
            })
            .catch(function (error) {
                console.error("Lỗi khi xóa giỏ hàng", error);
            });
    };
    $scope.getDiscount = function (ma) {
        return $http.get('/rest/order/discount/' + ma)
            .then(function (response) {
                $scope.getTotalMoney();
                return response.data.gtd;

            })
            .catch(function (error) {
                console.error('Đã xảy ra lỗi:', error);
                return null;
            });
    };

    $scope.getTotalMoney = function () {
        var subtotal = $scope.getSubtotal();
        var tienGiam = $scope.gioHang.tienGiam || 0;
        var otherFees = 0;
        var totalMoney = subtotal - tienGiam + otherFees;
        return totalMoney;
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
        account: {username: $("#username").text()},
        purchase: function () {
            if (!this.soDienThoai || !$("#thanhpho option:selected").text() || !$("#huyen option:selected").text() || !$("#xa option:selected").text() || !this.dcChiTiet) {
                sweetalert("Vui lòng điền đầy đủ thông tin '*'");
                return;
            }
            var self = this;
            $scope.getDiscount(this.maGiamGia)
                .then(function (tienGiam) {
                    self.tienGiam = tienGiam || 0;
                    self.tongTien = $scope.getTotalMoney();
                    self.tinh = $("#thanhpho option:selected").text();
                    self.huyen = $("#huyen option:selected").text();
                    self.xa = $("#xa option:selected").text();
                    return $http.post(url2, self);
                })
                .then(function (resp) {
                    if (resp) {
                        sweetalert("Đặt hàng thành công!");
                        var newLocation = resp.headers('Location');
                        window.location.href = newLocation;

                    }
                })
                .catch(function (error) {
                    sweetalert("Đã xảy ra lỗi khi đặt hàng!");
                    console.log("Error", error);
                });
        },
        getPaymentUrl: function () {
            let pricee = $scope.getSubtotal();
            if (confirm("Bạn có chắc chắn muốn thanh toán không?")) {
                if (!this.soDienThoai || !$("#thanhpho option:selected").text() || !$("#huyen option:selected").text() || !$("#xa option:selected").text() || !this.dcChiTiet) {
                    sweetalert("Vui lòng điền đầy đủ thông tin '*'");
                    return;
                }
                var self = this;
                $scope.getDiscount(this.maGiamGia)
                    .then(function (tienGiam) {
                        self.tienGiam = tienGiam || 0;
                        self.tongTien = $scope.getTotalMoney();
                        self.tinh = $("#thanhpho option:selected").text();
                        self.huyen = $("#huyen option:selected").text();
                        self.xa = $("#xa option:selected").text();
                        return $http.post(url2, self);
                    })
                    .then(function (resp) {
                        if (resp) {
                        }
                    })
                $http.get('rest/payments/pay', {
                    params: {price: pricee},
                    transformResponse: function (data, headers) {
                        return data;
                    },
                    responseType: 'text'
                }).then(function (response) {
                    window.location.href = response.data;
                }).catch(function (error) {
                    console.error('Đã xảy ra lỗi:', error);
                });
            }
        }
    };


//yêu thích
    var url12 = "/rest/favorites";

    $http.get('/api/products')
        .then(function (response) {
            $scope.products = response.data;
        })
        .catch(function (error) {
            console.error('Error fetching products:', error);
        });
    $scope.products;



    // $scope.isProductFavorite = false;
    //
    // $scope.checkFavorites = function (maSanPham) {
    //     if (userLogin) {
    //         let user = userLogin;
    //         $http.get(`${url12}/check?username=${user}&ma=${maSanPham}`).then(function (resp) {
    //             $scope.isFavorite = resp.data;
    //             $scope.isProductFavorite = $scope.isFavorite && $scope.isFavorite.sanPham !== null;
    //             console.log("Mã: " + maSanPham + ", Trạng thái yêu thích: " + $scope.isProductFavorite);
    //         });
    //     }
    // };


    $scope.getFavoriteProducts = function () {
        let user = userLogin;
        $http.get(`/rest/products/favorites?username=${user}`).then(function (resp) {
            $scope.favoriteProducts = resp.data;
            console.log("dataf", resp.data);
        });
    };

    $scope.getFavoriteProducts();

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
                $scope.$applyAsync(function () {
                    toastr.success("Thêm yêu thích thành công!");
                    console.log("Thêm yêu thích thành công");
                    $scope.getFavoriteProducts();
                    $scope.filterProducts();
                    $scope.getListProductMain();
                });
            }).catch(function (error) {
                console.error("Lỗi khi thêm yêu thích: " + error.data);
            });

        } else {
            window.location.href = 'auth/login/form';
        }
    };

    $scope.removeFavorite = function (ma) {

        if (userLogin) {
            let user = userLogin;

            $http.delete(url12 + '?ma=' + ma + '&username=' + user).then(function (response) {
                toastr.success("Xóa yêu thích thành công!");
                console.log("Xóa yêu thích thành công");
                $scope.getFavoriteProducts();
                $scope.filterProducts();
                $scope.getListProductMain();
            }).catch(function (error) {
                console.error("Lỗi khi xóa yêu thích: " + error.data);
            });
        } else {
            window.location.href = 'auth/login/form';
        }
    };


    //Dia Chi
    const host = "https://provinces.open-api.vn/api/";
    var callAPI = (api) => {
        return $http.get(api)
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
        // Kiểm tra xem tất cả các trường đã được nhập chưa
        if (!$scope.form.chiTiet || $scope.form.chiTiet.trim() === "" || $("#thanhpho option:selected").text() === "Chọn thành phố" || $("#huyen option:selected").text() === "Chọn huyện" || $("#xa option:selected").text() === "Chọn xã") {
            sweetalert("Vui lòng nhập đầy đủ thông tin địa chỉ");
            return;
        }
        $http.post(urladd, diachiData).then(resp => {
            $scope.address.push(resp.data);
            $scope.reset();
            $scope.initialize();
            sweetalert("Thêm địa chỉ thành công")
            $('.modal-backdrop').remove();
            $scope.showModal = false;
        }).catch(err => {
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
        // Kiểm tra xem tất cả các trường đã được nhập chưa
        if (!$scope.form.chiTiet || $scope.form.chiTiet.trim() === "" || $("#thanhpho option:selected").text() === "Chọn thành phố" || $("#huyen option:selected").text() === "Chọn huyện" || $("#xa option:selected").text() === "Chọn xã") {
            sweetalert("Vui lòng nhập đầy đủ thông tin địa chỉ");
            return;
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

    /* ĐÁNH GIÁ SẢN PHẨM */
    var urlReview = `/rest/danhgia`;

    $scope.showRate = function (maSanPham) {
        $http.get(urlReview + "/" + maSanPham).then(function (response) {
            $scope.reviews = response.data;
        })
    };

    //KHAI BÁO SAO
    $scope.stars = [1, 2, 3, 4, 5]; // Số lượng sao
    $scope.rating = 5; // Giá trị rating
    //SET SỐ SAO CHO ĐÁNH GIÁ
    $scope.setStar = function (star) {
        $scope.rating = star;
    };
    $scope.formRate = {
        sao: 0
    };
    $scope.resetR = function () {
        $scope.formRate = {};
    }

    //GỬI ĐÁNH GIÁ

    $scope.Reviews = function (maSp, user) {
        user = userLogin;
        if (user == null) {
            sweetalert("Vui lòng đăng nhập trước khi đánh giá");
            // Chờ 5 giây trước khi chuyển hướng đến trang đăng nhập
            setTimeout(function () {
                // Chuyển hướng đến trang đăng nhập
                window.location.href = "/auth/login/form"
            }, 2000);
            return;
        }
        if (!$scope.rating) {
            sweetalert("Vui lòng chọn số sao trước khi gửi đánh giá");
            return;
        } else {
            var reviewdata = {
                sao: $scope.rating,
                comment: $scope.formRate.comment,
                ngayCmt: new Date(),
                trangThai: 0,
                account: {
                    username: user
                },
                sanPham: {
                    ma: maSp
                }
            };
            console.log(reviewdata.sanPham.ma)

            $http.post(urlReview + '/' + maSp, reviewdata, {
                params: {
                    user: user,
                    maSp: maSp
                }
            })
                .then(resp => {
                    $scope.resetR();
                    location.reload();
                    sweetalert("Gửi đánh giá thành công")
                })
                .catch(err => {
                    console.error(err);
                    sweetalert("Gửi đánh giá không thành công")
                });
        }
    }

    var urlcheck = 'rest/danhgia/check';
    $scope.checkReviewOnInit = function (maSanPham) {
        var user = userLogin;
        $http.get(`${urlcheck}?maSanPham=${maSanPham}&username=${user}`).then(function (response) {
            $scope.hasReviewed = response.data;
            console.log('hasReviewed:', $scope.hasReviewed);
        });
    };


    //------------------todo:  Loc san pham-----------------------

    // hien thi brands
    $scope.brands = [];
    $scope.colors = [];
    $scope.sizes = [];

    $http.get('api/products/brands')
        .then(function (response) {
            $scope.brands = response.data;
        })
        .catch(function (error) {
            console.error('Error fetching brands:', error);
        });

    $http.get('api/products/sizes')
        .then(function (response) {
            $scope.sizes = response.data;
        })
        .catch(function (error) {
            console.error('Error fetching brands:', error);
        });

    $http.get('api/products/colors')
        .then(function (response) {
            $scope.colors = response.data;
        })
        .catch(function (error) {
            console.error('Error fetching brands:', error);
        });

    $http.get('api/products/categories')
        .then(function (response) {
            $scope.categories = response.data;
        })
        .catch(function (error) {
            console.error('Error fetching brands:', error);
        });


    // Initialize selected filters
    $scope.selectedBrands = [];
    $scope.selectedSizes = [];
    $scope.selectedColors = [];
    $scope.selectedCategories = [];
    $scope.filterParams = {
        minPrice: '',
        maxPrice: ''
    };


    //to do:loc color
    $scope.onColorClick = function (color) {
        color.selected = !color.selected;
        updateSelectedColors();
    };

    function updateSelectedColors() {
        $scope.selectedColors = $scope.colors
            .filter(function (color) {
                return color.selected;
            })
            .map(function (color) {
                return color.name;
            });

        $scope.filterProducts();
    }


    // to do: loc gia
    $scope.applyPriceFilter = function () {
        if (isValidPrice($scope.filterParams.minPrice) && isValidPrice($scope.filterParams.maxPrice)) {
            $scope.filterProducts();
        } else {
            alert('Vui lòng nhập giá trị hợp lệ cho khoảng giá.');
        }
    };

    function isValidPrice(value) {
        return /^\d+$/.test(value);
    }

    $scope.numbers = {
        formatDecimal: function(value, precision, thousandsSeparator, decimalSeparator) {
            return value.toFixed(precision).replace(/\B(?=(\d{3})+(?!\d))/g, thousandsSeparator);
        }
    };

    // todo: Paging

    $scope.$watch('items', function () {
    }, true);

    $scope.pager = {};
    $scope.pager.currentPage = 0;
    $scope.pager.pageSize = 9; //

    $scope.setPage = function (page) {
        $scope.pager.currentPage = page;
        $scope.filterProducts();
    };



    $scope.pager.prev = function () {
        $scope.setPage($scope.pager.currentPage - 1);
    };

    $scope.pager.next = function () {
        $scope.setPage($scope.pager.currentPage + 1);
    };

    $scope.pager.first = function () {
        $scope.setPage(0);
    };

    $scope.pager.last = function () {
        $scope.setPage($scope.pager.pageCount - 1);
    };

    $scope.pager.prevDisabled = function() {
        return $scope.pager.currentPage === 0;
    };

    $scope.pager.nextDisabled = function() {
        return $scope.pager.currentPage === $scope.pager.pageCount - 1;
    };

    // todo: Sort

    $scope.sort = function (type) {
        switch (type) {
            case 'Hàng mới':
                $scope.sortType = "Hàng mới"
                $scope.filterProducts();
                break;
            case 'Giá thấp đến cao':
                $scope.sortType = "Giá thấp đến cao"
                $scope.filterProducts();
                break;
            case 'Giá cao đến thấp':
                $scope.sortType = "Giá cao đến thấp"
                $scope.filterProducts();
                break;
            default:
                break;
        }
    };

    //  to filter
    $scope.filterProducts = function () {
        // Get the selected brands
        var selectedBrands = Object.keys($scope.selectedBrands).filter(function (brandNames) {
            return $scope.selectedBrands[brandNames];
        });

        // Get the selected sizes
        var selectedSizes = Object.keys($scope.selectedSizes).filter(function (sizes) {
            return $scope.selectedSizes[sizes];
        });

        var selectedColors = $scope.selectedColors;

        var selectedCategories = Object.keys($scope.selectedCategories).filter(function (categories) {
            return $scope.selectedCategories[categories];
        });


        // Log or use the selected filters as needed
        console.log('Selected Brands:', selectedBrands);
        console.log('Selected Sizes:', selectedSizes);
        console.log('Selected Colors:', selectedColors);
        console.log('Selected Categories:', selectedCategories);
        console.log('Min Price:', $scope.filterParams.minPrice);
        console.log('Max Price:', $scope.filterParams.maxPrice);
        console.log('Date',$scope.sortType )

        // Construct the API endpoint with query parameters
        var url = '/api/products/getList';
        var queryParams = [
            'brandNames=' + encodeURIComponent(selectedBrands.join(',')),
            'sizes=' + encodeURIComponent(selectedSizes.join(',')),
            'colors=' + encodeURIComponent(selectedColors.join(',')),
            'categories=' + encodeURIComponent(selectedCategories.join(',')),
            'minPrice=' + encodeURIComponent($scope.filterParams.minPrice),
            'maxPrice=' + encodeURIComponent($scope.filterParams.maxPrice),
            'sortType=' + $scope.sortType,
            'page=' + $scope.pager.currentPage,
            'pageSize=' + $scope.pager.pageSize
        ].join('&');


        var urlWithParams = url + '?' + queryParams;

        $http.get(urlWithParams)
            .then(function (response) {
                $scope.items = response.data.items.map(el => {
                    if ($scope.favoriteProducts.filter(fa => fa.id === el.id).length !== 0) {
                        el.myFavorite = 1;
                    } else {
                        el.myFavorite = 0;
                    }
                    return el;
                })
                $scope.pager.itemCount = response.data.totalItems;
                $scope.pager.pageCount = response.data.totalPages;
                $scope.pager.currentPage = response.data.currentPage;


                // Tạo mảng các trang để hiển thị trong phân trang
                $scope.pager.pages = [];
                for (var i = 0; i < $scope.pager.pageCount; i++) {
                    $scope.pager.pages.push(i);
                }
            })
            .catch(function (error) {
                console.error('Error in fetching data:', error);
            });
    };

    $scope.filterProducts();


    // to clearFilter
    $scope.clearFilters = function () {
        // Xóa tất cả các bộ lọc đã chọn
        $scope.selectedBrands = {};
        $scope.selectedSizes = {};
        $scope.selectedCategories = {};
        $scope.selectedColors = [];
        $scope.filterParams.minPrice = '';
        $scope.filterParams.maxPrice = '';

        angular.forEach($scope.colors, function (color) {
            color.selected = false;
        });

        $scope.filterProducts();
    };

    $scope.isAnyFilterSelected = function () {
        return ($scope.selectedBrands && Object.keys($scope.selectedBrands).length > 0) ||
            ($scope.selectedSizes && Object.keys($scope.selectedSizes).length > 0) ||
            ($scope.selectedCategories && Object.keys($scope.selectedCategories).length > 0) ||
            ($scope.selectedColors && $scope.selectedColors.length > 0) ||
            ($scope.filterParams.minPrice !== '' && $scope.filterParams.maxPrice !== '');
    };


    var urlblogs = "/rest/blogs";
    $scope.blogs = null


    $scope.listBlogs = function (){
        $http.get(urlblogs+'/listBlogs').then(function (resp){
            $scope.blogs = resp.data;
            console.log("thu thao nee " + $scope.blogs)
        });
    }
    $scope.listBlogs()

    var urla = "/allAnh";
    $scope.ah = null


    $scope.lanh = function (){
        $http.get(urlblogs).then(function (resp){
            $scope.ah = resp.data;
            console.log("thu thao nee " + $scope.ah)
        });
    }
    $scope.lanh()

    var urlblogs = "/rest/blogs";
    $scope.blogs = null


    $scope.listBlogs = function (){
        $http.get(urlblogs+'/listBlogs').then(function (resp){
            $scope.blogs = resp.data;
            console.log("thu thao nee " + $scope.blogs)
        });
    }
    $scope.listBlogs()

    var urla = "/allAnh";
    $scope.ah = null


    $scope.lanh = function (){
        $http.get(urlblogs).then(function (resp){
            $scope.ah = resp.data;
            console.log("thu thao nee " + $scope.ah)
        });
    }
    $scope.lanh()



    //------------------todo:  Loc san pham-----------------------

    //-------todo: list_product_main and paging------------------

    $scope.pager_main = {};
    $scope.pager_main.currentPage_main = 0;
    $scope.pager_main.pageSize_main = 8; // Số sản phẩm trên mỗi trang

    $scope.setPage_main = function (page_main) {
        $scope.pager_main.currentPage_main = page_main;
        $scope.getListProductMain();
    };

    // $scope.pager_main.prev_main = function () {
    //     $scope.setPage_main($scope.pager_main.currentPage_main - 1);
    // };
    //
    // $scope.pager_main.next_main = function () {
    //     $scope.setPage_main($scope.pager_main.currentPage_main + 1);
    // };

    $scope.pager_main.first_main = function () {
        $scope.setPage_main(0);
    };

    $scope.getListProductMain = function () {
        var url = '/api/products/getListTrangChu';
        var queryParams = [
            'page_main=' + $scope.pager_main.currentPage_main,
            'pageSize_main=' + $scope.pager_main.pageSize_main
        ].join('&');

        var urlWithParams = url + '?' + queryParams;

        $http.get(urlWithParams)
            .then(function (response) {
                $scope.list_product = response.data.list_product.map(ew => {
                    if ($scope.favoriteProducts.filter(fa => fa.id === ew.id).length !== 0) {
                        ew.myFavorite = 1;
                    } else {
                        ew.myFavorite = 0;
                    }
                    return ew;
                })
                $scope.pager_main.itemCount_main = response.data.totalItems;
                $scope.pager_main.pageCount_main = response.data.totalPages;
                $scope.pager_main.currentPage_main = response.data.currentPage_main;
                console.log($scope.list_product)
                // Tạo mảng các trang để hiển thị trong phân trang
                $scope.pager_main.pages_main = [];
                for (var i = 0; i < $scope.pager_main.pageCount_main; i++) {
                    $scope.pager_main.pages_main.push(i);
                }
            })
            .catch(function (error) {
                console.error('Error in fetching data:', error);
            });

    };
    $scope.getListProductMain();

    //-------todo: list_product_main and paging------------------



    //-------todo: list_top5_best_seller_product------------------
    $http.get('/api/products/top5_best_seller')
        .then(function(response) {
            // Xử lý kết quả trả về từ API
            $scope.top5Items = response.data;
            console.log($scope.top5Items);
        })
        .catch(function(error) {
            // Xử lý lỗi nếu có
            console.error('Error fetching top 5 items:', error);
        });
});
