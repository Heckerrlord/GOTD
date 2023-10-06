app.controller("order-ctrl", function ($scope, $http) {
    var url = "/rest/accounts";
    var url1 = "/rest/roles";
    // var url2 = "/rest/upload/images";
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

    $scope.initialize = function () {
        //load account
        $http.get(url).then(resp => {
            $scope.items = resp.data;
        });

        //load roles
        $http.get(url1).then(resp => {
            $scope.roles = resp.data;
        })
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