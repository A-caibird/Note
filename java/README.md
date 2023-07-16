
# 面向对象程序设计的特点java

## **封装**：非静态类变量`private`静态类变量`static`成员函数<font color=orange>[method]</font>`public`

## **继承**

### **继承了什么？不能继承什么？**

#### **<font color=orange >子类能够继承父类的：</font>**

1. 父类的`非私有`成员变量和成员方法（包括构造方法）

2. 父类实现的接口

3. 父类 `static` 修饰的成员变量和成员方法，虽然可以被继承但不能被子类重写。

4. 父类的私有成员变量和私有成员方法:``需要暴力打开`

5. 父类的内部类，外部接口和枚举类型。

#### **<font color=orange> 不能继承父类的：</font>**

1. 父类的构造方法，但可以通过 `super()` 调用

2. 父类 `final` 修饰的成员方法、成员变量和构造方法，不能被子类重写或覆盖。

   --------

###  **基础语法 `sportsman继承people`**

```java
public people{
    public static void main{
    } 
}
public sportsman extends people
{
    
}
```
--------

###  **`@override`子类重写父类方法**

- 子类可以重写父类中的任何`非final方法`，包括继承下来的public、protected和default访问权限的方法。
- `final方法`表示常方法不可以改变。
- `方法异常`：子类重写方法申明抛出的异常应该与父类被重写方法申明抛出的异常一样或者范围更小! 

- 重写方法的声明（方法名、参数类型、返回值类型）必须和父类方法的声明相同。同时，在重写方法时，`子类不能降低父类方法的访问权限`，即不能从public改为protected或default访问权限。

  ```java
  public class test {
  }
  
  class people {
      protected void show() {
          System.out.println("people");
      }
      public void id(){
          System.out.println("id");
      }
      private void name(){
          System.out.println("name");
      }
  
      final void age(){
          System.out.println("age");
      }
  }
  class student extends people{
      @Override
     public void show() {
          System.out.println("student");
      }
      public void id(){
          super.id();
      }
      private void name(){
          System.out.println("name");
      }
  //    final void age(){
  //        System.out.println("age");
  //    } //final方法不能被重写
  }					 
  ```
  -------

### **`super`关键字：`引用当前对象的父类对象`**

- `变量中的父类对象引用，而不是类，故无法调用static成员和方法，因为这是所属父类的不是所属父类对象的`

- 调用父类的构造函数：`子类的构造函数中，`如果要调用super()，则super()` 必须放在构造函数的第一行，否则会编译出错。`

  ```java
  public class Child extends Parent {
      public Child() {
          super(); // 调用父类的默认构造函数
      }
  
      public Child(int value) {
          super(value); // 调用父类的构造函数，并传递参数
      }
  }
  ```
  --------
-  调用父类的成员以及方法

  ```java
  public class Parent {
      public void doSomething() {
          System.out.println("Parent do something...");
      }
  }
  
  public class Child extends Parent {
      @Override
      public void doSomething() {
          super.doSomething(); // 调用父类的doSomething()方法
          System.out.println("Child do something...");
      }
  }
  ```

  `不能调用父类的private方法和变量，不能调用static`
  
  ---------

- **`子类构造函数默认会调用父类无参构造函数`**

    ```java
      public class test {
          public static void main(String[] args) {
              student a = new student(1);
          }
      }
    
      class people {
          private int b;
          people()
          {
              b=0;
              System.out.println("people");
          }
          people(int a)
          {
              b=a;
          }
      }
      class student extends people{
          private int c;
          student(int a)
          {
              c=a;
          }
      }
    ```

    **`输出`： people**

    -----

    ### `this`关键字

    指代本类引用，java中**不能**通过给**形参赋初始值**的方式来设计构造函数，故需要通过调用`兄弟构造器`来实现.

    ```java
    public class People {
        private int b;
        People() {
            this(0); // 默认调用参数为 0 的构造函数
        }
        People(int a) {//兄弟构造器
            b = a;
        }
    }
    ```

    ### **子类访问所继承的父类的内部类**

    子类可以继承父类的内部类，但是需要注意的是，访问权限会受到限制。

    如果父类内部类是私有（private）或包内私有（没有访问修饰符或default），则子类无法访问该内部类。如果父类内部类具有protected或public访问修饰符，则子类可以访问该内部类。

    在子类中访问继承的父类内部类的语法格式为：`Parent.Inner`，其中 `Parent` 是父类名称，`Inner` 是内部类名称。如果父类的内部类是静态的，还可以通过类名直接访问：`Parent.Inner.method()`。

    ```java
    public class test {
        public static void main(String[] args) {
            student a = new student(1);
            a.show();
        }
    }
    
    class people {
        private int b;
        people()
        {
            b=0;
            System.out.println("people");
        }
        people(int a)
        {
            b=a;
        }
       public static class teacher{
           public void shuchu()
           {
               System.out.println("people inner");
           }
        }
    }
    
    class student extends people{
        private int c;
        student(int a)
        {
            c=a;
        }
        public void show()
        {
           people.teacher dat=new people.teacher();
           new people.teacher().shuchu();
        }
    }
    ```

    ------

    ### **子类变量所包含元素**

    - [ ] 默认父类构造参数或者调用`super`生成的父类对象地址
    - [ ] 子类对象地址`this`

    ## **多态**

    

    ## object类

    `Object` 是 Java 语言中所有类的祖先类，因此它拥有一些在所有类中通用的属性和方法。

    在 Java 中，所有的类都直接或间接继承自 `Object` 类，因此 `Object` 类中定义的方法可以被所有的对象所使用。例如，`toString()` 方法用于将对象转换为字符串表示形式，所有的 Java 对象都可以调用该方法。

    除了 `toString()` 方法，`Object` 类中还定义了一些其他常用的方法，如：

    - `equals(Object obj)` 判断当前对象和参数对象是否相等
    - `hashCode()` 返回当前对象的哈希值
    - `getClass()` 返回当前对象的类的运行时类型

    在 Java 中如果没有指定基类，则编译器默认将其声明为继承自 `Object` 类。因此，即使一个 class 没有显式地继承 `Object` 类，它也会自动成为 `Object` 的子类，从而获得 `Object` 类的所有属性和方法。

    
