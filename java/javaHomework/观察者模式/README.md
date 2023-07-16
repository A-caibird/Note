## [观察者模式](https://juejin.cn/post/6844903839900909575#comment)
```Java
import java.util.ArrayList;
import java.util.Scanner;


// 抽象观察者:提供观察者
interface AbstractObserver {
    //更新试图接口
    public default void update() {
        System.out.println("需要更新观察者视图");
    }
}

// 抽象主题接口:定义主题与观察者试图同步更新试图接口,添加移除观察者
interface abstractsubject{
    public void add(AbstractObserver observer);
    public void remove(AbstractObserver observer);
    public void notice();
}

// 主题类
class subject implements abstractsubject{
    ArrayList<AbstractObserver> list;
    public  subject()
    {
        this.list=new ArrayList<AbstractObserver>();
    }
    @Override
    public void add(AbstractObserver observer) {
        list.add(observer);
    }

    @Override
    public void remove(AbstractObserver observer) {
        list.remove(observer);
    }

    @Override
    public void notice() {
        for(AbstractObserver item:list)
        {
            item.update();
        }
    }
}
public class Main {
    public static void main(String[] args)
    {
        subject data = new subject();

        data.add(new AbstractObserver() {
            @Override
            public void update() {
                System.out.println("我是观察者A,我的视图更新了");
            }
        });
        data.add(new AbstractObserver() {
            @Override
            public void update() {
                System.out.println("我是观察者B,我的视图更新了");
            }
        });
        data.add(new AbstractObserver() {
            @Override
            public void update() {
               AbstractObserver.super.update();
            }
        });

        data.notice();
    }
}
```Java
