# Java正则表达式实现身份证号码检验
```java
import rookie.list;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.regex.Pattern;


public class Main {
   public static  Boolean check(String a)
    {
       return a.equals(new StringBuilder(a).reverse().toString());
    }
    public static boolean isIdNumberValid(String idNumber) {
        if (idNumber == null || idNumber.length() != 18) {
            return false;
        }
        String regex = "^[1-9]\\d{5}(19|20)\\d{2}(0\\d|1[012])(0\\d|[12]\\d|3[01])\\d{3}[\\dxX]$";
        if(Pattern.matches(regex, idNumber)) {
            String birthday = idNumber.substring(6, 14);
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
            format.setLenient(false);
            try {
                Date date = format.parse(birthday);
                System.out.println("生日：" + format.format(date));
            } catch (ParseException e) {
                return false;
            }

            int genderIndex = Integer.parseInt(idNumber.substring(16, 17));
            String gender = genderIndex % 2 == 0 ? "女" : "男";

            System.out.println("性别：" + gender);
            return true;
        }
        else return false;
    }

    public static void main(String[] args) {
        list<String> str = new list<String>();
        Scanner scanner = new Scanner(System.in);
        String a = scanner.nextLine();
        str.add(a);
        if(isIdNumberValid(a))
        System.out.println("valid id number");
        else System.out.println("invalid id number");
        if(check(a))
            System.out.println("Is Palindrome string");
        else System.out.println("Is not Palindrome string");
    }

}
```
## windowd app
```java
import javax.swing.JOptionPane;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IDCardValidator {
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("^[1-9]\\d{5}(18|19|20)\\d{2}(0\\d|1[0-2])([0-2]\\d|3[01])\\d{3}[0-9Xx]$");
        boolean isValid = false;
        String idCard = "";

        while (!isValid) {
            idCard = JOptionPane.showInputDialog(null, "请输入身份证号码：");
            Matcher matcher = pattern.matcher(idCard);
            if (matcher.matches()) {
                isValid = true;
            } else {
                JOptionPane.showMessageDialog(null, "身份证号码不合法，请重新输入。");
            }
        }

        String year = idCard.substring(6, 10);
        String month = idCard.substring(10, 12);
        String day = idCard.substring(12, 14);
        String gender = Integer.parseInt(idCard.substring(16, 17)) % 2 == 0 ? "女" : "男";
        JOptionPane.showMessageDialog(null, "出生年月日：" + year + "年" + month + "月" + day + "日\n性别：" + gender);
    }
}
```
## 核心代码
```java
 if (idNumber == null || idNumber.length() != 18) {
            return false;
        }
 String regex = "^[1-9]\\d{5}(19|20)\\d{2}(0\\d|1[012])(0\\d|[12]\\d|3[01])\\d{3}[\\dxX]$";
 return Patter.matches(regex,idNumber);
 ```
