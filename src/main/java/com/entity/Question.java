package com.entity;

import java.beans.Transient;
import java.util.List;

public class Question {
	private int id;
	private String name;
	private String answer;
	private String type;
	private String category;
	private List<String> options;
    private String correctAnswer;  // also needed for JSP


	
	
	public String getCorrectAnswer() {
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public Question(int id, String name, String answer, String type, String category) {
		super();
		this.id = id;
		this.name = name;
		this.answer = answer;
		this.type = type;
		this.category = category;
	}
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", name=" + name + ", answer=" + answer + ", type=" + type + ", category="
				+ category + ", options=" + options + ", correctAnswer=" + correctAnswer + "]";
	}
	
	
}
