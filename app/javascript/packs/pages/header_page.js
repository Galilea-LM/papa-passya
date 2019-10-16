export default class HeaderPage {
  listen() {
    $('.navbar-toggler-icon').on('click', function() {
      if($('.mobile-menu').hasClass('d-sm-block') == false) {
        $('.mobile-menu').addClass('d-block d-sm-block');
      }else {
        $('.mobile-menu').removeClass('d-block d-sm-block');
      }
    })
  }
}
