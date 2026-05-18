package com.example.webflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.webflow.config.FlowBuilderServicesBuilder;
import org.springframework.webflow.config.FlowDefinitionRegistryBuilder;
import org.springframework.webflow.config.FlowExecutorBuilder;
import org.springframework.webflow.definition.registry.FlowDefinitionRegistry;
import org.springframework.webflow.engine.builder.support.FlowBuilderServices;
import org.springframework.webflow.executor.FlowExecutor;
import org.springframework.webflow.mvc.builder.MvcViewFactoryCreator;
import org.springframework.webflow.mvc.servlet.FlowHandlerAdapter;
import org.springframework.webflow.mvc.servlet.FlowHandlerMapping;

import java.util.Collections;

@Configuration
public class WebFlowConfig {
    @Autowired
    private ApplicationContext applicationContext;

//    @Bean
//    public FlowBuilderServices flowBuilderServices() {
//        return new FlowBuilderServicesBuilder(applicationContext).build();
//    }
    @Bean
    public FlowBuilderServices flowBuilderServices() {
        return new FlowBuilderServicesBuilder(applicationContext)
                .setViewFactoryCreator(mvcViewFactoryCreator())
                .build();
    }
    @Bean
    public MvcViewFactoryCreator mvcViewFactoryCreator() {
        MvcViewFactoryCreator creator = new MvcViewFactoryCreator();
        creator.setViewResolvers(Collections.singletonList(viewResolver()));
        return creator;
    }

    @Bean
    public FlowDefinitionRegistry flowRegistry(FlowBuilderServices builderServices) {
        return new FlowDefinitionRegistryBuilder(applicationContext, builderServices)
                .setBasePath("classpath:/flows")
                .addFlowLocation("simple-flow.xml", "simpleFlow")
                .build();
    }

    @Bean
    public FlowExecutor flowExecutor(FlowDefinitionRegistry registry) {
        return new FlowExecutorBuilder(registry, applicationContext).build();
    }

    @Bean
    public FlowHandlerMapping flowHandlerMapping(FlowDefinitionRegistry registry) {
        FlowHandlerMapping mapping = new FlowHandlerMapping();
        mapping.setFlowRegistry(registry);
        mapping.setOrder(-1);
        return mapping;
    }

    @Bean
    public FlowHandlerAdapter flowHandlerAdapter(FlowExecutor executor) {
        FlowHandlerAdapter adapter = new FlowHandlerAdapter();
        adapter.setFlowExecutor(executor);
        return adapter;
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
}
