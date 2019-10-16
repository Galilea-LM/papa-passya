export default class FlashPage {
  listen() {
    $('.close').on('click', function() {
      $('.flash-container').hide()
    })
  }
}
