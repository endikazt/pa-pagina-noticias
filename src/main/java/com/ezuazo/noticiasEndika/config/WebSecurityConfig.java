package com.ezuazo.noticiasEndika.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity 
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
 @Autowired
 DataSource dataSource;
 @Autowired
 public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
   auth.jdbcAuthentication().dataSource(dataSource)
  .usersByUsernameQuery(
   "select username, password from usuarios where username=?")
  .authoritiesByUsernameQuery(
   "select username, rol from usuarios_roles where username=?");
 } 
 @Override
 protected void configure(HttpSecurity http) throws Exception {
   http.authorizeRequests()
  .antMatchers("registro").access("hasRole('ROLE_ADMIN')")  
  .anyRequest().permitAll()
  .and()
    .formLogin().loginPage("/login")
    .usernameParameter("username").passwordParameter("password")
  .and()
    .logout().logoutSuccessUrl("/login?logout") 
   .and()
   .exceptionHandling().accessDeniedPage("/403")
  .and()
    .csrf();
 }
}
