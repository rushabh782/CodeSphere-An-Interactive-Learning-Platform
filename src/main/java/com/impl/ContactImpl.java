package com.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dao.Contactdao;
import com.entity.Contact;

@Component
public class ContactImpl implements Contactdao {

	@Autowired
	private JdbcTemplate template;
	
	@Override
	public boolean saveContact(Contact contact) {
		// TODO Auto-generated method stub
		String q = "insert into contact(name, email, message) values (?, ?, ?)";
        int i = template.update(q,
                contact.getName(),
                contact.getEmail(),
                contact.getMessage());
        return i == 1;
	}

}
