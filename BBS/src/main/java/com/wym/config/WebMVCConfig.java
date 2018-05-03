package com.wym.config;



import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@Configuration
public class WebMVCConfig extends  WebMvcConfigurerAdapter{

    //设置默认首页
    @Override
    public void addViewControllers( ViewControllerRegistry registry ) {
        registry.addViewController( "/" ).setViewName( "forward:/welcome" );
        registry.setOrder( Ordered.HIGHEST_PRECEDENCE );
        super.addViewControllers( registry );
    }
    @Override//对静态资源进行处理,否则boot是把所有静态资源进行拦截的
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        /**
         * 内置的VersionResourceResolver有FixedVersionStrategy和ContentVersionStrategy两种策略,
         * FixedVersionStrategy可以使用某项属性,或者日期,或者其它来作为版本.
         * 而ContentVersionStrategy是使用资源内容计算出来的MD5哈希作为版本.
         * ContentVersionStrategy是个不错的默认选择,除了某些不能使用的情况下
         * (比如,带有javascript模块加截器).
         * 以下配置:如果是js的话使用FixedVersionStrategy,其它(如css,img)使用默
         * 认的ContentVersionStrategy策略.
         */
//        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/").resourceChain(true).addResolver(
//                new VersionResourceResolver().addFixedVersionStrategy("1.10", "/**/*.js").addContentVersionStrategy("/**"));
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/").resourceChain(true);


    }

}