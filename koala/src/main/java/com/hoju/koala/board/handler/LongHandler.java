package com.hoju.koala.board.handler;

import java.io.StringReader;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import org.springframework.context.annotation.Configuration;

@Configuration
@SuppressWarnings("rawtypes")
//public class LongHandler implements TypeHandler {
public class LongHandler implements TypeHandler {

	@Override
	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
		String str = (String)parameter;
		StringReader reader = new StringReader(str);
//		ps.setCharacterStream(i, reader, str.length());
		ps.setString(i, (String) parameter);
		
	}

	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		return rs.getString(columnName);
	}

	@Override
	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		return rs.getString(columnIndex);
	}

	@Override
	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return cs.getString(columnIndex);
	}
	
	
	
}
