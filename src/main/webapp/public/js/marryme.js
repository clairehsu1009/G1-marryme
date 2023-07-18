// -------RWD 側邊欄---------
$(function () {
    $("#header_menu_main").bind("click", function (event) {
        var header_menu = $("#header_menu");
        var body = $("body");
        var html = $("html");
        var width = document.documentElement.clientWidth < 375 ? 270 : 320;
        $(header_menu).css('transform', "translate(" + (-(width + 50)) + "px, 0)").show();
        $(header_menu).css('-webkit-translate', "translate(" + (-(width + 50)) + "px, 0)").show();
        $(header_menu).css('-moz-translate', "translate(" + (-(width + 50)) + "px, 0)").show();
        if ($("#Header_menu_overlay").length == 0) {
            $(header_menu).css('width', width + "px");
            $(header_menu).css("transition", "transform 0.6s ease");
            $(header_menu).css("-webkit-transition", "transform 0.6s ease");
            $(header_menu).css("-moz-transition", "transform 0.6s ease");
            $(header_menu).css("z-index", "99999");
            $(body).append("<div id='Header_menu_overlay' style='position:fixed;z-index:9999;width:100%;height:100%;background-color: #000;top:0px;left:0px;opacity:0; display:none;' onclick='hide_header_menu();'></div>");
        }
        var Header_menu_overlay = $("#Header_menu_overlay");
        $(header_menu).css('transform', "translate(0px, 0)");
        $(header_menu).css('-webkit-translate', "translate(0px, 0)");
        $(header_menu).css('-moz-translate', "translate(0px, 0)");
        $(Header_menu_overlay).show();
        $(Header_menu_overlay).css("transition:", "opacity 0.8s ease");
        $(Header_menu_overlay).css("-webkit-transition", "opacity 0.8s ease");
        $(Header_menu_overlay).css("-moz-transition", "opacity 0.8s ease");
        $(Header_menu_overlay).css("opacity", "0.6");
        $(Header_menu_overlay).css("-webkit-tap-highlight-color", "rgba(0,0,0,0)");
        $(html).css("width", "100%");
        $(html).css("height", "100%");
        $(html).css("overflow", "hidden");
        $(body).css("width", "100%");
        $(body).css("height", "100%");
        $(body).css("overflow", "hidden");
    });

    $("#header_menu_close, #header_menu .menu_close").bind("click", function (event) {
        hide_header_menu();
    });
});

function hide_header_menu() {
    var width = parseInt($("#header_menu").css('width'));
    var header_menu = $("#header_menu");
    var body = $("body");
    var html = $("html");
    var Header_menu_overlay = $("#Header_menu_overlay");
    $(header_menu).css('transform', "translate(" + (-(width + 50)) + "px, 0)").hide();
    $(header_menu).css('-webkit-translate', "translate(" + (-(width + 50)) + "px, 0)").hide();
    $(header_menu).css('-moz-translate', "translate(" + (-(width + 50)) + "px, 0)").hide();
    $(Header_menu_overlay).css("opacity", "0");
    $(Header_menu_overlay).css("display", "none");
    $("#kwds").val('');
    setTimeout(function () {
        $(Header_menu_overlay).remove();
    }, 610);
    $(html).css("width", "");
    $(html).css("height", "");
    $(html).css("overflow", "");
    $(body).css("width", "");
    $(body).css("height", "");
    $(body).css("overflow", "");
}

// -------導覽列搜尋欄(自己改寫)----------
$(document).ready(function () {
    // 預設將 input 隱藏
    $('#kwds_bid').hide();

    // 點擊搜尋按鈕或 <a> 標籤時切換 input 的顯示和隱藏
    $('#search_submit_btn, .btn_search a').on('click', function (event) {
        event.preventDefault(); // 防止預設行為
        $('#kwds_bid').toggle(); // 切換 input 的顯示和隱藏
    });

    // 點擊頁面其他地方
    $(document).on('click', function (event) {
        if (!$(event.target).closest('#kwds_rs_bid').length) {
            $('#kwds_bid').hide(); // 隱藏 input
        }
    });


});

// -------登入頭像hover-------
function toggle_sub_m(btn_id, id, type) {
    if ($("#" + id).is(":visible") && type == false) {
        $("#" + btn_id).find('i').html('▼'); $("#" + id).slideUp(300);
        $("body").unbind('click.toggle_sub_m_' + id);
        $("#" + id).unbind('mouseleave.toggle_sub_m_' + id);
    } else if (!$("#" + id).is(":visible") && type == true) {
        $("#" + btn_id).find('i').html('▲');
        $("#" + id).slideDown(300);
        setTimeout(function () {
            $("body").bind('click.toggle_sub_m_' + id, function () {
                toggle_sub_m(btn_id, id, false);
            });
            $("#" + id).bind('mouseleave.toggle_sub_m_' + id, function () {
                toggle_sub_m(btn_id, id, false);
            });
        }, 500);
    }
}