package com.hoju.koala.member.chat;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
//import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

/*

@Configuration
@EnableWebSocket
public class ChatConfig implements WebSocketConfigurer {
	
	@Autowired
	private ChatHandler chatHandler;

	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		registry.addHandler(chatHandler, "/chat")
				.withSockJS()
				.setClientLibraryUrl("https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js")
				.setInterceptors(new HttpSessionHandshakeInterceptor());
		
		
	}
	
}
 */
