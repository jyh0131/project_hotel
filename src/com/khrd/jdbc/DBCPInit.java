package com.khrd.jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;


@SuppressWarnings("serial")   
public class DBCPInit extends HttpServlet { //커넥션 풀을 만드는 공장🏭

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}

	private void loadJDBCDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private void initConnectionPool() {
		try {
			String url = "jdbc:mysql://localhost:3306/project_hotel";
			String userId = "root";
			String userPw = "rootroot";

			ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, userId, userPw);
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);

			/*
			 	- select 1 -
			 	커넥션을 검사할 때 사용할 쿼리를 설정한다.
			 	bad커넥션(사용하고 반납하지 않은 커넥션)을 DBCP의 connection pool에선 여전히 가지고 있는 상태일 때,
			 	DB관련 프로그램이 호출되면 커넥션 관련 에러가 발생하게 된다.
			 	java에서 DB를 사용하기 전에 해당 connection이 정상적인지 검사하는 옵션이다.
			 	우리가 따로 쿼리를 연결할 수 있지만, select 1은 Microsoft SQL Server에서 권장하는 방법이다. 
			 */
			poolableConnFactory.setValidationQuery("select 1");

			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5); //검사주기(밀리세컨드)
			poolConfig.setTestWhileIdle(true);
			poolConfig.setMinIdle(4); //사용할 수 있는 최소 커넥션 갯수
			poolConfig.setMaxTotal(50); //사용할 수 있는 최대 커넥션 갯수

			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory,
					poolConfig);
			poolableConnFactory.setPool(connectionPool);

			Class.forName("org.apache.commons.dbcp2.PoolingDriver");

			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("project_hotel", connectionPool); //내가 만든 커넥션풀의 이름. 보통 DB이름과 같은 이름을 쓴다.
               
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}// end of class
