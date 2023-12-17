app.controller("diachi-ctrl", function ($scope, $http,$q) {
    var apiUrl = '/rest/orders';
    var  urlSp = '/rest/sanPham/soluong';
    var urlAc = '/rest/accounts/soluong'


    $scope.years = [];
    $scope.selectedYear = null;
    $scope.doanhThuNam = null;
    $scope.doanhHientai = null;
    $scope.doanhThuThang = [];
    $scope.doanhThu7Ngay = null;
    $scope.doanhThuKhoangThoiGian = null;
    $scope.soLuongSanPham = null;
    $scope.soLuongTaiKhoan = null;
    $scope.soLuongDon = null;
    $scope.tkSPTuan = null


    $scope.tkSanPhamTuan = function (){
        $http.get(apiUrl + '/tksanpham/tuan').then(function (resp){
            $scope.tkSPTuan = resp.data;
            console.log("thu thao" + $scope.tkSPTuan)
        });
    }
    $scope.tkSanPhamTuan()

    $scope.xemSPTheoKhoang = function () {
        var formattedStartDate = moment($scope.sevenDaysAgo).format('DD/MM/YYYY');
        var formattedEndDate = moment($scope.currentDate).format('DD/MM/YYYY');

        $http.get(`${apiUrl}/sp/ngay?sevenDaysAgo=` + formattedStartDate + '&currentDate=' + formattedEndDate).then(function (resp) {
            $scope.tkSPTuan = resp.data;
        });
    };

    $scope.getYears = function () {
        $http.get(apiUrl + '/nam').then(function (resp) {
            $scope.years = resp.data;

            if ($scope.years && $scope.years.length > 0) {
                // Sắp xếp danh sách năm theo thứ tự giảm dần
                $scope.years.sort(function (a, b) {
                    return b - a;
                });

                // Chọn năm mới nhất
                $scope.selectedYear = $scope.years[0];

                // Gọi hàm để lấy doanh thu theo năm mới chọn
                $scope.getDoanhThuNam($scope.selectedYear);
                $scope.getDoanhThuThang($scope.selectedYear)
                $scope.doanhThu7Ngay;
                $scope.doanhHientai;
            }
        });
    };

    $scope.getDoanhThuNam = function (year) {
        $http.get(`${apiUrl}/doanhthu/nam?year=` + year).then(function (resp) {
            $scope.doanhThuNam = resp.data;

        });
    };

    $scope.drawBarChart = function () {

        var ctx = document.getElementById('barChart').getContext('2d');
        // kiểm tra xem có biểu đồ của năm nào không
        var existingChart = Chart.getChart(ctx);
        // xóa đi biều đồ đang có
        if (existingChart) {
            existingChart.destroy();
        }
        // vẽ biểu đồ
        var allMonths = Array.from({ length: 12 }, (_, index) => index + 1);
        var data = allMonths.map(function (month) {
            var matchingData = $scope.doanhThuThang.find(function (item) {
                return item[1] === month;
            });
            return matchingData ? matchingData[0] : 0;
        });

        var barChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: allMonths.map(function (month) {
                    return 'Tháng ' + month;
                }),
                datasets: [{
                    label: 'Doanh thu',
                    data: data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',  // Đỏ
                        'rgba(54, 162, 235, 0.2)', // Xanh lam
                        'rgba(255, 206, 86, 0.2)', // Vàng
                        'rgba(75, 192, 192, 0.2)', // Xanh nước biển
                        'rgba(153, 102, 255, 0.2)', // Tím
                        'rgba(255, 159, 64, 0.2)', // Cam
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function (value, index, values) {
                                return value.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                            }
                        }
                    }
                }
            }
        });
    };

    $scope.getDoanhThuThang = function (selectedYear) {

        $http.get(`${apiUrl}/doanhthu/thang?year=` + selectedYear).then(function (resp) {
            $scope.doanhThuThang = resp.data;
            $scope.drawBarChart();
        });
    };

    $scope.exportDoanhThuThangToExcel = function () {
        // Tạo một mảng chứa dữ liệu
        var data = [['Tháng', 'Doanh Thu']];

        // Thêm dữ liệu
        $scope.doanhThuThang.forEach(function (item) {
            data.push([item[1], item[0]]);
        });

        // Tạo worksheet
        var ws = XLSX.utils.aoa_to_sheet(data);

        // Tạo workbook và thêm worksheet vào đó
        var wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Doanh Thu Tháng');

        // Thêm tiêu đề cho worksheet và cấu hình ô
        ws['A1'].s = { font: { color: { rgb: 'FFFF0000' } } }; // Đỏ
        ws['B1'].s = { font: { color: { rgb: 'FFFF00' } }, fill: { fgColor: { rgb: 'FF0000FF' } } }; // Vàng

        // Xuất file Excel
        XLSX.writeFile(wb, 'doanh-thu-thang.xlsx');
    };




    $scope.thongKeDoanhThu7NgayGanNhat = function () {
        var currentDate = new Date();
        var sevenDaysAgo = new Date();
        sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);

        var formattedCurrentDate = moment(currentDate).format('DD/MM/YYYY');
        var formattedSevenDaysAgo = moment(sevenDaysAgo).format('DD/MM/YYYY');



        $http.get(`${apiUrl}/doanhthu/7ngay?sevenDaysAgo=` + formattedSevenDaysAgo + '&currentDate=' + formattedCurrentDate).then(function (resp) {
            $scope.doanhThu7Ngay = resp.data;

        });
    };



    $scope.xemTheoKhoang = function () {
        var formattedStartDate = moment($scope.sevenDaysAgo).format('DD/MM/YYYY');
        var formattedEndDate = moment($scope.currentDate).format('DD/MM/YYYY');

        $http.get(`${apiUrl}/doanhthu/7ngay?sevenDaysAgo=` + formattedStartDate + '&currentDate=' + formattedEndDate).then(function (resp) {
            $scope.doanhThuKhoangThoiGian = resp.data;

            $scope.formattedStartDate = formattedStartDate;
            $scope.formattedEndDate = formattedEndDate;
            $scope.showDateRange = true;

        });
    };

    $scope.getDoanhthuHientai = function (){
        $http.get(`${apiUrl}/doanhthu/hientai`).then(function (resp){
            $scope.doanhHientai = resp.data;

        })
    }

    $scope.getAc = function (){
        $http.get(`${urlAc}`).then(function (resp){
            $scope.soLuongTaiKhoan = resp.data;
        })
    }
    $scope.getSp = function (){
        $http.get(`${urlSp}`).then(function (resp){
            $scope.soLuongSanPham = resp.data;
        })
    }
    $scope.getDon = function (){
        $http.get(`${apiUrl}/soluong`).then(function (resp){
            $scope.soLuongDon = resp.data;
        })
    }


    // $scope.doanhthungay = function () {
    //     $http.get(`${apiUrl}/doanhthu/ngay`).then(function (response) {
    //         const data = response.data;
    //         const labels = data.map(item => moment(item[0]).format('DD/MM/YYYY')); // Định dạng ngày dd/mm/yyyy
    //         const values = data.map(item => item[1]);
    //
    //         const ctx = document.getElementById('myLineChart').getContext('2d');
    //         const myLineChart = new Chart(ctx, {
    //             type: 'line',
    //             data: {
    //                 labels: labels,
    //                 datasets: [{
    //                     label: 'Doanh Thu:',
    //                     data: values,
    //                     borderColor: 'rgb(75, 192, 192)',
    //                     borderWidth: 2,
    //                     fill: false
    //                 }]
    //             },
    //             options: {
    //                 scales: {
    //                     x: {
    //                         display: false
    //                     },
    //                     y: {
    //                         title: {
    //                             display: true,
    //                             text: 'Doanh Thu'
    //                         }
    //                     }
    //                 },
    //                 plugins: {
    //                     zoom: {
    //                         pan: {
    //                             enabled: true,
    //                             mode: 'x',
    //                         },
    //                         zoom: {
    //                             enabled: true,
    //                             mode: 'x',
    //                         }
    //                     }
    //                 }
    //             }
    //         });
    //     });
    // };
    //








    // $scope.doanhthungay();
    $scope.getDoanhthuHientai();
    $scope.getDon();
    $scope.getAc();
    $scope.getSp();
    $scope.thongKeDoanhThu7NgayGanNhat();
    $scope.getYears();



});
