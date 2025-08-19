package com.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.Question;

public class RowMapperImpl implements RowMapper<Question> {

	@Override
	public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Question q = new Question();
		q.setId(rs.getInt("id"));
		q.setName(rs.getString("name"));
		q.setAnswer(rs.getString("answer"));
		q.setType(rs.getString("type"));
        q.setCategory(rs.getString("category")); // Add this line
		return q;
	}

}
