if not AxConfig then AxConfig = {} end

AxConfig.show_sender = true
AxConfig.min_msg_lenght = 4
AxConfig.delay = 5      --// delay to show the announce (in seconds)
AxConfig.show_time = 15    --// in seconds

AxConfig.style = {
    --// rgba or HEX Code \\--
    border_color = 'rgb(141, 195, 195)',
    background_color = 'rgba(0, 0, 0, 0.5)',
    title_color = '#fff',
    text_color = '#fff',
    sender_color = '#00BAFF'    --// Ignored if show_sender is set to false
}


