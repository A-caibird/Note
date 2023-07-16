# [mac加载驱动](https://blog.csdn.net/weixin_45366499/article/details/104579591)
打开 project struture-》 moudle -》dependencies -》 + -》impor jar or direction  -》打勾选择编译
# 源代码
```java
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class Main extends JFrame {
    private JButton userButton;
    private JButton bookButton;
    private JTextArea outputArea;

    public Main() {
        setTitle("Database GUI");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        userButton = new JButton("用户数据");
        bookButton = new JButton("书本数据");
        outputArea = new JTextArea();
        outputArea.setEditable(false);

        userButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                showUserData();
            }
        });

        bookButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                showBookData();
            }
        });

        JPanel buttonPanel = new JPanel();
        buttonPanel.add(userButton);
        buttonPanel.add(bookButton);

        getContentPane().setLayout(new BorderLayout());
        getContentPane().add(buttonPanel, BorderLayout.NORTH);
        getContentPane().add(new JScrollPane(outputArea), BorderLayout.CENTER);
    }

    private void showUserData() {
        outputArea.setText("");
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "775028@lian");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM user");

            while (resultSet.next()) {
                int userId = resultSet.getInt("id");
                String userName = resultSet.getString("name");
                String userEmail = resultSet.getString("email");
                outputArea.append("User ID: " + userId + ", Name: " + userName + ", Email: " + userEmail + "\n");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private void showBookData() {
        outputArea.setText("");
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "775028@lian");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM book");

            while (resultSet.next()) {
                int bookId = resultSet.getInt("id");
                String bookTitle = resultSet.getString("title");
                String bookAuthor = resultSet.getString("author");
                outputArea.append("Book ID: " + bookId + ", Title: " + bookTitle + ", Author: " + bookAuthor + "\n");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                Main gui = new Main();
                gui.setVisible(true);
            }
        });
    }
}
```
