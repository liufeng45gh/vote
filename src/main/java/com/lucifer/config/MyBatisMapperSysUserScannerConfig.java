package com.lucifer.config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * Created by Administrator on 2017/12/23.
 */
@Configuration
@AutoConfigureAfter(MyBatisConfiguration.class)
public class MyBatisMapperSysUserScannerConfig {

    @Primary
    @Bean(name="uerMapperScannerConfigurer")
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("userSqlSessionFactory");
        mapperScannerConfigurer.setBasePackage("com.lucifer.mapper.oauth2");
        mapperScannerConfigurer.setAnnotationClass(org.mybatis.spring.annotation.MapperScan.class);
        return mapperScannerConfigurer;
    }
}
