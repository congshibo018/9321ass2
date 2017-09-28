package tools;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint(value = "/websocket/{userId}")
public class webSocket {
    private Session session;
    @OnMessage
    public void onMessage(String friendId, Session session) throws IOException,
            InterruptedException {
        // Sending message to client each 1 second
        System.out.println(friendId);
        session.getBasicRemote().sendText("friend request send!");
        Thread.sleep(1000);
    }

    @OnOpen
    public void onOpen(@PathParam("userId")String userId, Session session) {
        System.out.println(userId+" connected");
        this.session = session;
    }

    @OnClose
    public void onClose(@PathParam("userId")String userId, Session session) {
        System.out.println(userId+"Connection closed");
    }

    public void sendMessage(String friendname){
        this.session.getAsyncRemote().sendText(friendname+" has accepted your friend request!");

    }
}