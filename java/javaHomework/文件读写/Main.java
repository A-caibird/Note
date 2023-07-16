import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Employee {
    private String name;
    private int age;
    private String hireDate;
    private String position;

    public Employee(String name, int age, String hireDate, String position) {
        this.name = name;
        this.age = age;
        this.hireDate = hireDate;
        this.position = position;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getHireDate() {
        return hireDate;
    }

    public String getPosition() {
        return position;
    }
}

public class Main {
    private static final String FILE_NAME = "./1.txt";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Employee> employees = new ArrayList<>();

        System.out.println("请输入员工信息，每行格式为：姓名 年龄 入职时间 职位");
        System.out.println("输入结束后，输入\"exit\"进行保存并退出。");

        while (true) {
            String input = scanner.nextLine();
            if (input.equalsIgnoreCase("exit")) {
                break;
            }

            String[] employeeData = input.split(" ");
            if (employeeData.length == 4) {
                String name = employeeData[0];
                int age = Integer.parseInt(employeeData[1]);
                String hireDate = employeeData[2];
                String position = employeeData[3];

                Employee employee = new Employee(name, age, hireDate, position);
                employees.add(employee);
            } else {
                System.out.println("输入格式错误，请按照\"姓名 年龄 入职时间 职位\"的格式输入员工信息。");
            }
        }

        saveEmployeesToFile(employees);
        System.out.println("员工信息已保存到文件 " + FILE_NAME);

        List<Employee> loadedEmployees = loadEmployeesFromFile();
        System.out.println("从文件 " + FILE_NAME + " 中读取的员工信息：");
        printEmployees(loadedEmployees);
    }

    private static void saveEmployeesToFile(List<Employee> employees) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(FILE_NAME))) {
            for (Employee employee : employees) {
                writer.println(employee.getName() + " " + employee.getAge() + " " +
                        employee.getHireDate() + " " + employee.getPosition());
            }
        } catch (IOException e) {
            System.out.println("保存员工信息到文件时出错：" + e.getMessage());
        }
    }

    private static List<Employee> loadEmployeesFromFile() {
        List<Employee> employees = new ArrayList<>();

        try (Scanner scanner = new Scanner(new File(FILE_NAME))) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] employeeData = line.split(" ");
                if (employeeData.length == 4) {
                    String name = employeeData[0];
                    int age = Integer.parseInt(employeeData[1]);
                    String hireDate = employeeData[2];
                    String position = employeeData[3];

                    Employee employee = new Employee(name, age, hireDate, position);
                    employees.add(employee);
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("找不到员工信息文件 " + FILE_NAME);
        }

        return employees;
    }

    private static void printEmployees(List<Employee> employees) {
        for (Employee employee : employees) {
            System.out.println("姓名: " + employee.getName());
            System.out.println("年龄: " + employee.getAge());
            System.out.println("入职时间: " + employee.getHireDate());
            System.out.println("职位: " + employee.getPosition());
            System.out.println();
        }
    }
}

