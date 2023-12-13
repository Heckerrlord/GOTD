app.controller("rating-ctrl", function ($scope, $http,$timeout) {
    var url = "/rest/danhgia";

    $scope.items = []
    $scope.getAll = function (){
        $http.get(url).then(function (reso){
            $scope.items = reso.data;
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

        })
    }

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


    $scope.getAll();


    $scope.accept = function (item){
        // Hàm callback để thực hiện duyệt đơn khi người dùng xác nhận
        var acceptCallback = function () {
            item.trangThai = 1;
            $http.put(`${url}/duyet-don`, item)
                .then(function (resp){
                    console.log('Duyệt đơn thành công:', resp.data);
                    sweetalert( 'Duyệt đánh giá thành công');
                })
                .catch(function(error) {
                    console.error('Lỗi khi duyệt đơn:', error);
                    sweetalert( 'Lỗi khi duyệt đánh giá');
                });
        };

        // Hiển thị hộp thoại xác nhận trước khi thực hiện duyệt đơn
        confirmAction('warning', 'Xác nhận duyệt đánh giá này?', 'Bạn có chắc muốn duyệt đánh?', 'Duyệt', 'Hủy', acceptCallback);
    };



    $scope.delete = function(item) {
        // Hàm callback để thực hiện xóa khi người dùng xác nhận
        var deleteCallback = function () {
            $http.delete(`${url}/${item.id}`)
                .then(function(response) {
                    console.log('Xóa thành công:', response.data);
                    $scope.getAll();
                    sweetalert('Xóa đánh giá thành công');
                })
                .catch(function(error) {
                    console.error('Lỗi khi xóa:', error);
                    sweetalert('Xóa đánh giá không thành công');
                });
        };

        // Hiển thị hộp thoại xác nhận trước khi thực hiện xóa
        confirmAction('warning', 'Xác nhận xóa?', 'Bạn có chắc muốn xóa?', 'Xóa', 'Hủy', deleteCallback);
    };


    $scope.countPendingReviews = function() {
        return $scope.items.filter(function(item) {
            return item.trangThai === 0;
        }).length;
    };

    $scope.countApprovedReviews = function() {
        return $scope.items.filter(function(item) {
            return item.trangThai === 1;
        }).length;
    };







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