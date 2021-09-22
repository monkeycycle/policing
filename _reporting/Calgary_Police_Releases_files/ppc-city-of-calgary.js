pp_jquery(function ($) {

    /**
     * Position Default slider above #Maintable
     */
    if ($('.pp_singlenewsroom').length > 0) {
        $('.ppNews-b').appendTo($('.pp-content-top'));
    }

    /**
     * Menu
     */

    var ppCustomMenu = $('.pp-custom-menu');
    var navIcon = $('#nav-icon3');

    navIcon.on('click', function () {
        $(this).toggleClass('open');
        ppCustomMenu.slideToggle('fast');
        $('.pp-custom-body-overlay').toggle();
    });

    $('.custom-submenu-toggle').on('click', function () {
        $('.pp-custom-menu-sub').slideToggle('fast');
    });

    $(document).mouseup(function (e) {
        if (navIcon.hasClass('open')) {

            var container = $(".pp-custom-menu, #nav-icon3");

            if (!container.is(e.target) // if the target of the click isn't the container...
                && container.has(e.target).length === 0) // ... nor a descendant of the container
            {
                ppCustomMenu.slideToggle('fast');
                navIcon.toggleClass('open');
                $('.pp-custom-body-overlay').toggle();
            }
        }
    });

    /**
     *  captions for inline images
     */

    if (pp_jquery('.pp_singlerelease').length) {
        pp_jquery('.text_companyprofile p img').each(function (i) {
            var parentContainer = pp_jquery(this).parent();
            if (parentContainer.hasClass('pp-inline-wrapper')) {
                return true
            }
            var title = pp_jquery(this).attr('title');
            if (typeof title !== 'undefined' && title != '') {
                title.trim();
                var width = pp_jquery(this).width() + 15;
                var float = pp_jquery(this).css('float');
                var margins = pp_jquery(this).css('margin-top') + ' ' + pp_jquery(this).css('margin-right') + ' ' + pp_jquery(this).css('margin-bottom') + ' ' + pp_jquery(this).css('margin-left');
                pp_jquery(this).wrap("<div class='caption-image-container' id='image-container" + i + "' style='width:" + width + "px; margin:" + margins + "; float:" + float + "'></div>");
                var imageContainer = pp_jquery('#image-container' + i + '');
                var titleDiv = '<div class="caption-image-text">' + title + '</div>';
                pp_jquery(imageContainer).append(titleDiv);
                pp_jquery(this).css('float', 'initial');
            }
        });
    }

    /**
     * Add blog archive button on 'archive featured'
     */
    var url = window.location.href;
    var blockArchiveUrl = '//preview.presspage.com/city-of-calgary-redesign/preview/407a31bb71d9e6c07426f4fcc176e20c?h=1&t=feature';

    if ((url === 'http:' + blockArchiveUrl || url === 'https:' + blockArchiveUrl) && pp_jquery('#backtonewsroom_button').length > 0) {

        var blogArchiveButton = '<div class="extras_newsroom_header pp_moduleblock">\n' +
            '    <div class="extras_newsroom_headertitle_right">\n' +
            '        <a href="//www.calgarycitynews.com/">Blog archive</a>    </div>\n' +
            '</div>';

        pp_jquery(blogArchiveButton).insertAfter('#backtonewsroom_button');
    }

    /**
     * Change archive page headings and add substring
     */

    if (pp_jquery('.pp_sub_allheadlines').length > 0) {
        var archivePageArray = [
            {
                titleText: 'The City of Calgary news releases',
                urlContains: '?h=1&t=City%20News,Transportation,City%20Release'
            },
            {
                titleText: 'Feature stories',
                urlContains: '?h=1&t=feature'
            },
            {
                titleText: 'Police news releases',
                urlContains: '?h=1&t=Police'
            },
            {
                titleText: 'Fire news releases',
                urlContains: '?h=1&t=Fire'
            }
        ];

        var titleBigHeadlinesDiv = pp_jquery('.title_big_headlines');

        pp_jquery.each(archivePageArray, function (index, value) {
            if (url.indexOf(value.urlContains) > 0) {
                titleBigHeadlinesDiv.text(value.titleText);
                /**
                 * Change contact module data
                 */
                if(value.urlContains == '?h=1&t=Fire') {
                    $('#ppmodule_contacts .pp_contactdiv_name').text('Calgary Fire Department, Carol Henke');
                    $('#ppmodule_contacts .emaillink').text('carol.henke@calgary.ca');
                    $('#ppmodule_contacts .emaillink').attr('href', 'mailto:carol.henke@calgary.ca');
                    $('#ppmodule_contacts .pp_phonenumber').text('(403) 988-7922');
                    $('#ppmodule_contacts .div_contacts_image img').attr('src', 'https://content.presspage.com/contacts/102_4907.jpg?1816068278');
                    $('#ppmodule_contacts .contact_text_td > a').hide();

                    var contactJob = $('<div class="contactdiv_jobtitle">Public Information Officer</div>')
                    $(contactJob).insertAfter($('#ppmodule_contacts .pp_contactdiv_name'));
                }
            }
            titleBigHeadlinesDiv.css("visibility", "visible");
        });
    }

    /**
     * move contact module to top on fire archive page
     */
    var url = window.location.href;

    if(url.indexOf('/?h=1&t=Fire') >= 0) {
        $('#ppmodule_contacts').prependTo($('.pp-side-column .div_main_extras')); 
    }
});