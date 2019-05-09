$(function () {
    $("#rpassword").blur(function () {
        var password = $("#password").val();
        var rpassword = $("#rpassword").val();
        if (password != "") {
            if (password != rpassword) {
                $(".error-pass").html("<i data-toggle=\"pass\" title=\"Mật khẩu không khớp\"" +
                    "  style=\"color: red; right:10px\" class=\"fas fa-exclamation-circle\"></i>").addClass("show-error");
            } else {
                $(".error-pass").html("<i style=\"color: green; right:10px\" class=\"far fa-check-circle\"></i>").addClass("show-error");
            }
        }
    });

    $("#user").blur(function () {
        var user = $("#user").val();
        var result;
        $.ajax({
            url: "api/check-username",
            type: "post",
            dataType: "text",
            data: {username: user},
            success: function (resp) {
                if (user != "") {
                    if (resp == "false") {
                        $("#error-user").html("<i data-toggle=\"user\" title=\"Tài khoản đã tồn tại\"" +
                            "style=\"color: red; right:10px\" class=\"fas fa-exclamation-circle\"></i>").addClass("show-error");
                    } else {
                        $("#error-user").html("<i style=\"color: green; right:10px\" class=\"far fa-check-circle\"></i>").addClass("show-error");
                    }
                }
            }
        });
    });

    $("#email").blur(function () {
        var email = $("#email").val();
        $.ajax({
            url: "api/check-email",
            type: "post",
            dataType: "text",
            data: {email: email},
            success: function (resp) {
                if (email != "") {
                    if (resp == "false") {
                        $(".error-email").html("<i data-toggle=\"mail\" title=\"Email đã tồn tại\"" +
                            "  style=\"color: red; right:10px\" class=\"fas fa-exclamation-circle\"></i>")
                            .addClass("show-error");
                    } else {
                        $(".error-email").html("<i style=\"color: green; right:10px\" class=\"far fa-check-circle\"></i>")
                            .addClass("show-error");
                    }
                }
            }
        });
    });
    $("#rpassword").focus(function () {
        $(".error-pass").removeClass("show-error");
    });
    $("#password").focus(function () {
        $(".error-pass").removeClass("show-error");
        $(".pa").html("");
    });
    $("#user").focus(function () {
        $("#error-user").removeClass("show-error");
        $(".us").html("");
    });
    $("#email").focus(function () {
        $(".error-email").removeClass("show-error");
        $(".em").html("");
    });
    $('[data-toggle="pass"]').tooltip();
    $('[data-toggle="user"]').tooltip();
    $('[data-toggle="mail"]').tooltip();
});
