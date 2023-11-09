$(".todolist").focus(function() {
  if (document.getElementById('todolist').value === '') {
    document.getElementById('todolist').value += '* ';
  }
});

$(".todolist").keyup(function(event) {
  var keycode = (event.keyCode ? event.keyCode : event.which);
  if (keycode == '13') {
    document.getElementById('todolist').value += '* ';
  }
  var txtval = document.getElementById('todolist').value;
  if (txtval.substr(txtval.length - 1) == '\n') {
    document.getElementById('todolist').value = txtval.substring(0, txtval.length - 1);
  }
});

$(document).ready(function () {
    $(".lis").click(function () {
        $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
        $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
    });
    $(".gr").click(function () {
        $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
        $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
    });
});