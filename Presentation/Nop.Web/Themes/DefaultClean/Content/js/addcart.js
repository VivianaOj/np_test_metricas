function O_UpdateProducts(id, increment, validIncrement, IncrementQuantity, quantityMessage, oldValue, changeInput) {
    var value = $("#O_itemquantity" + id).val();
    var value = $("#O_itemquantity_mobile" + id).val();


    if (changeInput) {
        var NewValue = parseInt(value) + parseInt(IncrementQuantity);
        $("#O_itemquantity" + id).val(NewValue);
        $("#O_itemquantity_mobile" + id).val(NewValue);
    }

    if (increment) {

        if (validIncrement == true) {

            $("#O_itemquantity" + id).val(NewValue);
            $("#O_itemquantity_mobile" + id).val(NewValue);

            var numero = value / IncrementQuantity;
            if (Number.isInteger(numero)) {
                var newValue = parseInt(value);
                if (newValue == 0) {
                    $("#O_quantitySelectorMinus_" + id).css("opacity", "0.5");
                }
                $.ajax({
                    type: 'POST',
                    async: true,
                    url: "/UpdateCartItem",
                    data: $("#shopping-cart-form-sumary").serialize(),
                    dataType: 'json',
                    success: function (data) {

                        if (data.TotalProducts != null) {
                            $("#O_TotalProducts").html("");
                            $("#O_TotalProducts").html(data.TotalProducts + " item(s)");

                            $("#O_itemquantity" + id).val(NewValue);
                            $("#O_itemquantity_mobile" + id).val(NewValue);
                        }

                        if ($("#TotalShoppingCartItems")) {
                            $("#TotalShoppingCartItems").html("");
                            $("#TotalShoppingCartItems").html("(" + data.TotalProducts + ")");
                        }

                        if (data.TotalProducts == null || data.TotalProducts == 0) {
                            location.reload();
                        }

                        if (newValue <= 0) {
                            $("#O_ItemProd_" + id).remove();
                        }

                        var itemTotal = data.Items.find(x => x.Id == id);
                        if (itemTotal != undefined) {
                            if (itemTotal.SubTotal != null) {


                                $("#O_SubTotal" + id).html("");
                                $("#O_SubTotal" + id).html(itemTotal.SubTotal)

                                $("#O_SubTotal_mobile" + id).html("");
                                $("#O_SubTotal_mobile" + id).html(itemTotal.SubTotal)


                            }

                            if (itemTotal.Discount != null) {
                                $("#O_ItemDiscount" + id).html("");
                                $("#O_ItemDiscount" + id).html("You save:<br>" + itemTotal.Discount);
                            }

                            if (data.SubTotal != null) {


                                $("#O_SubTotal").html("");
                                $("#O_SubTotal").html(data.SubTotal)

                                $("#O_SubTotal_mobile").html("");
                                $("#O_SubTotal_mobile").html(data.SubTotal)


                            }
                        }
                        else {
                            if (data.SubTotal != null) {
                                $("#O_SubTotal").html("");
                                $("#O_SubTotal").html(data.SubTotal)

                                $("#O_SubTotal_mobile").html("");
                                $("#O_SubTotal_mobile").html(data.SubTotal)


                            }
                        }

                        var itemUnitPrice = data.Items.find(x => x.Id == id);
                        if (itemUnitPrice != undefined) {
                            if (itemUnitPrice.UnitPrice != null) {
                                $("#UnitPrice_" + id).html("");
                                $("#UnitPrice_" + id).html(itemUnitPrice.UnitPrice)
                            }


                            if (data.UnitPrice != null) {
                                $("#UnitPrice_").html("");
                                $("#UnitPrice_").html(data.UnitPrice)
                            }
                        }
                        else {
                            if (data.UnitPrice != null) {
                                $("#UnitPrice_").html("");
                                $("#UnitPrice_").html(data.UnitPrice)
                            }
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                });
            } else {
                $("#O_itemquantity" + id).val(oldValue);
                $("#O_itemquantity_mobile" + id).val(oldValue);
            }
        }
        else {


            var newValue = parseInt(value);
            if (newValue == 0) {
                $("#O_quantitySelectorMinus_" + id).css("opacity", "0.5");
            }
            $.ajax({
                type: 'POST',
                async: true,
                url: "/UpdateCartItem",
                data: $("#shopping-cart-form-sumary").serialize(),
                dataType: 'json',
                success: function (data) {

                    if (data.TotalProducts != null) {
                        $("#O_TotalProducts").html("");
                        $("#O_TotalProducts").html(data.TotalProducts + " item(s)");
                    }

                    if ($("#TotalShoppingCartItems")) {
                        $("#TotalShoppingCartItems").html("");
                        $("#TotalShoppingCartItems").html("(" + data.TotalProducts + ")");
                    }

                    if (data.TotalProducts == null || data.TotalProducts == 0) {
                        location.reload();
                    }

                    if (newValue <= 0) {
                        $("#O_ItemProd_" + id).remove();
                    }

                    var itemTotal = data.Items.find(x => x.Id == id);
                    if (itemTotal != undefined) {
                        if (itemTotal.SubTotal != null) {
                            $("#O_SubTotal" + id).html("");
                            $("#O_SubTotal" + id).html(itemTotal.SubTotal)

                            $("#O_SubTotal_mobile" + id).html("");
                            $("#O_SubTotal_mobile" + id).html(itemTotal.SubTotal)
                        }

                        if (itemTotal.Discount != null) {
                            $("#O_ItemDiscount" + id).html("");
                            $("#O_ItemDiscount" + id).html("You save:<br>" + itemTotal.Discount);
                        }

                        if (data.SubTotal != null) {
                            $("#O_SubTotal").html("");
                            $("#O_SubTotal").html(data.SubTotal)

                            var value = data.SubTotal;
                            var formattedValue = parseFloat(value).toFixed(2);
                            const numero = formattedValue;
                            const formateador = new Intl.NumberFormat('en-EN');
                            const numeroFormateado = formateador.format(numero);


                            $("#O_SubTotal").html("");
                            $("#O_SubTotal").html(numeroFormateado)

                            $("#O_SubTotal_mobile").html("");
                            $("#O_SubTotal_mobile").html(numeroFormateado)

                    /*
                            let totalModel = data.SubTotal;
                            let patron = /^\d+(\.\d+)?$/;
                            let match = totalModel.match(patron);

                            if (match) {
                                let numDecimales = match[1] ? match[1].length - 1 : 0;
                                if (numDecimales == 0) {
                                    $("#O_SubTotal").html("");
                                    $("#O_SubTotal").html(numeroFormateado + ".00")

                                    $("#O_SubTotal_mobile").html("");
                                    $("#O_SubTotal_mobile").html(numeroFormateado + ".00")
                                }

                                if (numDecimales == 1) {
                                    $("#O_SubTotal").html("");
                                    $("#O_SubTotal").html(numeroFormateado + "0")

                                    $("#O_SubTotal_mobile").html("");
                                    $("#O_SubTotal_mobile").html(numeroFormateado + "0")
                                }
                            }
                            */
                        }
                    }
                    else {
                        if (data.SubTotal != null) {
                            $("#O_SubTotal").html("");
                            $("#O_SubTotal").html(data.SubTotal)

                            $("#O_SubTotal_mobile").html("");
                            $("#O_SubTotal_mobile").html(data.SubTotal)
                        }
                    }

                    var itemUnitPrice = data.Items.find(x => x.Id == id);
                    if (itemUnitPrice != undefined) {
                        if (itemUnitPrice.UnitPrice != null) {
                            $("#UnitPrice_" + id).html("");
                            $("#UnitPrice_" + id).html(itemUnitPrice.UnitPrice)
                        }


                        if (data.UnitPrice != null) {
                            $("#UnitPrice_").html("");
                            $("#UnitPrice_").html(data.UnitPrice)
                        }
                    }
                    else {
                        if (data.UnitPrice != null) {
                            $("#UnitPrice_").html("");
                            $("#UnitPrice_").html(data.UnitPrice)
                        }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        }
    }
    else {


        var newValue = parseInt(value);

        if (changeInput) {
            var NewValue2 = parseInt(value) - parseInt(IncrementQuantity);
            if (NewValue2 == 0) {
                $("#O_quantitySelectorMinus_" + id).css("opacity", "0.5");
            }

            if (NewValue2 == 0) {
                window.location.reload()
            }

            $("#O_itemquantity" + id).val(NewValue2);
            $("#O_itemquantity_mobile" + id).val(NewValue2);
        }


        if (NewValue2 == 0) {
            window.location.reload()
        }

        if (newValue == 0) {
            $("#O_quantitySelectorMinus_" + id).css("opacity", "0.5");
        }
        $.ajax({
            type: 'POST',
            async: true,
            url: "/UpdateCartItem",
            data: $("#shopping-cart-form-sumary").serialize(),
            dataType: 'json',
            success: function (data) {

                if (data.TotalProducts != null) {
                    $("#O_TotalProducts").html("");
                    $("#O_TotalProducts").html(data.TotalProducts + " item(s)");
                }

                if ($("#TotalShoppingCartItems")) {
                    $("#TotalShoppingCartItems").html("");
                    $("#TotalShoppingCartItems").html("(" + data.TotalProducts + ")");
                }

                if (data.TotalProducts == null || data.TotalProducts == 0) {
                    location.reload();
                }

                if (newValue <= 0) {
                    $("#O_ItemProd_" + id).remove();
                }

                var itemTotal = data.Items.find(x => x.Id == id);
                if (itemTotal != undefined) {
                    if (itemTotal.SubTotal != null) {
                        $("#O_SubTotal" + id).html("");
                        $("#O_SubTotal" + id).html(itemTotal.SubTotal)

                        $("#O_SubTotal_mobile" + id).html("");
                        $("#O_SubTotal_mobile" + id).html(itemTotal.SubTotal)
                    }

                    if (itemTotal.Discount != null) {
                        $("#O_ItemDiscount" + id).html("");
                        $("#O_ItemDiscount" + id).html("You save:<br>" + itemTotal.Discount);
                    }

                    if (data.SubTotal != null) {

                        $("#O_SubTotal").html("");
                        $("#O_SubTotal").html(data.SubTotal)

                        $("#O_SubTotal_mobile").html("");
                        $("#O_SubTotal_mobile").html(data.SubTotal)
                        /*
                        var value = data.SubTotal;
                        var formattedValue = parseFloat(value).toFixed(2);
                        const numero = formattedValue;
                        const formateador = new Intl.NumberFormat('en-EN');
                        const numFormat = formateador.format(numero);


                        $("#O_SubTotal").html("");
                        $("#O_SubTotal").html(numFormat)

                        $("#O_SubTotal_mobile").html("");
                        $("#O_SubTotal_mobile").html(numFormat)


                        let totalModel = data.SubTotal;
                        let patron = /^\d+(\.\d+)?$/;
                        let match = totalModel.match(patron);

                        if (match) {
                            let numDecimal = match[1] ? match[1].length - 1 : 0;
                            if (numDecimal == 0) {
                                $("#O_SubTotal").html("");
                                $("#O_SubTotal").html(numFormat + ".00")

                                $("#O_SubTotal_mobile").html("");
                                $("#O_SubTotal_mobile").html(numFormat + ".00")
                            }
                            if (numDecimal == 1) {
                                $("#O_SubTotal").html("");
                                $("#O_SubTotal").html(numFormat + "0")

                                $("#O_SubTotal_mobile").html("");
                                $("#O_SubTotal_mobile").html(numFormat + "0")
                            }
                        }

                        */
                    }
                }
                else {
                    if (data.SubTotal != null) {
                        $("#O_SubTotal").html("");
                        $("#O_SubTotal").html(data.SubTotal)

                        $("#O_SubTotal_mobile").html("");
                        $("#O_SubTotal_mobile").html(data.SubTotal)

                        var value = data.SubTotal;
                        var formattedValue = parseFloat(value).toFixed(2);
                        const numero = formattedValue;
                        const formateador = new Intl.NumberFormat('en-EN');
                        const numeroFormateado = formateador.format(numero);


                        $("#O_SubTotal").html("");
                        $("#O_SubTotal").html(numeroFormateado)

                        $("#O_SubTotal_mobile").html("");
                        $("#O_SubTotal_mobile").html(numeroFormateado)
                    }
                }

                var itemUnitPrice = data.Items.find(x => x.Id == id);
                if (itemUnitPrice != undefined) {
                    if (itemUnitPrice.UnitPrice != null) {
                        $("#UnitPrice_" + id).html("");
                        $("#UnitPrice_" + id).html(itemUnitPrice.UnitPrice)
                    }


                    if (data.UnitPrice != null) {
                        $("#UnitPrice_").html("");
                        $("#UnitPrice_").html(data.UnitPrice)
                    }
                }
                else {
                    if (data.UnitPrice != null) {
                        $("#UnitPrice_").html("");
                        $("#UnitPrice_").html(data.UnitPrice)
                    }
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert('Failed to update cart');
            }
        });
    }

}