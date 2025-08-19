package com.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dao.Questiondao;
import com.entity.Question;

@Component
public class Questionimpl implements Questiondao {

	@Autowired
	private JdbcTemplate template;
	
	@Override
	public boolean addQuestion(Question question) {
		// TODO Auto-generated method stub
        String q = "insert into question(name, answer, type, category) values(?,?,?,?)";
        int x = template.update(q, question.getName(), question.getAnswer(), question.getType(), question.getCategory());
        return x > 0;
	}

	@Override
	public List<Question> getAllQuestion() {
		// TODO Auto-generated method stub
		String q = "select * from question";
		return template.query(q, new RowMapperImpl());
	}

	
    @SuppressWarnings("deprecation")
	@Override
    public List<Question> getQuestionsByCategory(String category) {
        String q = "select * from question where category = ?";
        return template.query(q, new Object[]{category}, new RowMapperImpl());
    }
	
	@Override
	public boolean deleteQuestionById(int id) {
		// TODO Auto-generated method stub
		String q = "delete from question where id=?";
		int x = template.update(q,id);
		if(x>0) {
			return true;
		}else {
			return false;			
		}
	}

	@SuppressWarnings("deprecation")
	@Override
	public Question getQuestionById(int id) {
		// TODO Auto-generated method stub
		String q = "select * from question where id=?";
		return template.queryForObject(q, new Object[] {id}, new RowMapperImpl());
	}

	@Override
	public boolean updateQuestionById(Question question, int id) {
		// TODO Auto-generated method stub
		String q = "update question set name=?,answer=?,type=? where id=?";
		int x = template.update(q,question.getName(),question.getAnswer(),question.getType(),id);
		if(x>0) {
			return true;
		}else {
			return false;			
		}
	}
	
	@Override
	public List<Question> getMCQQuestions() {
	    String query = "SELECT * FROM question WHERE type = 'mcq'";
	    System.out.println("Executing query: " + query); // Debug log
	    List<Question> results = template.query(query, new RowMapperImpl());
	    System.out.println("Found " + results.size() + " MCQs"); // Debug log
	    return results;
	}

//	@SuppressWarnings("deprecation")
//	@Override
//	public List<Question> getQuestionsByType(String type) {
//		// TODO Auto-generated method stub
//		String query = "SELECT * FROM question WHERE type = ? ORDER BY id";
//	    return template.query(query, new Object[]{type}, new RowMapperImpl());
//	}


	
	

}
