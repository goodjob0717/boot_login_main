$(document).ready(function(){
		        $('header, nav').hover(function(){
		            $('.submenu').stop(true, true).slideDown();
		        }, function(){
		            $('.submenu').stop(true, true).slideUp();
		        });
		    });
			

			       // 아코디언 기능
			       var acc = document.getElementsByClassName("accordion");
			       for (var i = 0; i < acc.length; i++) {
			           acc[i].addEventListener("click", function() {
			               this.classList.toggle("active");
			               var panel = this.nextElementSibling;
			               var expanded = this.getAttribute("aria-expanded") === "true";
			               this.setAttribute("aria-expanded", !expanded);
			               panel.style.display = expanded ? "none" : "block";
			           });
			       }
			   
			       // FAQ 표시 기능
			       function showFAQ(type) {
			           var personalTab = document.getElementById('personalTab');
			           var businessTab = document.getElementById('businessTab');
			           var personalFAQ = document.getElementById('personalFAQ');
			           var businessFAQ = document.getElementById('businessFAQ');
			   
			           personalTab.classList.remove('active');
			           businessTab.classList.remove('active');
			           personalFAQ.style.display = 'none';
			           businessFAQ.style.display = 'none';
			           
			           if (type === 'personal') {
			               personalTab.classList.add('active');
			               personalFAQ.style.display = 'block';
			           } else if (type === 'business') {
			               businessTab.classList.add('active');
			               businessFAQ.style.display = 'block';
			           }
			       }
			   
			       // 페이지 로드 시 개인회원 FAQ 표시
			       window.onload = function() {
			           showFAQ('personal');
			       }
