package com.lucifer.config;


import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;


/**
 *
 * 获取第二个数据库的连接信息，在application.yml中配置，并指定特定的前缀
 *
 */
@SpringBootConfiguration
@AutoConfigureAfter({ DataBaseSysUserConfiguration.class })
@EnableTransactionManagement

public class MyBatisSysUserConfiguration {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${mybatis.typeAliasesPackage}")
    private String typeAliasesPackage;

    @Value("${mybatis.mapperLocations}")
    private String mapperLocations;

    @Value("${mybatis.configLocation}")
    private String configLocation;


    @Autowired
    @Qualifier("userDataSource")
    protected DataSource userDataSource;




    @Primary
    @Bean(name="userSqlSessionFactory")
    public SqlSessionFactory userSqlSessionFactory() throws Exception {

            SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
            factoryBean.setDataSource(userDataSource);
            factoryBean.setTypeAliasesPackage(typeAliasesPackage);
            logger.info("mapperLocations is {}",mapperLocations);
            factoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(mapperLocations));
            factoryBean.setConfigLocation(new DefaultResourceLoader().getResource(configLocation));

            SqlSessionFactory sqlSessionFactory = null;

            sqlSessionFactory = factoryBean.getObject();


            org.apache.ibatis.session.Configuration configuration = sqlSessionFactory
                    .getConfiguration();
            configuration.setMapUnderscoreToCamelCase(true);

            return sqlSessionFactory;


    }


    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(userDataSource);
    }



    @Primary
    @Bean(name="userSqlSessionTemplate")
    public SqlSessionTemplate getSqlSessionTemplate(@Qualifier("userSqlSessionFactory") SqlSessionFactory userSqlSessionFactory) throws Exception {
        SqlSessionTemplate sessionTemplate = new SqlSessionTemplate(userSqlSessionFactory);
        return sessionTemplate;
    }




}