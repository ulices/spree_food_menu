window.menuProductApp || (window.menuProductApp = {})

menuProductApp.ProductDay = (->
  ProductDay = ->
    @bindSaveProductDay()
    return
  ProductDay::bindSaveProductDay = ->
    $(".add-product-to-menu").on "click", (e) ->
      element = e.target
      menuDay = "#menu-day-" + element.id
      menuId = $(menuDay + " #menu_id").val()
      date = $(menuDay + " #day_date").val()
      productId = $(menuDay + " #product_id").val()
      data = menu_product_day:
        menu_id: menuId
        product_id: productId
        day: date

      $.post "/admin/menu_product_days", data, (response) ->
        object = $.parseJSON(response)
        element_id = element.id
        ProductDay::addProductToList(object.name, element_id)
        return

      return

  ProductDay::addProductToList = (product_name, element_id)->
    ol = $("#products-for-" + element_id)
    ol.append "<li>" + product_name + "</li>"
    return

  ProductDay
)()
