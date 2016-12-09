
#カレンダー表示
#$ = ->
# $(".datepicker").datepicker({
#   dateFormat: 'yy/mm/dd (D)'
# });

#init = ->
# $(".datepicker").datepicker({
#   dateFormat: 'yy/mm/dd (D)'
# });
#
#$(document).ready(init)
#$(document).on('page:load', init)

#単価取得
#$ ->
#  $(".product_name").change ->
#    productname = $(".product_name").val()
##    alert(productname)
##    $(".product_price").val("450")
#    $.ajax(
#           url: "/invoices/search_price"
#           type: 'GET'
#           data: {
#                 product_name: $(this).val()
#                 }
#          ).done (data) ->
#            $(".product_price").html(data)


#プルダウンの連動したい
#$ ->
#    $(".product_category").change ->
#      productcategory_id = $(".product_category").val()
#      alert(productcategory_id)
#     $.ajax(
#        type: 'GET'
#        url: '/invoices/types_select'
#        data: {
#          prefecture_id: $(this).val()
#        }
#      ).done (data) ->
#        $('.priduct_type').html(data)




##単価と数字から金額を表示
#$ ->
#    $(".product_price").change ->
#        price = $(".product_price").val()
#        nb = $(".product_nb").val()
##        alert(price * nb)
#        $(".product_total").val(price * nb)
#
#$ ->
#    $(".product_nb").change ->
#        price = $(".product_price").val()
#        nb = $(".product_nb").val()
##        alert(price * nb)
#        $(".product_total").val(price * nb)