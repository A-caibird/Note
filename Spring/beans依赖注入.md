在Spring框架中，Beans之间的依赖注入是通过IoC容器来实现的。通过依赖注入，一个Bean可以声明它所需要的其他Bean作为依赖，并且IoC容器负责在创建Bean时自动解析依赖关系并注入所需的依赖。

在Spring中，有几种常见的方式来进行依赖注入：

1. 构造函数注入（Constructor Injection）：通过构造函数将依赖注入到Bean中。这种方式要求依赖是必需的，并且在创建Bean时必须提供所有所需的依赖。示例代码如下：

```java
public class MyBean {
    private Dependency dependency;

    public MyBean(Dependency dependency) {
        this.dependency = dependency;
    }
}
```

2. Setter方法注入（Setter Injection）：通过Setter方法将依赖注入到Bean中。这种方式允许依赖是可选的，可以在Bean创建后通过Setter方法来注入依赖。示例代码如下：

```java
public class MyBean {
    private Dependency dependency;

    public void setDependency(Dependency dependency) {
        this.dependency = dependency;
    }
}
```

3. 字段注入（Field Injection）：通过直接将依赖注入到字段上来实现依赖注入。这种方式需要将字段声明为私有，并使用`@Autowired`或其他相关的注解来标记依赖。示例代码如下：

```java
public class MyBean {
    @Autowired
    private Dependency dependency;
}
```

4. 方法注入（Method Injection）：通过方法将依赖注入到Bean中。这种方式类似于Setter方法注入，但可以在方法参数上使用注解来标记依赖。示例代码如下：

```java
public class MyBean {
    private Dependency dependency;

    @Autowired
    public void injectDependency(Dependency dependency) {
        this.dependency = dependency;
    }
}
```

通过以上方式，可以在一个Bean中声明它所依赖的其他Bean，并通过IoC容器自动进行依赖注入。在Spring中，可以使用`@Autowired`注解或其他相关的注解来标记需要注入的依赖。同时，还可以通过配置文件（如XML配置）或其他方式来告诉IoC容器如何创建和组装这些Bean。

通过依赖注入，对象之间的依赖关系被解耦出来，使得代码更加灵活、可扩展和可维护。开发者可以专注于编写业务逻辑，而无需关心对象的创建和管理，这样可以提高代码的可测试性和可重用性。
