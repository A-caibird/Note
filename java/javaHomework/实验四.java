public class Main {
    static  Boolean check(String a)
    {
        for(int i=0,j=a.length()-1;i<a.length()/2;i++,j--)
        {
            if(a.charAt(i)!=a.charAt(j))
            {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        list<String> str = new list<String>();
        str.add("Hello");
        str.add("abbbba");
        for(int i = 0; i < str.size(); i++) {
            if(check(str.get(i)))
            {
                System.out.println("true");
            }else {
                System.out.println("false");
            }
        }
    }
}
