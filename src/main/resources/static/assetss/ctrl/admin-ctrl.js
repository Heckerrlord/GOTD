var app = angular.module("admin-app", ["ngRoute"]);

app.config(function ($routeProvider) {
    $routeProvider
        .when("/account", {
            templateUrl: "/admin/account/index.html",
            controller: "account-ctrl"
        })
        .when("/product", {
            templateUrl: "/admin/product/index.html",
            controller: "product-ctrl"
        })
        .when("/doanhthu", {
            templateUrl: "/admin/doanhthu/index.html",
            controller: "an-ctrl"
        })
        //bd
        .when("/color", {
            templateUrl: "/admin/phu/color/index.html",
            controller: "colors-ctrl"
        })
        .when("/kichco", {
            templateUrl: "/admin/phu/kichco/index.html",
            controller: "kichco-ctrl"
        })
        .when("/chatlieu", {
            templateUrl: "/admin/phu/chatlieu/index.html",
            controller: "chatlieu-ctrl"
        })
        .when("/coao", {
            templateUrl: "/admin/phu/coao/index.html",
            controller: "coao-ctrl"
        })
        .when("/loaikhachhang", {
            templateUrl: "/admin/phu/loaikhachhang/index.html",
            controller: "loaikhachhang-ctrl"
        })
        .when("/thuonghieu", {
            templateUrl: "/admin/phu/thuonghieu/index.html",
            controller: "thuonghieu-ctrl"
        })
        .when("/diachi", {
            templateUrl: "/admin/phu/diachi/index.html",
            controller: "diachi-ctrl"
        })
        .when("/magiamgia", {
            templateUrl: "/admin/phu/magiamgia/index.html",
            controller: "magiamgia-ctrl"
        })
        //het
        .when("/category", {
            templateUrl: "/admin/category/index.html",
            controller: "category-ctrl"
        })
        .when("/authorize", {
            templateUrl: "/admin/authority/index.html",
            controller: "authority-ctrl"
        })
        .when("/unauthorized", {
            templateUrl: "/admin/authority/unauthorized.html",
            controller: "authority-ctrl"
        })
        .when("/order", {
            templateUrl: "/admin/order/index.html",
            controller: "order-ctrl"
        })
        .when("/sanpham", {
            templateUrl: "/admin/sanpham/index.html",
            controller: "sanpham-ctrl"
        })

        .otherwise({
            templateUrl: "/admin/dashboard.html",
            controller: "diachi-ctrl"
        });
});