// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery");

// import SlideCarouselPage from './pages/slide_carousel_page';
import HeaderPage from './pages/header_page';
import FlashPage from './pages/flash_page';


(function($) {
  $(document).ready(function() {
    // $('.scroll-down').click(function () {
    //   $("html, body").animate({scrollTop: "475px"});
    // });

    new HeaderPage().listen();
    new FlashPage().listen();
    // new SlideCarouselPage().listen();


  });
})(jQuery);
