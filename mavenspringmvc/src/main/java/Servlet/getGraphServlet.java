package Servlet;

import Dao.UnswBookEntityDAO;
import Dao.UnswBookMessageDAO;
import Dao.UnswBookTripleDAO;
import Dao.UnswBookUserDAO;
import Entity.UnswBookEntityEntity;
import Entity.UnswBookMessageEntity;
import Entity.UnswBookTripleEntity;
import Entity.UnswBookUserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@WebServlet(name = "getGraphServlet")
public class getGraphServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String factor = request.getParameter("factor");
        String method = request.getParameter("method");

        String result = "'dinetwork {";
        if(method.equals("searchUserByName")){
            ArrayList userlist = new ArrayList<UnswBookUserEntity>();
            userlist.addAll(UnswBookUserDAO.getUserByFactor(factor,null,null,null));
            ArrayList idlist = new ArrayList<Integer>();
            for(Object user:userlist){
                UnswBookUserEntity u = (UnswBookUserEntity)user;
                idlist.add(u.getId());
            }//get all userId

            ArrayList tripleList = new ArrayList<UnswBookTripleEntity>();
            ArrayList entityList = new ArrayList<UnswBookEntityEntity>();

            for(Object i:idlist){
                tripleList.addAll(UnswBookTripleDAO.getTripleByNodeFrom("P"+String.valueOf(i)));
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId("P"+String.valueOf(i)));
            }

            for(Object t:tripleList){
                UnswBookTripleEntity triple = (UnswBookTripleEntity)t;
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId(triple.getNodeTo()));
                result += triple.getNodeFrom()+ " -> "+triple.getNodeTo()+";";
            }
            for(Object e:entityList){
                UnswBookEntityEntity entity = (UnswBookEntityEntity) e;
                if(entity.getEntityAttribute().equals("Title")){
                    result+=" "+entity.getEntityId()+"[group=Message,label="+entity.getAttributeValue()+"];";
                }
                if(entity.getEntityAttribute().equals("Name")){
                    result+=" "+entity.getEntityId()+"[group=Person,label="+entity.getAttributeValue()+"];";
                }
            }

        }else if(method.equals("searchUserByGender")){
            ArrayList userlist = new ArrayList<UnswBookUserEntity>();
            userlist.addAll(UnswBookUserDAO.getUserByFactor(null,factor,null,null));
            ArrayList idlist = new ArrayList<Integer>();
            for(Object user:userlist){
                UnswBookUserEntity u = (UnswBookUserEntity)user;
                idlist.add(u.getId());
            }//get all userId

            ArrayList tripleList = new ArrayList<UnswBookTripleEntity>();
            ArrayList entityList = new ArrayList<UnswBookEntityEntity>();

            for(Object i:idlist){
                tripleList.addAll(UnswBookTripleDAO.getTripleByNodeFrom("P"+String.valueOf(i)));
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId("P"+String.valueOf(i)));
            }

            for(Object t:tripleList){
                UnswBookTripleEntity triple = (UnswBookTripleEntity)t;
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId(triple.getNodeTo()));
                result += triple.getNodeFrom()+ " -> "+triple.getNodeTo()+";";
            }
            for(Object e:entityList){
                UnswBookEntityEntity entity = (UnswBookEntityEntity) e;
                if(entity.getEntityAttribute().equals("Title")){
                    result+=" "+entity.getEntityId()+"[group=Message,label="+entity.getAttributeValue()+"];";
                }
                if(entity.getEntityAttribute().equals("Name")){
                    result+=" "+entity.getEntityId()+"[group=Person,label="+entity.getAttributeValue()+"];";
                }
            }
        }else if(method.equals("searchUserByDob")){
            java.sql.Date date =null;
            if (!(factor ==null||factor.equals(""))) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date dob = null;
                try {
                    dob = sdf.parse(factor);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                date = new java.sql.Date(dob.getTime());
            }

            ArrayList userlist = new ArrayList<UnswBookUserEntity>();
            userlist.addAll(UnswBookUserDAO.getUserByFactor(null,null, date,null));
            ArrayList idlist = new ArrayList<Integer>();
            for(Object user:userlist){
                UnswBookUserEntity u = (UnswBookUserEntity)user;
                idlist.add(u.getId());
            }//get all userId

            ArrayList tripleList = new ArrayList<UnswBookTripleEntity>();
            ArrayList entityList = new ArrayList<UnswBookEntityEntity>();

            for(Object i:idlist){
                tripleList.addAll(UnswBookTripleDAO.getTripleByNodeFrom("P"+String.valueOf(i)));
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId("P"+String.valueOf(i)));
            }

            for(Object t:tripleList){
                UnswBookTripleEntity triple = (UnswBookTripleEntity)t;
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId(triple.getNodeTo()));
                result += triple.getNodeFrom()+ " -> "+triple.getNodeTo()+" [label="+triple.getEdge()+"];";
            }
            for(Object e:entityList){
                UnswBookEntityEntity entity = (UnswBookEntityEntity) e;
                if(entity.getEntityAttribute().equals("Title")){
                    result+=" "+entity.getEntityId()+"[group=Message,label="+entity.getAttributeValue()+"];";
                }
                if(entity.getEntityAttribute().equals("Name")){
                    result+=" "+entity.getEntityId()+"[group=Person,label="+entity.getAttributeValue()+"];";
                }
            }
        }else if(method.equals("searchMessageByTitle")){
            ArrayList messagelist = new ArrayList<UnswBookMessageEntity>();
            messagelist.addAll(UnswBookMessageDAO.getMessageByTitle(factor));
            ArrayList idlist = new ArrayList<Integer>();
            for(Object message:messagelist){
                UnswBookMessageEntity m = (UnswBookMessageEntity)message;
                idlist.add(m.getId());
            }//get all messageId

            ArrayList tripleList = new ArrayList<UnswBookTripleEntity>();
            ArrayList entityList = new ArrayList<UnswBookEntityEntity>();
            for(Object i: idlist){
                tripleList.addAll(UnswBookTripleDAO.getTripleByNodeTo("M"+String.valueOf(i)));
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId("M"+String.valueOf(i)));
            }

            for(Object t:tripleList){
                UnswBookTripleEntity triple = (UnswBookTripleEntity)t;
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId(triple.getNodeFrom()));
                result += triple.getNodeFrom()+ " -> "+triple.getNodeTo()+" [label="+triple.getEdge()+"];";
            }
            for(Object e:entityList){
                UnswBookEntityEntity entity = (UnswBookEntityEntity) e;
                if(entity.getEntityAttribute().equals("Title")){
                    result+=" "+entity.getEntityId()+"[group=Message,label="+entity.getAttributeValue()+"];";
                }
                if(entity.getEntityAttribute().equals("Name")){
                    result+=" "+entity.getEntityId()+"[group=Person,label="+entity.getAttributeValue()+"];";
                }
            }
        }else if(method.equals("searchFriendsOfFriends")){
            ArrayList userlist = new ArrayList<UnswBookUserEntity>();
            userlist.addAll(UnswBookUserDAO.getUserByFactor(factor,null, null,null));
            ArrayList idlist = new ArrayList<Integer>();
            for(Object user:userlist){
                UnswBookUserEntity u = (UnswBookUserEntity)user;
                idlist.add(u.getId());
            }//get all userId

            ArrayList tripleList = new ArrayList<UnswBookTripleEntity>();
            ArrayList entityList = new ArrayList<UnswBookEntityEntity>();

            for(Object i:idlist) {
                tripleList.addAll(UnswBookTripleDAO.getTripleByFriendship("P" + String.valueOf(i)));
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId("P"+String.valueOf(i)));
            }

            ArrayList tripleList2 = new ArrayList<UnswBookTripleEntity>();

            for(Object t:tripleList){
                UnswBookTripleEntity triple = (UnswBookTripleEntity) t;
                tripleList2.addAll(UnswBookTripleDAO.getTripleByFriendship(triple.getNodeTo()));
            }
            tripleList.addAll(tripleList2);
            List<UnswBookTripleEntity> tripleListWithoutDup = new ArrayList<UnswBookTripleEntity>(new HashSet<UnswBookTripleEntity>(tripleList));
            for(Object t:tripleListWithoutDup){
                UnswBookTripleEntity triple = (UnswBookTripleEntity)t;
                entityList.addAll(UnswBookEntityDAO.getEntityByEntityId(triple.getNodeTo()));
                result += triple.getNodeFrom()+ " -> "+triple.getNodeTo()+" [label="+replaceEdge(triple.getEdge())+"];";
            }
            for(Object e:entityList){
                UnswBookEntityEntity entity = (UnswBookEntityEntity) e;
                if(entity.getEntityAttribute().equals("Title")){
                    result+=" "+entity.getEntityId()+"[group=Message,label="+entity.getAttributeValue()+"];";
                }
                if(entity.getEntityAttribute().equals("Name")){
                    result+=" "+entity.getEntityId()+"[group=Person,label="+entity.getAttributeValue()+"];";
                }
            }

        }
        result+="}'";
        result.replace("E1","friendOf");
        result.replace("E2","posted");
        result.replace("E3","liked");
        result.replace("E4","disliked");

        System.out.println(result);
        request.setAttribute("result",result);
        request.getRequestDispatcher("graphYouAsked.jsp").forward(request,response);
    }
    public String replaceEdge(String edge){
        if(edge.equals("E1")){
            return "friendOf";
        }else if(edge.equals("E2")){
            return "posted";
        }else if(edge.equals("E3")){
            return "liked";
        }
        return "disliked";
    }
}
