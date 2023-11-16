## 请求体参数
springboot 请求体参数需要是一个bean(也就是要@service @controler @Resposity注解),才能正确接受前端传过来的json数据.否则就使用`Map`作为请求体参数类型

## 返回值
springboot返回值类型,默认只是支持`String,List,Map`等数据类型作为返回值类型,会经过处理转化成JSON传入给前端.

## ResponseEntity<T>   
在Spring Boot中，`ResponseEntity`是一个带有HTTP响应的对象，它封装了响应的状态码、头部信息和响应体。它的主要作用是允许你在控制器方法中灵活地构建和返回HTTP响应。

`ResponseEntity`的泛型参数`<T>`表示响应体的类型。你可以指定任何类型作为响应体，包括自定义的Java对象、集合等。

下面是`ResponseEntity`的一些应用场景：

1. 自定义HTTP响应：通过使用`ResponseEntity`，你可以完全控制HTTP响应的状态码、头部信息和响应体。这对于处理特定的业务逻辑或错误情况非常有用。例如，你可以根据条件返回不同的状态码和错误消息。

2. 返回特定的HTTP状态码：有时候，你可能需要在控制器方法中返回特定的HTTP状态码，例如表示成功、失败、未授权等。使用`ResponseEntity`，你可以明确指定所需的状态码，并且还可以添加自定义的头部信息。

3. 返回自定义的响应体：`ResponseEntity`允许你返回自定义的Java对象作为响应体，而不仅仅局限于简单的字符串或基本类型。这样可以方便地将数据封装为对象，并在响应中返回。

4. 处理RESTful API：在开发RESTful API时，你可以使用`ResponseEntity`来构建和返回标准的HTTP响应。这样可以确保你的API遵循RESTful原则，并且能够提供一致的响应格式。

总之，`ResponseEntity`提供了更灵活和定制化的方式来构建和返回HTTP响应。它适用于各种场景，包括自定义响应、特定状态码的返回以及RESTful API的开发。


##  ResponseEntity<T> 应用场景

当使用Spring Boot和`ResponseEntity`时，以下是四个应用场景的示例代码：

1. 自定义HTTP响应：
```java
@GetMapping("/custom-response")
public ResponseEntity<String> customResponse() {
    boolean condition = true; // 假设某个条件为true

    if (condition) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Custom-Header", "Custom Value");

        return ResponseEntity.status(HttpStatus.OK)
                .headers(headers)
                .body("Custom response");
    } else {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body("Invalid request");
    }
}
```

在上述示例中，当条件为true时，使用`ResponseEntity`返回状态码200（OK），自定义的头部信息，以及响应体"Custom response"。当条件为false时，返回状态码400（Bad Request）和响应体"Invalid request"。

2. 返回特定的HTTP状态码：
```java
@GetMapping("/specific-status")
public ResponseEntity<String> specificStatus() {
    boolean condition = true; // 假设某个条件为true

    if (condition) {
        return ResponseEntity.ok("Success");
    } else {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body("Unauthorized");
    }
}
```

在上述示例中，根据条件的不同结果，使用`ResponseEntity`返回不同的HTTP状态码。当条件为true时，返回状态码200（OK）和响应体"Success"；当条件为false时，返回状态码401（Unauthorized）和响应体"Unauthorized"。

3. 返回自定义的响应体：
```java
@GetMapping("/custom-body")
public ResponseEntity<User> customBody() {
    User user = new User("John", "Doe"); // 假设有一个自定义的User类

    return ResponseEntity.ok(user);
}
```

在上述示例中，使用`ResponseEntity`返回一个自定义的Java对象（这里假设为`User`类）作为响应体。`ResponseEntity.ok()`方法表示成功状态码200（OK），并将`user`对象作为响应体返回。

4. 处理RESTful API：
```java
@GetMapping("/rest-api")
public ResponseEntity<List<User>> getUsers() {
    List<User> users = userService.getAllUsers(); // 假设从数据库获取用户列表

    return ResponseEntity.ok(users);
}
```

在上述示例中，使用`ResponseEntity`返回一个包含用户列表的Java对象（这里假设为`List<User>`）作为响应体。`ResponseEntity.ok()`方法表示成功状态码200（OK），并将`users`列表作为响应体返回。

以上示例展示了`ResponseEntity`在不同场景下的应用。你可以根据具体需求和业务逻辑，灵活使用`ResponseEntity`构建并返回符合要求的HTTP响应。
