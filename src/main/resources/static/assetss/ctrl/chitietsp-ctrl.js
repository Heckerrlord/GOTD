app.controller("chitietsp-ctrl", function ($scope, $http,$timeout) {

    var url = "/rest/sanPham";
    var url1 = "/rest/products";
    var url2 = "/rest/upload/images";
    var urlkichco = "/rest/kichco";
    var urlcolor = "/rest/color";
    var urlbrand = "/rest/thuonghieu";
    var urlchatlieu  = "/rest/chatlieu";
    var urlloaiao = "/rest/loaikhachhang";
    var urlcoao = "/rest/coao";

    $scope.kichco =[];
    $scope.color=[];
    $scope.thuonghieu=[];
    $scope.chatlieu=[];
    $scope.loaiao=[];
    $scope.coao=[];

    $scope.items = [];
    $scope.ctsp =[];
    $scope.selectedImage = {};

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }
    var confirmAction = function (icon, title, text, confirmButtonText, cancelButtonText, callback) {
        Swal.fire({
            icon: icon,
            title: title,
            text: text,
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: confirmButtonText,
            cancelButtonText: cancelButtonText,
        }).then((result) => {
            if (result.isConfirmed) {
                // Gọi hàm callback khi người dùng xác nhận
                if (typeof callback === 'function') {
                    callback();
                }
            }
        });
    };


    $scope.initialize = function () {
        $http.get(url).then(function (resp) {
            $scope.items = resp.data;
            console.log(resp.data)
            $timeout(function () {
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

    // Trong controller của bạn
    $scope.acceptSp = function (item) {
        // Hàm callback để thực hiện duyệt đơn khi người dùng xác nhận
        var acceptCallback = function () {
            item.trangThai = 1;
            // Gọi API để cập nhật trạng thái sản phẩm
            $http.put(`${url}/update-trangthai/${item.id}?newTrangThai=${item.trangThai}`)
                .then(function (resp) {
                })
                .catch(function (error) {

                });
        };

        // Hiển thị hộp thoại xác nhận trước khi thực hiện duyệt đơn
        confirmAction('warning', 'Xác nhận ngừng hoạt động sản phẩm này?', 'Bạn có chắc muốn ngừng hoạt động sản phẩm này?', 'Chấp nhận', 'Hủy', acceptCallback);
    };

    $scope.deceptSp = function (item) {
        // Hàm callback để thực hiện duyệt đơn khi người dùng xác nhận
        var acceptCallback = function () {
            item.trangThai = 0;
            // Gọi API để cập nhật trạng thái sản phẩm
            $http.put(`${url}/update-trangthai/${item.id}?newTrangThai=${item.trangThai}`)
                .then(function (resp) {
                })
                .catch(function (error) {
                });
        };
        // Hiển thị hộp thoại xác nhận trước khi thực hiện duyệt đơn
        confirmAction('warning', 'Xác nhận kích hoạt sản phẩm này?', 'Bạn có chắc muốn kích hoạt sản phẩm này?', 'Chấp nhận', 'Hủy', acceptCallback);
    };
    $scope.acceptCtSp = function (item){
        // Hàm callback để thực hiện duyệt đơn khi người dùng xác nhận
        var acceptCallback = function () {
            item.Trangthai = 1;
            $http.put(`${url1}/update-trangthai/${item.id}?newTrangThai=${item.Trangthai}`)
                .then(function (resp){

                })
                .catch(function(error) {
                    $('#product-update-modal').modal('hide');
                    $scope.initialize();
                });
        };
        // Hiển thị hộp thoại xác nhận trước khi thực hiện duyệt đơn
        confirmAction('warning', 'Xác nhận ngừng hoạt động sản phẩm này?', 'Bạn có chắc muốn ngừng hoạt động sản phẩm này?', 'Chấp nhận', 'Hủy', acceptCallback);
    };
    $scope.deacceptCtSp = function (item){
        // Hàm callback để thực hiện duyệt đơn khi người dùng xác nhận
        var acceptCallback = function () {
            item.Trangthai = 0;
            $http.put(`${url1}/update-trangthai/${item.id}?newTrangThai=${item.Trangthai}`)
                .then(function (resp){

                })
                .catch(function(error) {
                    $('#product-update-modal').modal('hide');
                    $scope.initialize();
                });
        };
        // Hiển thị hộp thoại xác nhận trước khi thực hiện duyệt đơn
        confirmAction('warning', 'Xác nhận kích hoạt lại sản phẩm này?', 'Bạn có chắc muốn kích hoạt lại sản phẩm này?', 'Chấp nhận', 'Hủy', acceptCallback);
    };

    $scope.initialize();

    $scope.editProduct = function(item) {
        $scope.selectedProduct = angular.copy(item);
        $scope.ct = $scope.selectedProduct.ctsp;
        $scope.selecteDetail = angular.copy($scope.ct);
        console.log("ct" + $scope.ct);
        $scope.imagePreviews = item.image
            .map(function (img) {
                return "/assets/images/" + img.ma;
            })
            .filter(function (value, index, self) {
                return self.indexOf(value) === index;
            });
        $('#product-update-modal').modal('show');
    };
    $scope.editDetail = function (itemct) {
        $scope.selecteDetail = angular.copy(itemct);
    };


    $scope.selectedProduct = {
        ma: "",
        ten: "",
        moTa: "",
        thuongHieu: {
            id: "",
            code: ""
        },
        chatLieu: {
            id: "",
            code: ""
        },
        loaiKhachHang: {
            id: "",
            code: ""
        },
        coAo: {
            id: "",
            code: ""
        },
        image: [
            {
                ma: "",
            }
        ],
        ctsp: []
    }
    $scope.selectedDetail = {
        kichCo: {
            code: ""
        },
        mauSac: {
            code: ""
        },
        soLuong: "",
        giaNhap: "",
        giaBan: "",
        ngaySua: "",
    };

    $scope.isValidInput = function (data) {
        // Kiểm tra số lượng, giá nhập và giá bán không được bằng 0 hoặc bé hơn 0
        if (data.ctsp && data.ctsp.length > 0) {
            for (var i = 0; i < data.ctsp.length; i++) {
                if (data.ctsp[i].soLuong <= 0 || data.ctsp[i].giaNhap <= 0 || data.ctsp[i].giaBan <= 0) {
                    return false;
                }
            }
        }
        return true;
    };

    $scope.update = function () {
        if (!$scope.selectedProduct.ma || !$scope.selectedProduct.ten || !$scope.selectedProduct.thuongHieu.code || !$scope.selecteDetail.kichCo.code || !$scope.selecteDetail.mauSac.code || !$scope.selecteDetail.soLuong || !$scope.selecteDetail.giaNhap || !$scope.selecteDetail.giaBan) {
            // Hiển thị thông báo lỗi nếu có trường dữ liệu bị thiếu
            sweetalert("Vui lòng nhập đầy đủ thông tin");
            return;
        }
        $scope.selectIds = function (selectedDetail) {
            // Kiểm tra xem selectedDetail có tồn tại và có chứa kichCo không
            if (selectedDetail && selectedDetail.kichCo && selectedDetail.kichCo.code &&
                selectedDetail.mauSac && selectedDetail.mauSac.code) {
                // Kiểm tra xem kichCo có thuộc tính code không
                if (selectedDetail.kichCo.code) {
                    // Tìm và set giá trị id cho kichCo
                    selectedDetail.kichCo.id = findIdByCode($scope.kichco, selectedDetail.kichCo.code);
                }
                // Kiểm tra xem mauSac có thuộc tính code không
                if (selectedDetail.mauSac.code) {
                    // Tìm và set giá trị id cho mauSac
                    selectedDetail.mauSac.id = findIdByCode($scope.color, selectedDetail.mauSac.code);
                }
            }
        };

        // Chuẩn bị dữ liệu từ form
        var dataToSend = {
            ma: $scope.selectedProduct.ma,
            moTa: $scope.selectedProduct.moTa,
            ten: $scope.selectedProduct.ten,
            thuongHieu: {
                code: $scope.selectedProduct.thuongHieu.code
            },
            chatLieu: {
                code: $scope.selectedProduct.chatLieu.code
            },
            loaiKhachHang: {
                code: $scope.selectedProduct.loaiKhachHang.code
            },
            coAo: {
                code: $scope.selectedProduct.coAo.code
            },
            image: $scope.selectedProduct.image,
            ctsp: [{
                kichCo: {
                    id: $scope.selecteDetail.kichCo.id,
                    code: $scope.selecteDetail.kichCo.code
                },
                mauSac: {
                    id: $scope.selecteDetail.mauSac.id,
                    code: $scope.selecteDetail.mauSac.code
                },
                soLuong: $scope.selecteDetail.soLuong,
                giaNhap: $scope.selecteDetail.giaNhap,
                giaBan: $scope.selecteDetail.giaBan,
                ngaySua: new Date(),
            }]
        }

        if ($scope.isValidInput(dataToSend)) {
            // Gửi dữ liệu đến Spring Boot
            $http.put(url, dataToSend, {
                headers: {'Content-Type': 'application/json'}
            })
                .then(function (resp) {
                    // Xử lý khi cập nhật thành công
                    sweetalert("Cập nhật thành công!!")
                    $scope.reset();
                    $scope.initialize()
                    $('#product-update-modal').modal('hide');
                })
                .catch(function (err) {
                    sweetalert("Lỗi khi cập nhật lại dữ liệu")
                    console.log(err);
                });
        } else {
            sweetalert("Vui lòng kiểm tra lại các trường số lượng, giá nhập và giá bán");
        }
    };

    $scope.onFileChan = function (input) {
        var files = input.files;

        function generateImageCode(imageName) {
            return imageName.toLowerCase().replace(/\s+/g, '_');
        }

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageName = file.name;
            var reader = new FileReader();

            // Sử dụng hàm đóng để ghi lại đúng imageName
            (function (currentImageName) {
                reader.onload = function (e) {
                    $scope.$apply(function () {
                        var imageCode = generateImageCode(currentImageName);

                        // Kiểm tra xem ảnh đã tồn tại trong mảng chưa
                        var existingImage = $scope.selectedProduct.image.find(function (item) {
                            return item.ma === imageCode;
                        });

                        // Thêm ảnh mới nếu chưa tồn tại
                        if (!existingImage) {
                            $scope.selectedProduct.image.push({ma: imageCode});
                        }

                        // Loại bỏ các đối tượng ảnh rỗng
                        $scope.selectedProduct.image = $scope.selectedProduct.image.filter(function (item) {
                            return item.ma !== "";
                        });

                        // Cập nhật mảng xem trước ảnh
                        $scope.imagePreviews.push(e.target.result);
                    });
                };
            })(imageName);

            reader.readAsDataURL(file);
        }
    };


    $scope.reset = function () {
        $scope.selectedProduct = {};
        $scope.selecteDetail = {}
    }
    $scope.size = function () {
        $http.get(urlkichco).then(function (resp) {
            $scope.kichco = resp.data;
        })
    }
    $scope.mau = function (){
        $http.get(urlcolor).then(function (resp){
            $scope.color = resp.data;
        })
    }
    $scope.brands = function (){
        $http.get(urlbrand).then(function (resp){
            $scope.thuonghieu = resp.data;
        })
    }
    $scope.chat = function (){
        $http.get(urlchatlieu).then(function (resp){
            $scope.chatlieu = resp.data;
        })
    }
    $scope.loai = function (){
        $http.get(urlloaiao).then(function (resp){
            $scope.loaiao = resp.data;
        })
    }
    $scope.cao = function (){
        $http.get(urlcoao).then(function (resp){
            $scope.coao = resp.data;
        })
    }


    $scope.productData = {
        ma: "",
        ten: "",
        moTa: "",
        thuongHieu: {
            id: "",
            code: ""
        },
        chatLieu: {
            id: "",
            code: ""
        },
        loaiKhachHang: {
            id: "",
            code: ""
        },
        coAo: {
            id: "",
            code: ""
        },
        image: [
            {
                ma: "",
            }
        ],
        ctsp: []
    };

    $scope.productDetail = {
        kichCo: {
            id: "",
            code: "",
        },
        mauSac: {
            id: "",
            code: "",
        },
        soLuong: "",
        giaNhap: "",
        giaBan: "",
        ngayThem: new Date(),
        ngaySua: new Date(),
    };
    $scope.addProductDetail = function () {
        $scope.productData.ctsp.push(angular.copy($scope.productDetail));
    };
    function findIdByCode(array, code) {
        var foundItem = array.find(function (item) {
            return item.code === code;
        });
        return foundItem ? foundItem.id : null;
    }
    $scope.updateIds = function (productDetail) {
        productDetail.kichCo.id = findIdByCode($scope.kichco, productDetail.kichCo.code);
        productDetail.mauSac.id = findIdByCode($scope.color, productDetail.mauSac.code);
    };


    $scope.addProduct = function () {
        // Hàm tìm id trong mảng dựa trên mã (code)
        function findIdByCode(array, code) {
            var foundItem = array.find(function (item) {
                return item.code === code;
            });
            return foundItem ? foundItem.id : null;
        }
        // tìm mã sản phẩm để kiểm tra
        function isMaSanPhamExists(maSanPham) {
            return $scope.items.some(function (sanPham) {
                return sanPham.ma === maSanPham;
            });
        }
        var hasImages = $scope.productData.image.length > 0;
        if (!$scope.productData.ma || !$scope.productData.ten || !$scope.productData.thuongHieu.code) {
            sweetalert("Vui lòng nhập đầy đủ thông tin");
            return;
        }

        // Kiểm tra xem productData.ctsp có tồn tại không và có ít nhất một phần tử không
        if ($scope.productData.ctsp && $scope.productData.ctsp.length > 0) {

            if (isMaSanPhamExists($scope.productData.ma)) {
                sweetalert('Mã sản phẩm đã tồn tại. Vui lòng chọn mã khác.');
                return; // Dừng thực hiện hàm nếu mã đã tồn tại
            }
            // Chuẩn bị dữ liệu sản phẩm để gửi lên server
            var dataToSend = {
                ma: $scope.productData.ma,
                ten: $scope.productData.ten,
                moTa: $scope.productData.moTa,
                thuongHieu: {
                    id: findIdByCode($scope.thuonghieu, $scope.productData.thuongHieu.code),
                    code: $scope.productData.thuongHieu.code
                },
                chatLieu: {
                    id: findIdByCode($scope.chatlieu, $scope.productData.chatLieu.code),
                    code: $scope.productData.chatLieu.code
                },
                loaiKhachHang: {
                    id: findIdByCode($scope.loaiao, $scope.productData.loaiKhachHang.code),
                    code: $scope.productData.loaiKhachHang.code
                },
                coAo: {
                    id: findIdByCode($scope.coao, $scope.productData.coAo.code),
                    code: $scope.productData.coAo.code
                },
                image: hasImages ? $scope.productData.image : [],
            };

            angular.forEach(dataToSend.ctsp, function (productDetail) {
                $scope.updateIds(productDetail);
            });

            dataToSend.ctsp = angular.copy($scope.productData.ctsp);

            if ($scope.isValidInput(dataToSend)) {
                $http.post(url, dataToSend, {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                    .then(function (response) {
                        sweetalert('Thêm sản phẩm thành công.');
                        console.log(response.data);
                        location.reload();
                    })
                    .catch(function (error) {
                        console.error(error);
                        sweetalert('Có lỗi xảy ra khi thêm sản phẩm.');
                    })}
            else {
                sweetalert("Vui lòng kiểm tra lại các trường số lượng, giá nhập và giá bán không được bé hơn 0");
            }

        } else {
            sweetalert('Vui lòng thêm ít nhất một chi tiết sản phẩm.');
        }
    };


    $scope.removeProductDetail = function (index) {
        $scope.productData.ctsp.splice(index, 1);
    };
    $scope.imagePreviews = [];
    $scope.selectedFiles = [];
    $scope.onFileChange = function (input) {
        var files = input.files;

        function generateImageCode(imageName) {
            return imageName.toLowerCase().replace(/\s+/g, '_');
        }

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageName = file.name;
            var reader = new FileReader();

            // Sử dụng hàm đóng để ghi lại đúng imageName
            (function (currentImageName) {
                reader.onload = function (e) {
                    $scope.$apply(function () {
                        var imageCode = generateImageCode(currentImageName);

                        // Kiểm tra xem ảnh đã tồn tại trong mảng chưa
                        var existingImage = $scope.productData.image.find(function (item) {
                            return item.ma === imageCode;
                        });

                        // Thêm ảnh mới nếu chưa tồn tại
                        if (!existingImage) {
                            $scope.productData.image.push({ ma: imageCode });
                        }

                        // Loại bỏ các đối tượng ảnh rỗng
                        $scope.productData.image = $scope.productData.image.filter(function (item) {
                            return item.ma !== "";
                        });

                        // Cập nhật mảng xem trước ảnh
                        $scope.imagePreviews.push(e.target.result);
                    });
                };
            })(imageName);

            reader.readAsDataURL(file);
        }
    };

    $scope.removeImagePreview = function (index) {
        $scope.imagePreviews.splice(index, 1);
        $scope.selectedFiles.splice(index, 1);
        $scope.productData.image.splice(index,1);
    };






});