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
        String sqlquery = "select * from iner";
  	String username=new String(request.getParameter("username")).trim();
 	String pwd=new String(request.getParameter("pwd")).trim();

 	String sqlinsert="insert into iner(User_Name,Password) values('"+username+"','"+pwd+"')";//sql���


        try{    //������쳣��������Ǳ����.������ͨ������!    
         //     Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        	//out.println( "��ʵ�����ɹ�!" );

            	Connection con = DriverManager.getConnection( url, user, password );
            	//out.println( "�������Ӷ���ɹ�!" );

          	Statement st = con.createStatement();
          	//out.println( "����Statement�ɹ�!" );
		
    		try{
			st.executeUpdate(sqlinsert);//��������
 			//out.println( "�������ݱ����ݲ���ɹ�!" );
    			//out.println(sqlinsert);
			//out.println("------ע��ɹ�------");
                        out.println("<script>alert('ע��ɹ�'); window.location='index.html';</script>");
		}
		catch(Exception err){
			out.println("<script>alert('ע��ʧ�ܣ�����û�����������Ϣ��'); window.location='signIn.html';</script>");
		}

          	//ResultSet rs = st.executeQuery( sqlquery );
         	//out.println( "�������ݱ���ѯ�ɹ�!" );
         	//out.println( "----------------!" );
		//while (rs.next())
		//{
		//	String col1 = rs.getString("User_Name");
		//	String col2 = rs.getString("Password");
		//	//��ӡ����ʾ������
		//	out.println("<tr><td>"+col1+"</td><td>"+col2+"</td></tr>");
		//}
           	//rs.close();
            	st.close();
            	con.close();
		
        }
        catch(Exception err){
            err.printStackTrace();
        }
%>