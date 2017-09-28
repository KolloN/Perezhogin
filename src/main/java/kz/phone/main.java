package kz.phone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class main extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //String s = req.getParameter("name");
        //pw.print("asdasda==="+ s);
        String type = req.getParameter("typeOf");
        PrintWriter pw = resp.getWriter();
        if (type.equals("adding")) {
            String fio = req.getParameter("fio");
            String phone = req.getParameter("phone");
            try {
                String url = "jdbc:mysql://localhost/main?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
                Connection conn = DriverManager.getConnection(url,"mysql","mysql");
                Statement st = conn.createStatement();
                st.executeUpdate("INSERT INTO phones " +
                        "VALUES (NULL , '"+fio+"','"+phone+"')");
                conn.close();
                pw.println("Zapis' dobavlena: "+fio+", phone: "+phone);
                pw.println("chtobi vernut'sya copy&paste this link: http://localhost:8080");
            } catch (Exception e) {
                System.err.println("Got an exception! ");
                System.err.println(e.getMessage());
            }
        } else if (type.equals("edit")) {
            String fio = req.getParameter("fio");
            String id = req.getParameter("id");
            String phone = req.getParameter("phone");
            try {
                String url = "jdbc:mysql://localhost/main?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
                Connection conn = DriverManager.getConnection(url,"mysql","mysql");
                Statement st = conn.createStatement();
                st.executeUpdate("UPDATE phones " +
                        "SET `fio`='"+fio+"', `phone`='"+phone+"' where id="+id);
                conn.close();
                pw.println("Zapis' edited");
                pw.println("chtobi vernut'sya copy&paste this link: http://localhost:8080");
            } catch (Exception e) {
                System.err.println("Got an exception! ");
                System.err.println(e.getMessage());
            }
        } else if (type.equals("delete")) {
            String id = req.getParameter("id");
            try {
                String url = "jdbc:mysql://localhost/main?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
                Connection conn = DriverManager.getConnection(url,"mysql","mysql");
                Statement st = conn.createStatement();
                st.executeUpdate("delete from phones " +
                        "where id="+id);
                conn.close();
                pw.println("Zapis' s id "+id+" uspeshno delete");
                pw.println("chtobi vernut'sya copy&paste this link: http://localhost:8080");
            } catch (Exception e) {
                System.err.println("Got an exception! ");
                System.err.println(e.getMessage());
            }
        }
    }
}