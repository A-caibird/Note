## [驱动下载](https://mvnrepository.com/artifact/mysql/mysql-connector-java/8.0.27)
## [配置驱动](https://www.cnblogs.com/dadian/p/11936056.html)
## 链接MySQL
> `try-catch`语句,打开链接,执行MySQL语句,接受返回值,关闭连接
```Java
import java.sql.*;

public class Main {
    public void del(String url, String user, String password){
        try {
            Connection con = DriverManager.getConnection(url, user, password);


            // Executing a query
            Statement stmt = con.createStatement();
            // 执行删除操作
            int rowCount = stmt.executeUpdate("DELETE FROM student WHERE SName LIKE '白%'");

            if (rowCount > 0) {
                System.out.println("成功删除 " + rowCount + " 条记录。");
            } else {
                System.out.println("没有找到匹配的记录。");
            }

            // stmt.executeQuery返回表第一个元组的引用
            ResultSet rs = stmt.executeQuery("SELECT * FROM student");
//            while (rs.next()) {
//                String id = rs.getString("SId");
//                String name = rs.getString("SName");
//                System.out.println("ID: " + id + ", Name: " + name);
//            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
  
    public void ins(String url, String user, String password){
        try {
            Connection con = DriverManager.getConnection(url, user, password);
            // Executing a query
            Statement stmt = con.createStatement();

            int numRowsAffected = stmt.executeUpdate("INSERT INTO student(GId,SId,SName,SSexy)VALUES(11,'018001','李白','男')");
            System.out.println("插入了"+numRowsAffected+"行数据");

            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
  
    public void update(String url, String user, String password){
        try {

            //
            Connection con = DriverManager.getConnection(url, user, password);
            // Executing a query
            Statement stmt = con.createStatement();

            // executeUpdate方法返回表中更新的记录.
            int numRowsAffected = stmt.executeUpdate("UPDATE student SET STele='660990' WHERE SId='032006007'");

            System.out.println(numRowsAffected + "行已更新");
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {


        // Establishing a connection to the database
        String url = "jdbc:mysql://localhost:3306/learndb";
        String user = "root";
        String password = "775028";
        Main test=new Main();
        test.del(url, user, password);
        test.update(url, user, password);
        test.ins(url, user, password);
    }
}
```

