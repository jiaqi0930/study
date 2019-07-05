package com.itshidu.study.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itshidu.study.util.HttpClientUtil;

import java.io.IOException;

public class QQUtil {
 private  static  final  String APPID = "101340964";
 private  static  final  String APPKEY = "92c367a3cec734a0cb2c4fa49e421e04";
 private  static  final  String CALLBACK = "http://www.shiduketang.com/login/bind/qq/callback";

 private  static  final  String URL_ToKen = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=APPID&client_secret=APPKEY&code=CODE&redirect_uri=URI";

  private  static   ObjectMapper objectMapper=new ObjectMapper();
 public static String getAccessToKen(String authorizationcode ){
        String url = URL_ToKen ;
        url=url.replaceAll("APPID",APPID);
        url=url.replaceAll("APPKEY",APPKEY);
        url=url.replaceAll("CODE",authorizationcode);
        url=url.replaceAll("URI",CALLBACK);
  String text =   HttpClientUtil.doGet(url);
  //截取中间值
  int start=  text.indexOf("=")+1;
  int end= text.indexOf("&");
     return text.substring(start,end);
 }
public  static String getOpenID(String accessToKen) throws IOException {
 String url = "https://graph.qq.com/oauth2.0/me?access_token="+accessToKen;
    String text =   HttpClientUtil.doGet(url);
   int  start =  text.indexOf("callback(")+9;
   int  end =  text.indexOf(")");
     text =text.substring(start,end);
    JsonNode node = objectMapper.readTree(text);
     return  node.get("openid").asText();
}

public static  JsonNode getUserInfo(String openid , String token) throws IOException {
   String  url = "https://graph.qq.com/user/get_user_info?access_token=TOKEN&oauth_consumer_key=APPID&openid=OPENID";
        url =url.replaceAll("TOKEN",token);
        url =url.replaceAll("APPID",APPID);
        url =url.replaceAll("OPENID",openid);
    String text  = HttpClientUtil.doGet(url);
     return objectMapper.readTree(text) ;


}
    public static void main(String[] args) throws IOException {
           String  code = "4C70C977EECFF8D0C48FD9EF69DF99C4";
           String Token =getAccessToKen(code);
           String Openid=getOpenID(Token);
        JsonNode  User = getUserInfo(Openid,Token);
    }
}
