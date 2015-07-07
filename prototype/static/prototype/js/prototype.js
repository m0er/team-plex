/**
 * Created by moer on 15. 6. 16..
 */

$(document).ready(function() {
    var lastSelected = {},
        rowKey = 'data-row-index',
        colKey = 'data-col-index';

    window.scrollTo(0, 0);

    Mousetrap.bind('up', function() {
       var $currentItem = $('.focus'),
           $mainContainer = $('#container'),
           $upperRowItem = $currentItem.parent().prev().children().first();

        if ($upperRowItem.size() > 0) {
            $currentItem.removeClass('focus');

            var upperLastIndex = lastSelected[rowKey + $upperRowItem.parent().attr(rowKey)];
            if (upperLastIndex !== undefined && upperLastIndex != 0) {
                var $selectedUpperRowItem = $($currentItem.parent().prev().children()[upperLastIndex - 1]);
                $selectedUpperRowItem.addClass('focus');
            } else {
                $upperRowItem.addClass('focus');
            }


            if (new RegExp('down-1').test($mainContainer.attr('class'))) {
                $mainContainer.removeClass('down-1');
            } else if (new RegExp('down-').test($mainContainer.attr('class'))) {
                var index = $mainContainer.attr('class').replace('container-fluid down-', '');

                $mainContainer.removeClass('down-' + index--);
                $mainContainer.addClass('down-' + index);
            }
        }
    });

    Mousetrap.bind('down', function() {
       var $currentItem = $('.focus'),
           $mainContainer = $('#container'),
           $bottomRowItem = $currentItem.parent().next().children().first();

        if ($bottomRowItem.size() > 0) {
            $currentItem.removeClass('focus');

            var bottomLastIndex = lastSelected[rowKey + $bottomRowItem.parent().attr(rowKey)];
            if (bottomLastIndex !== undefined && bottomLastIndex != 0) {
                var $selectedBottomRowItem = $($currentItem.parent().next().children()[bottomLastIndex - 1]);
                $selectedBottomRowItem.addClass('focus');
            } else {
                $bottomRowItem.addClass('focus');
            }


            if (new RegExp('down-').test($mainContainer.attr('class'))) {
                var index = $mainContainer.attr('class').replace('container-fluid down-', '');

                $mainContainer.removeClass('down-' + index++);
                $mainContainer.addClass('down-' + index);
            } else {
                $mainContainer.addClass('down-1');
            }
        }
    });

    Mousetrap.bind('left', function() {
        var $currentItem = $('.focus'),
            $currentRow = $currentItem.closest('.item-container'),
            $prevItem = $currentItem.prev();

        if ($prevItem.size() > 0) {
            $currentItem.removeClass('focus');
            $prevItem.addClass('focus');

            lastSelected[rowKey + $currentRow.attr(rowKey)] = $prevItem.attr(colKey);

            if (new RegExp('right-1').test($currentRow.attr('class'))) {
                $currentRow.removeClass('right-1');
            } else if (new RegExp('right-').test($currentRow.attr('class'))) {
                var index = $currentRow.attr('class').replace('item-container right-', '');

                $currentRow.removeClass('right-' + index--);
                $currentRow.addClass('right-' + index);
            }
        }
    });

    Mousetrap.bind('right', function() {
        var $currentItem = $('.focus'),
            $currentRow = $currentItem.closest('.item-container'),
            $nextItem = $currentItem.next('.item');

        if ($nextItem.size() > 0) {
            $currentItem.removeClass('focus');
            $nextItem.addClass('focus');

            lastSelected[rowKey + $currentRow.attr(rowKey)] = $nextItem.attr(colKey);

            if (new RegExp('right-').test($currentRow.attr('class'))) {
                var index = $currentRow.attr('class').replace('item-container right-', '');

                $currentRow.removeClass('right-' + index++);
                $currentRow.addClass('right-' + index);
            } else {
                $currentRow.addClass('right-1');
            }
        }
    });

    Mousetrap.bind('enter', function() {
        var $modal = $('#item-modal');
        var $currentItem = $('.focus');
        $modal.find('.modal-title').text($currentItem.find('h4').text());
        $modal.find('.modal-body').text($currentItem.find('div').text());
        $modal.modal();
    });

    $('#item-modal').on('shown.bs.modal', function () {
        $(this).focus();
    });
});