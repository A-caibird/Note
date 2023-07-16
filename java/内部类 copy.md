# 内部类

## 内部类作为外包类成员使用

```java
class out{
    in a=new in();
    class in{
       int size;
    }
}
```

## 内部类访问外包内同名变量`outer.this.size访问外包类的size`

```java
class out{
    Integer size=10;
    class in{
        Integer size=0;
        public int add()
        {
            return size+out.this.size;
        }
    }
}
```

## 外包类语句块中定义内部类`返回Object基类,其中toString返回类名称`

```java
class out{
    public Object makein()
    {
        class in
        {
//            @Override
//            public String toString() {
//                return ("dfsadfaf");
//            }
        }
        return new in();
    }
    public static void maian() {
        out o=new out();
        Object b= o.makein();
        System.out.println(b.toString());
    }
}

public class Main{
    Integer size=0;
    public static void main(String[] args) {
       out a=new out();
       a.maian();
    }

}

```

## 匿名类:使用一次,声明类的同时可以创建类的实例

```java
class classa{
    void aMethod()
    {};
}
class a{
    public void func(){
        classa b=new classa(){
            void aMethod()
            {
                System.out.println("fasd");
            }
        };
    }
}
```

## Lambda表达式

匿名函数: 一次使用,省略函数返回值,省略形参参数.

------

```java
(x,y)-> return 1;
```

