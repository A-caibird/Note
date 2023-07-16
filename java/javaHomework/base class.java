import java.util.Random;
import java.util.Scanner;
class my {
    private int a,cnt=0;

    my() {
        Random random = new Random();
        this.a = random.nextInt(101);
    }
   public boolean check(int a) {
        if (a == this.a) {
            System.out.println("YOU ARE RIGHT");
            return true;
        } else {
            if (a < this.a)
                System.out.println("TOO SMALL");
            else
                System.out.println("TOO BIG");
            return false;
        }
    }
    public void guess()
    {
        Integer b;
        do{
            ++cnt;
            Scanner scanner = new Scanner(System.in);
            b=scanner.nextInt();
            if(this.check(b))
                break;
            if(cnt==6)
            {
                System.out.println("you are a cai bird.The right answer is "+this.a);
                break;
            }
        }while(true);
    }

}

public class Main {
    public static void main(String[] args) {
        my num = new my();
        num.guess();
    }
}
