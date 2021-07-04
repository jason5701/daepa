package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Controller
public class EchoHandler extends TextWebSocketHandler{
   List<WebSocketSession> sessionList = new ArrayList<>();
   
   //클라이언트 연결을 끊었을때
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      sessionList.remove(session);
      System.out.println("연결끊김:"+session.getId());
      super.afterConnectionClosed(session, status);
   }
   
   //클라이언트가 연결 되었을때
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      sessionList.add(session); //연결 할때마다 고유 session(자동)이 sessionList에 저장됨
      System.out.println("연결됨:"+session.getId());
      super.afterConnectionEstablished(session);
   }
   
   //클라이언트가 서버로 메시지를 전송했을때
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String strMessage=message.getPayload();
      System.out.println("메시지:" + strMessage);
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
      String strDate=sdf.format(new Date());
      strMessage=strMessage + "|" + strDate;
      //접속한 모든 유저에게 메시지 보내기
      for(WebSocketSession web:sessionList){
         web.sendMessage(new TextMessage(strMessage));
      }
      super.handleTextMessage(session, message);
   }
   
}