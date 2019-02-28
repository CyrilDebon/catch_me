const flyout = () => {
$(function(){
  $('.flyout-close').on('click tap', function(){
    $('.flyout').addClass('flyout-closed');
  });

  $('.flyout-open').on('click tap', function(){
    $('.flyout').removeClass('flyout-closed');
  });
});

};

export { flyout };
