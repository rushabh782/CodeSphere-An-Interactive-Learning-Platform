package com.dao;

import java.util.List;

import com.entity.Question;

public interface Questiondao {
public boolean addQuestion(Question question);
public List<Question> getAllQuestion();
public List<Question> getQuestionsByCategory(String category); // New method
public boolean deleteQuestionById(int id);
public Question getQuestionById(int id);
public boolean updateQuestionById(Question question,int id);
public List<Question> getMCQQuestions(); // Add this line
//List<Question> getQuestionsByType(String type); // Add this method
}
   