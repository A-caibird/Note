非常抱歉，我误解了你的问题。要在底层使用Java代码解决跨域问题，你可以通过配置`CorsFilter`或者自定义`Filter`来实现。

下面是使用Java代码解决跨域问题的示例：

1. 创建一个名为`CorsFilter`的Java类，并实现`javax.servlet.Filter`接口。

   ````java
   import javax.servlet.*;
   import javax.servlet.http.HttpServletResponse;
   import java.io.IOException;

   public class CorsFilter implements Filter {
       @Override
       public void init(FilterConfig filterConfig) throws ServletException {
           // 初始化操作（可选）
       }

       @Override
       public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
           HttpServletResponse response = (HttpServletResponse) servletResponse;
           response.setHeader("Access-Control-Allow-Origin", "*");
           response.setHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
           response.setHeader("Access-Control-Allow-Headers", "Content-Type,Authorization");
           response.setHeader("Access-Control-Allow-Credentials", "true");
           response.setHeader("Access-Control-Max-Age", "3600");

           filterChain.doFilter(servletRequest, servletResponse);
       }

       @Override
       public void destroy() {
           // 销毁操作（可选）
       }
   }
   ```

   在上述示例中，我们在`doFilter`方法中设置了一些常见的跨域请求头，如`Access-Control-Allow-Origin`、`Access-Control-Allow-Methods`、`Access-Control-Allow-Headers`等。你可以根据需求进行自定义。

2. 在你的Spring Boot应用中注册该过滤器。

   - 如果你使用的是基于Servlet的容器（如Tomcat），可以在`ServletInitializer`类的`onStartup`方法中进行注册：

     ```java
     import org.springframework.boot.web.servlet.ServletContextInitializer;
     import org.springframework.stereotype.Component;

     import javax.servlet.DispatcherType;
     import javax.servlet.FilterRegistration;
     import javax.servlet.ServletContext;
     import java.util.EnumSet;

     @Component
     public class ServletInitializer implements ServletContextInitializer {
         @Override
         public void onStartup(ServletContext servletContext) throws ServletException {
             FilterRegistration.Dynamic corsFilter = servletContext.addFilter("corsFilter", CorsFilter.class);
             corsFilter.addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), true, "/*");
         }
     }
     ```

   - 如果你使用的是基于Spring Web的容器（如Spring Boot内嵌的Tomcat），可以在`WebMvcConfigurer`的实现类中进行注册：

     ```java
     import org.springframework.context.annotation.Configuration;
     import org.springframework.web.servlet.config.annotation.CorsRegistry;
     import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

     @Configuration
     public class WebConfig implements WebMvcConfigurer {
         @Override
         public void addCorsMappings(CorsRegistry registry) {
             registry.addMapping("/**")
                     .allowedOrigins("*")
                     .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                     .allowedHeaders("Content-Type", "Authorization")
                     .allowCredentials(true)
                     .maxAge(3600);
         }
     }
     ```

     在上述示例中，我们通过重写`addCorsMappings`方法来配置跨域请求。

通过以上的方式，你可以在底层使用Java代码解决Spring Boot应用的跨域问题。这样，无论是基于Servlet的容器还是基于Spring Web的容器，都能够正确处理跨域请求。
