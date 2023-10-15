在Spring框架中，AOP（面向切面编程）是一种编程范式，用于将通用的横切关注点与业务逻辑进行分离。AOP通过在程序运行期间动态地将额外的行为织入到代码中，以实现横切关注点的重用和集中管理。

在Spring中，AOP的核心概念包括切点（Pointcut）、通知（Advice）、切面（Aspect）和连接点（Join Point）：

- 切点（Pointcut）：定义了在程序执行过程中哪些特定的方法或者连接点应该被拦截，即横切关注点的具体位置。

- 通知（Advice）：定义了在切点处执行的额外逻辑，包括在切点之前、之后或者周围执行的代码。

- 切面（Aspect）：将切点和通知组合在一起的模块，用于描述横切关注点的行为。

- 连接点（Join Point）：在程序执行过程中可以被拦截的特定位置，例如方法的调用、异常的抛出等。

下面是一个简单的例子，演示如何在Spring中使用AOP：

1. 创建一个普通的Java类，作为业务逻辑类。例如，创建一个名为`UserService`的类：

   ````java
   public class UserService {
       public void addUser(String username) {
           System.out.println("添加用户：" + username);
       }

       public void deleteUser(String username) {
           System.out.println("删除用户：" + username);
       }
   }
   ```

2. 创建一个切面类，实现横切关注点的逻辑。例如，创建一个名为`LoggingAspect`的切面类：

   ````java
   import org.aspectj.lang.annotation.Aspect;
   import org.aspectj.lang.annotation.Before;
   import org.springframework.stereotype.Component;

   @Aspect
   @Component
   public class LoggingAspect {

       @Before("execution(* com.example.UserService.*(..))")
       public void beforeAdvice() {
           System.out.println("执行前置通知");
       }
   }
   ```

   在上述示例中，我们使用`@Aspect`注解将该类标记为切面类，使用`@Before`注解定义了一个前置通知，该通知会在匹配到`com.example.UserService`类下的任何方法执行前调用。

3. 创建一个Spring配置类，并启用AOP。

   ````java
   import org.springframework.context.annotation.ComponentScan;
   import org.springframework.context.annotation.Configuration;
   import org.springframework.context.annotation.EnableAspectJAutoProxy;

   @Configuration
   @ComponentScan(basePackages = "com.example")
   @EnableAspectJAutoProxy
   public class AppConfig {
   }
   ```

   在上述示例中，我们使用`@EnableAspectJAutoProxy`注解启用了Spring对AOP的支持。

4. 创建一个入口类，用于加载Spring配置并执行业务逻辑。

   ````java
   import org.springframework.context.annotation.AnnotationConfigApplicationContext;

   public class MainApp {

       public static void main(String[] args) {
           AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

           UserService userService = context.getBean(UserService.class);

           userService.addUser("Alice");
           userService.deleteUser("Bob");

           context.close();
       }
   }
   ```

   在上述示例中，我们使用`AnnotationConfigApplicationContext`加载配置类并获取`UserService`的实例。然后，我们调用了`addUser`和`deleteUser`方法，这些方法会被切面中定义的前置通知拦截并执行。

当你运行上述代码时，你会看到如下输出：

```
执行前置通知
添加用户：Alice
执行前置通知
删除用户：Bob
```

从输出中可以看出，前置通知在每次调用`addUser`和`deleteUser`方法之前都会被执行。

这只是一个简单的AOP示例，实际上，Spring的AOP功能非常强大，并提供了更多的通知类型（如后置通知、异常通知、环绕通知等）以及更灵活的切点表达式语言，可以通过切点表达式精确地选择要拦截的方法。你还可以在切面中引入其他通知类型，以实现更复杂的横切关注点逻辑。

请注意，以上示例仅介绍了Spring框架中AOP的基本概念和用法。实际上，AOP在实际应用中可能涉及更复杂的场景和用法。如果你有特定的问题或者需要更详细的示例，请提供更多的信息，我将尽力帮助你。
