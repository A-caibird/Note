import rookie.list;

public class Main {

    public static void main(String[] args) {
        list<String> str = new list<String>();
        str.add("Hello");
        str.add("World");
        System.out.println(str.frist());
        if (!str.contains("yes")) {
            System.out.println("No");
        }
        System.out.println(str.toString());
    }
}
