function show(bool,name,msg){
    if (bool){
        $('.name_container').text(name);
        $('.text_container').text(msg);
        $('#container').fadeIn(3000);
    }else{
        $('#container').fadeOut('slow');
    }
}

function sendData(data,type){
    $.post(`https://${GetParentResourceName()}/`+data, JSON.stringify({
        type: type
    }));
};

$(document).ready(function(){
    sendData("action","ready")
});

$('#container').hide();


window.addEventListener('message', function(event) {
    $(document).ready(function(){
        let item = event.data
        switch (item.type) {
            
            case 'config':
                $('#container').css("border-color",item.border_color);
                $('#container').css("background",item.background_color);
                $('.title').css('color',item.title_color);
                $('.message').css('color',item.text_color);
                if(item.show_sender){
                    $('.name_container').css('color',item.sender_color);
                }else{
                    $('.name_container').css("display",'none');
                }
                $(".img").attr("src",item.logo);

                break
            case 'open':
                show(true,item.first,item.second);

                break
            case 'close':
                show(false);

                break
        }
     });
})

