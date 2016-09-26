$(document).on("turbolinks:load", function () {
    $('.ckeditor').each(function() {
        //console.log($(this));
        CKEDITOR.replace($(this).attr('id'));
    });
});
