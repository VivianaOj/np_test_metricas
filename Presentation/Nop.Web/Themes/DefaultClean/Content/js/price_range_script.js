var pathnamesearch = "/Search";

$(document).ready(function () {

    var count = 0;
    var qprice = qs["price"];
    var step = 50;

    if (qprice) {
        var data = qprice.split('-');
        $("#min_price").val(data[0]);
        $("#max_price").val(data[1]);
        $(".selected-options").show();
        document.getElementById("selected-min-lb").innerText = data[0];
        document.getElementById("selected-max-lb").innerText = data[1];
       
    } else {
        $(".selected-options").hide();
    }


    var min_price_range = parseInt($("#min_price").val());
    var max_price_range = parseInt($("#max_price").val());
    var select_valiue = parseInt($("#min_price").attr("min"));
     
    if (min_price_range > max_price_range) {
        $('#max_price').val(min_price_range);
        document.getElementById("selected-max-lb").innerText = min_price_range;
       
    }
    var difertent = (parseInt(max_price_range) - parseInt(min_price_range));
    if (difertent < 50) {
        step = difertent;
    }
 
    //$("#min_price,#max_price").on("paste keyup", function () {

    //    //cosole.log("estamos");
    //    var min_price_range = parseInt($("#min_price").val());
    //    var max_price_range = parseInt($("#max_price").val());

    //    if (min_price_range == max_price_range) {

    //        max_price_range = min_price_range + 100;

    //        $("#min_price").val(min_price_range);
    //        $("#max_price").val(max_price_range);

    //        $("#min-price-select").val(min_price_range);
    //        //createRute(max_price_range, max_price_range);
    //    }

    //    $("#slider-range").slider({
    //        values: [min_price_range, max_price_range],
    //        values: 50
    //    });
    //    // createRute(max_price_range, min_price_range);
    //});


    $(function () {
        $("#slider-range").slider({
            range: true,
            orientation: "horizontal",
            min: min_price_range,
            max: max_price_range,
            values: [select_valiue, max_price_range],
            step: step,
            slide: function (event, ui) {
                if (ui.values[0] == ui.values[1]) {
                    return false;
                }
                $("#min_price").val(ui.values[0]);
                $("#max_price").val(ui.values[1]);

                document.getElementById("selected-min-lb").innerText = ui.values[0];
                document.getElementById("selected-max-lb").innerText = ui.values[1];
                //  createRute(ui.values[0], ui.values[1]);
            }
        });
        $("#min_price").val($("#slider-range").slider("values", 0));
        $("#max_price").val($("#slider-range").slider("values", 1));
    });

    //$("#slider-range").click(function () {

    //  var min_price = $('#min_price').val();
    //  var max_price = $('#max_price').val();

    //	console.log("Here List of products will be shown which are cost between " + min_price + " " + "and" + " " + max_price + ".");
    //});

    $("#slider-range").slider({
        change: function (event, ui) { }
    });

    $("#slider-range").on("slidechange", function (event, ui) {
        //console.log($("#btn-filter-price").attr("href"));
        count++;

        if (count > 2) {
            var selectprice = document.getElementsByClassName("price-range-select-ranges");
            if (selectprice.length > 0) {

                var url = createRute(ui.values[0], ui.values[1]);
                history.pushState(null, "", url);
                console.log(ui.values[0]+" "+ ui.values[1]);

                $.ajax({
                    cache: false,
                    async: true,
                    type: "GET",
                    url: url,
                    success: function (responce) {
                        //console.log(responce);
                        var list = $("<div>").append(responce).find("#list-products").html();
                        $("#list-products").html('');
                        $("#list-products").html(list);
                    },
                    error: function () {
                        console.error("no hay response");
                    }
                });

                $(".selected-options").show();

            } else {
                var url = createRute(ui.values[0], ui.values[1]);
                window.location = url;
                // $("#btn-filter-price").attr("href", url);
            }
            // console.log(selectprice);
        }
    });


    $("#btn-filter-price").on("click", function () {

        var min = $("#min_price").val();
        var max = $("#max_price").val()
        if (!min) {
            $("#min_price").val(0);
            min = 0;
        }
        if (!max) {
            $("#max_price").val(0);
            max = 0;
        }

        if (parseInt(min) > parseInt(max)) {
            $('#max_price').val(min);
            document.getElementById("selected-max-lb").innerText = min;
        }
        pathnamesearch = "/Search";

        var url = createRute(min, max);
        window.location = url;
    });

});


function createRute(max, min) {
    est = qs["q"];
    var ptTo = min;
    var pfFrom = max;
    var adv = "true";
    var sid = "true";
    var mid = "0";

    var mid = "0";
    var cid = "0";
    var vid = "0";
    var isc = "true";
    var order = qs["orderby"];
    var _id = qs["_"];
    var pnumber = qs["pagenumber"];


    if (est == '' || est == undefined) {
        est = '';
    } else {
        est = "&q=" + est;
    }
    //console.log(order);
    if (_id == '' || _id == undefined) {
        _id = '';
    } else {
        _id = "&_=" + _id;
    }
    if (order == '' || order == undefined) {
        order = '';
    } else {
        order = "&orderby=" + order;
    }
    if (pnumber == '' || pnumber == undefined) {
        pnumber = '';
    } else {
        pnumber = "&pagenumber=" + pnumber;
    }

    var path = window.location.pathname;

    // var pageIndex = "&pageSize=6&viewMode=grid&orderBy=5&pageNumber=1";
    var strOutEnd = '';

    if (path.toLowerCase() == pathnamesearch.toLowerCase()) {
        strOutEnd = "&pt=" + ptTo + "&pf=" + pfFrom + "&adv=" + adv + "&sid=" + sid 
            "&mid=" + mid + "&cid=" + cid + "&vid=" + vid + "&isc=" + isc + _id + order;
    } else {
        strOutEnd = _id + order;
    }

    var price = "price=" + pfFrom + "-" + ptTo;
    // $("#btn-filter-price").attr("href", "/Search?q=" + est + "&" + strOutEnd + "&" + price);
    /*filterPrice*/

    var url = path + "?" + price + est + strOutEnd;
    return url;
}

//UTILITIES
var qs = (function (a) {
    if (a == "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i) {
        var p = a[i].split('=', 2);
        if (p.length == 1)
            b[p[0]] = "";
        else
            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
})(window.location.search.substr(1).split('&'));



var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',

    // These options are needed to round to whole numbers if that's what you want.
    //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
    //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
});

