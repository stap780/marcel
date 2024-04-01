Spree.fetchCart = function () {
    return $.ajax({
      url: Spree.localizedPathFor('cart_link')
    }).done(function (data) {
      Spree.cartFetched = true
      // change this place because in design we have 2 id="link-to-cart" (mobile and desktop)
    //   return $('#link-to-cart').html(data)
      // to this ->
    //   return $('#link-to-cart-mobile').html(data)
      return $('.mini-cart').each(function() { $( this ).html(data); });
      // end changes
    })
}

