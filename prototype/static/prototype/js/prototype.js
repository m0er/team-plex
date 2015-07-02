/**
 * Created by moer on 15. 6. 16..
 */

$(document).ready(function() {

    window.scrollTo(0, 0);

    Mousetrap.bind('right', function() {
        var $currentItem = $('.focus'),
            $nextItem = $currentItem.next('.item');

        if ($nextItem.size() > 0) {
            $currentItem.removeClass('focus');
            $nextItem.addClass('focus');
        }
    });

    Mousetrap.bind('left', function() {
        var $currentItem = $('.focus'),
            $prevItem = $currentItem.prev();

        if ($prevItem.size() > 0) {
            $currentItem.removeClass('focus');
            $prevItem.addClass('focus');
        }
    });

    Mousetrap.bind('up', function() {
       var $currentItem = $('.focus'),
           $upperRowItem = $currentItem.parent().prev().children().first();

        if ($upperRowItem.size() > 0) {
            $currentItem.removeClass('focus');
            $upperRowItem.addClass('focus');
        }
    });

    Mousetrap.bind('down', function() {
       var $currentItem = $('.focus'),
           $bottomRowItem = $currentItem.parent().next().children().first();

        if ($bottomRowItem.size() > 0) {
            $currentItem.removeClass('focus');
            $bottomRowItem.addClass('focus');
        }
    });

    Mousetrap.bind('enter', function() {
        var $modal = $('#item-modal');
        var $currentItem = $('.focus');
        $modal.find('.modal-body').text($currentItem.text());
        $modal.modal();
    });

    $('#item-modal').on('shown.bs.modal', function () {
        $(this).focus();
    });

    //todo - 키보드 상하좌우 이벤트에 따른 아이템 이동
});