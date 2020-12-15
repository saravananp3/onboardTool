  $('#holder').on('click', "label.editable", function() { 	
 		var $lbl = $(this), o = $lbl.text(),
    	$txt = $('<input type="text" class="editable-label-text" value="'+o+'" />');
    $lbl
    .replaceWith($txt);
    $txt.focus();
    
    $txt.blur(function() {
    	$txt.replaceWith($lbl);
    })
    .keydown(function(evt){
    	if(evt.keyCode == 13) {
      	var no = $(this).val();
      	$lbl.text(no);
        $txt.replaceWith($lbl);
      }
    });
 }); 