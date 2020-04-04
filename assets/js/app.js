function updateOutputs() {
    var a = $('input#txtA').val() ? parseInt($('input#txtA').val()) : 0;
    var b = $('input#txtB').val() ? parseInt($('input#txtB').val()) : 0;
    $('input#txtSum').val(a||b?add(a, b):"");
    $('input#txtDifference').val(a||b?subtract(a, b):"");
}
$(function () {
    var events = ["change", "keyup"];
    var inputs = ["input#txtA", "input#txtB"];
    for (i = 0; i < inputs.length; i++)
        for (e = 0; e < events.length; e++)
            $(inputs[i]).on(events[e], updateOutputs);
});