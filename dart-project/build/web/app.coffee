iframeOrigin = "http://127.0.0.1:3030"
iframePath = iframeOrigin + "/dart-iframe/web/iframe.html"

qs = document.querySelector.bind( document )

msg = qs "#compose-message" 
btn = qs "#send-message" 
iframe = qs( "#dart-iframe" ).contentWindow
log = qs "#message-log"

btn.addEventListener "click", ( evt ) ->
  iframe.postMessage msg.value, iframeOrigin

window.addEventListener "message", ( evt ) ->

  if evt.origin is iframeOrigin
    
    # evt.source === iframe

    li = document.createElement "li"
    li.innerHTML = evt.data

    console.log li

    log.appendChild li

  else
    console.log "Message received from elsewhere: #{ evt.origin }"
