<%@ page contentType="text/html;charset=GB2312"%>
<!--���ȵ���һЩ��Ҫ��packages-->
<%@ page info="database handler"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<!--���߱�����ʹ��SQL��--> 
<%@ page import="java.sql.*"%>
<% 

        //String url = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=JDBCTEST";
	String url="jdbc:odbc:Test2";
        String user ="sa";//�����滻�������ѵ����ݿ��û���
        String password = "";//�����滻�������ѵ����ݿ��û�����
        //String sqlquery = "select * from iner";
	
  	String username=new String(request.getParameter("username")).trim();//�û���
 	String pwd=new String(request.getParameter("pwd")).trim();//����

        try{    //������쳣��������Ǳ����.������ͨ������!    
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        	//out.println( "��ʵ�����ɹ�!" );

            	Connection con = DriverManager.getConnection( url, user, password );
            	//out.println( "�������Ӷ���ɹ�!" );

          	Statement st = con.createStatement();
          	//out.println( "����Statement�ɹ�!" );
		String sql="select * from iner where User_Name='"+username+"'";
		sql+="and Password='"+pwd+"'";
		ResultSet rs = st.executeQuery( sql );
		if(rs.next()){
			//session.setAttribute("username",username);//����session
			out.println("<script>alert('��½�ɹ�'); window.location='index.html';sessionStorage.setItem('username',"+username+");</script>");//�޸���תҳ��
		}
		else{
			out.println("<script>alert('��½ʧ��,�����û�������');window.location='login.html'; </script>");///////////
		}
           	rs.close();
            	st.close();
            	con.close();
		
        }
        catch(Exception err){
            err.printStackTrace();
        }
%>