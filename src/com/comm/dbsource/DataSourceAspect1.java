package com.comm.dbsource;

import java.lang.reflect.Method;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.stereotype.Component;


/**
 * 执行dao方法之前的切面
 * 获取datasource对象之前往HandleDataSource中指定当前线程数据源路由的key
 * @author Administrator
 *
 */
//@Aspect
//@Component
public class DataSourceAspect1 {

    private Logger logger = Logger.getLogger(DataSourceAspect1.class);
    /**
     * 在dao层方法之前获取datasource对象之前在切面中指定当前线程数据源路由的key
     */
    @Pointcut("execution(* com.yrkj.*.service.*.*(..))")
    public void declareJoinPointerExpression() {}
    @Before("declareJoinPointerExpression()")
     public void before(JoinPoint point)
        {       
    	 System.out.println("ggggggggggggggggggggggggggggggggg");
             Object target = point.getTarget();
//             System.out.println(target.toString());
             String method = point.getSignature().getName();
             logger.info(method);
             Class<?>[] classz = target.getClass().getInterfaces();
             Class<?>[] parameterTypes = ((MethodSignature) point.getSignature())
                     .getMethod().getParameterTypes();
             try {
                 Method m = classz[0].getMethod(method, parameterTypes);
                 System.out.println(m.isAnnotationPresent(DataSource.class));
                 if (m != null && m.isAnnotationPresent(DataSource.class)) {
                     DataSource data = m.getAnnotation(DataSource.class);
                     logger.info("调用方法："+m.getName());
                     logger.info("用户选择数据库库类型："+data.value());
                     HandleDataSource.putDataSource(data.value());
                 }else{
                     //默认的数据库源Key
                     String defaultDataSourceKey = "mysql";
//                     String defaultDataSourceKey = PropertiesUtil.getValue("defaultDataSourceKey");
                     //当前线程的数据源key
                     String nowDataSource = HandleDataSource.getDataSource();
                     if(defaultDataSourceKey==null){
                         defaultDataSourceKey = "";
                     }
                     if(nowDataSource!=null&&!nowDataSource.equals(defaultDataSourceKey)){
                         logger.info("无@DataSource默认数据库类型："+defaultDataSourceKey);
                         HandleDataSource.putDataSource(defaultDataSourceKey);
                     }
                 }
             } catch (Exception e) {
                 e.printStackTrace();
             }
        }
}