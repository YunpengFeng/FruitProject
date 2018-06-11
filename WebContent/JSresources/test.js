 
$(document).ready(function(){
	
$(".stra").raty({
         score:function() { 
             return $(this).attr('data-score'); 
         } ,
         
         click: function(score) {
        	 $(this).attr("data-score",score);
            // alert('ID: ' + this.id + "\nscore: " + score);
           },
         number: 10,
         starOn:'imgs/star-on.png',
         starOff:'imgs/star-off.png',
         starHalf:'imgs/star-half.png',
         cancelOff:'imgs/cancle-off.png',
         cancelOn:'imgs/cancle-on.png',
         readOnly:true,
         halfShow:true,
         size:100,
	 });
})