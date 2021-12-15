package com.lucifer.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;


@SpringBootConfiguration
@EnableTransactionManagement
public class DataBaseSysUserConfiguration {

    @Value("${jdbc-user.url}")
    private String url;

    @Value("${jdbc-user.driverClass}")
    private String driverClassName;

    @Value("${jdbc-user.username}")
    private String userName;

    @Value("${jdbc-user.password}")
    private String password;

    private static Logger log = LoggerFactory.getLogger(DataBaseSysUserConfiguration.class);


    @Bean(name = "userDataSource")
    @Primary
    public DataSource dataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setJdbcUrl(url);
        dataSource.setDriverClass(driverClassName);
        dataSource.setUser(userName);
        dataSource.setPassword(password);
        dataSource.setInitialPoolSize(5);
        dataSource.setMinPoolSize(2);
        dataSource.setMaxPoolSize(10);
        dataSource.setIdleConnectionTestPeriod(3000);
        return dataSource;
    }



}