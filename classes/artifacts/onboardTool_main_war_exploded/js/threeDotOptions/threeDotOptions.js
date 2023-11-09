function changeLanguage(language) {
                    var element = document.getElementById("url");
                    element.value = language;
                    element.innerHTML = language;
                }

                $(document).on('click', '.dropbtn', function () {
                	var i = $(this).index('.dropbtn');
                    $(".myDropdown").eq(i).show();
                    $(this).removeClass('dropbtn');
                });

                $(document).on('mouseleave', '.drophide', function(){
                	var i = $(this).index('.drophide');
                    $(".myDropdown").eq(i).hide();
                	$('.dropClass').eq(i).addClass('dropbtn');
                });
                // Close the dropdown if the user clicks outside of it
                window.onclick = function(event) {
                    if (!event.target.matches('.dropbtn')) {
                        var dropdowns = document.getElementsByClassName("dropdown-content");
                        var i;
                        for (i = 0; i < dropdowns.length; i++) {
                            var openDropdown = dropdowns[i];
                            if (openDropdown.classList.contains('show')) {
                                openDropdown.classList.remove('show');
                            }
                        }
                    }
                }