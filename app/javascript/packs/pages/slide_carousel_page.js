import Glide, { Controls, Breakpoints } from '@glidejs/glide/dist/glide.modular.esm'

export default class SlideCarouselPage {
  listen() {
    var glide_count = $('.glide')
    if (glide_count[0].childNodes.length > 0) {
      var glide = new Glide('.glide', {
        autoplay: 4000 ,
        type: 'slider',
        focusAt: 'center',
        dragThreshold: true,
        perView: 1,
        gap: 2
      })
      
      glide.mount({ Controls, Breakpoints })
    }
  }
}
