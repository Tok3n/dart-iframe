
import 'dart:html';

TextAreaElement msg;
ButtonElement btn;
IFrameElement iframe;
UListElement log;
var parent = window.parent;
var parentOrigin = "http://tok3n.github.io";

void main() {
  msg = querySelector( "#compose-message" );
  btn = querySelector( "#send-message" );
  iframe = querySelector( "#dart-iframe" );
  log = querySelector( "#message-log" );
  
  window.onMessage.listen( receiveMessage );
  
  btn.addEventListener( "click", sendMessage );
}

void receiveMessage( MessageEvent e ) {
  LIElement li = document.createElement("li");
  li.text = e.data;
  log.append( li );
}

void sendMessage( Event e ) {
  parent.postMessage( msg.value, parentOrigin );
}