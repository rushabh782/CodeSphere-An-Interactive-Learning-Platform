package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.Contactdao;
import com.entity.Contact;
import com.entity.Question;
import com.entity.User;
import com.impl.ContactImpl;
import com.impl.Questionimpl;
import com.impl.UserImpl;

@Controller
public class QuestionController {

	@Autowired
	private Questionimpl questionimpl;
	
	@Autowired
	private Contactdao contactDao;
	
	@Autowired
	private UserImpl userImpl;
	
	
	@PostMapping("/registerUser")
	public String registerUser(@RequestParam String username,@RequestParam String password,Model model) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
	    boolean saved = userImpl.saveUser(user);
	    if (saved) {
	        model.addAttribute("msg", "Registration successful. Please log in.");
	    } else {
	        model.addAttribute("msg", "Registration failed.");
	    }
	    return "redirect:/login"; 
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String redirectToRegister() {
	    return "redirect:/register"; // Forward to register.jsp directly
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerPage() {
	    return "register";
	}


	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String redirectToLogin() {
//	    return "redirect:/login";
//	}

	

//	@RequestMapping(value = "/index", method = RequestMethod.GET)
//	public String index(HttpServletRequest request, Model model) {
//	    HttpSession session = request.getSession(false);
//	    if (session == null || session.getAttribute("user") == null) {
//	        return "redirect:/login";
//	    }
//
//	    List<Question> lq = questionimpl.getAllQuestion();
//	    model.addAttribute("lq", lq);
//	    return "index";
//	}
	
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model, 
                       @RequestParam(value = "category", required = false) String category) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        List<Question> lq;
        if (category != null && !category.isEmpty() && !category.equals("All")) {
            lq = questionimpl.getQuestionsByCategory(category);
        } else {
            lq = questionimpl.getAllQuestion();
        }
        
        model.addAttribute("lq", lq);
        return "index";
    }


	  @RequestMapping("/contactus")
	    public String showContactForm() {
	        return "cntactus"; 
	    }
	  
	  @PostMapping("/submitContact")
	    public String submitContact(@RequestParam String name,
	                                @RequestParam String email,
	                                @RequestParam String message,
	                                Model model) {

	        Contact contact = new Contact();
	        contact.setName(name);
	        contact.setEmail(email);
	        contact.setMessage(message);

	        boolean result = contactDao.saveContact(contact);

	        if (result) {
	            model.addAttribute("msg", "Thank you for contacting us!");
	        } else {
	            model.addAttribute("msg", "Something went wrong. Please try again.");
	        }

	        return "cntactus";
	    }
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String index(Model model) {
//		List<Question> lq = questionimpl.getAllQuestion();
//		model.addAttribute("lq",lq);
//		return "index";
//	}
	
	    // Update admin method to handle category filter
	    @RequestMapping(value = "/admin", method = RequestMethod.GET)
	    public String admin(HttpServletRequest request, Model model,
	                       @RequestParam(value = "category", required = false) String category) {
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user") == null) {
	            return "redirect:/login";
	        }

	        List<Question> lq;
	        if (category != null && !category.isEmpty() && !category.equals("All")) {
	            lq = questionimpl.getQuestionsByCategory(category);
	        } else {
	            lq = questionimpl.getAllQuestion();
	        }
	        
	        model.addAttribute("lq", lq);
	        return "admin";
	    }

	
//	@RequestMapping(value = "/addquestion",method = RequestMethod.POST)
//	public String addQuestion(@ModelAttribute Question question) {
//		if(questionimpl.addQuestion(question)) {
//			return "redirect:/admin";
//		}else {
//			return "redirect:/admin";			
//		}
//	}
	
    // Update addQuestion method to handle category
    @RequestMapping(value = "/addquestion", method = RequestMethod.POST)
    public String addQuestion(@ModelAttribute Question question, 
                             @RequestParam("category") String category) {
        question.setCategory(category);
        if(questionimpl.addQuestion(question)) {
            return "redirect:/admin";
        } else {
            return "redirect:/admin";            
        }
    }
    
	
	@RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
	public String deleteQuestionById(@PathVariable("id") int id) {
		if(questionimpl.deleteQuestionById(id)) {
			return "redirect:/admin";
		}else {
			return "redirect:/admin";			
		}
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id,Model model) {
		Question q = questionimpl.getQuestionById(id);
		model.addAttribute("q", q);
		return "edit";
	}
	
	@RequestMapping(value = "/updatequestion/{id}",method = RequestMethod.POST)
	public String updateQuestion(@ModelAttribute Question question,@PathVariable("id") int id) {
		if(questionimpl.updateQuestionById(question, id)) {
			return "redirect:/admin";
		}
		else {
			return "redirect:/admin";
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/aboutus",method = RequestMethod.GET)
    public String showAboutUsPage() {
        return "aboutus"; 
    }
	
	@RequestMapping(value = "/logindata", method = RequestMethod.POST)
	public String checkLogin(@RequestParam("username") String username,@RequestParam("password") String password,HttpServletRequest request) {
		HttpSession session = request.getSession();
	    if ("admin".equals(username) && "12345".equals(password)) {
	        session.setAttribute("user", "admin");
	        return "redirect:/admin";
	    }

	    // Check if user exists in DB
	    User user = userImpl.getUserByUsernameAndPassword(username, password);

	    if (user != null) {
	        session.setAttribute("user", username);
	        return "redirect:/index";
	    } else {
	        request.setAttribute("error", "Invalid credentials.");
	        return "login"; // Use forward, not redirect, to retain error message
	    }
	}
	
	@RequestMapping(value = "/logout",method= RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/login";
	}

	
	 @RequestMapping("/java-compiler")
	    public String javaCompiler() {
	        return "java-compiler";
	    }
	    
	    @RequestMapping("/c-compiler")
	    public String cCompiler() {
	        return "c-compiler";
	    }
	    
	    @RequestMapping("/python-compiler")
	    public String pythonCompiler() {
	        return "python-compiler";
	    }
	    
//	    @RequestMapping(value = "/mcqs", method = RequestMethod.GET)
//	    public String showMCQs(Model model) {
//	        List<Question> questions = questionimpl.getMCQQuestions(); // You'll need to implement this method
//	        model.addAttribute("questions", questions);
//	        return "mcqs";
//	    }
	    
	 // In your controller
//	    @RequestMapping(value = "/mcqs", method = RequestMethod.GET)
//	    public String showMCQs(Model model) {
//	        System.out.println("DEBUG: Fetching MCQs..."); // Add this
//	        List<Question> questions = questionimpl.getMCQQuestions();
//	        System.out.println("DEBUG: Found " + questions.size() + " questions"); // Add this
//	        questions.forEach(q -> System.out.println("Q: " + q.getName())); // Debug each question
//	        model.addAttribute("questions", questions);
//	        return "mcqs";
//	    }
	    
//	    @RequestMapping(value = "/mcqs", method = RequestMethod.GET)
//	    public String showMCQs(Model model) {
//	        System.out.println("DEBUG: Fetching MCQs...");
//	        List<Question> questions = questionimpl.getMCQQuestions();
//	        System.out.println("DEBUG: Found " + questions.size() + " questions");
//	        
//	        // Detailed debug for each question
//	        for (Question q : questions) {
//	            System.out.println("Question ID: " + q.getId());
//	            System.out.println("Question Text: " + q.getName());
//	            System.out.println("Answer: " + q.getAnswer());
//	            System.out.println("Type: " + q.getType());
//	            System.out.println("Category: " + q.getCategory());
//	            System.out.println("Options: " + q.getOptions());
//	            System.out.println("----------------------");
//	            // Suppose q.getAnswer() is like "Option 1: JRE|Option 2: JIT|Option 3: JDK|Option 4: JVM|Correct Answer: Option 3"
//	            String[] parts = q.getAnswer().split("\\|");
//	            List<String> options = new ArrayList<>();
//	            String correct = "";
//	            for (String part : parts) {
//	                if (part.contains("Correct Answer")) {
//	                    correct = part.replace("Correct Answer: ", "").trim();
//	                } else {
//	                    options.add(part.trim());
//	                }
//	            }
//	            q.setOptions(options);
//	            q.setAnswer(correct);  // Add this field to your Question entity
//	        }
//	        model.addAttribute("questions", questions);
//
//	        return "mcqs";
//	    }
	    
	    @GetMapping("/mcqs")
	    public String showMcqs(Model model) {
	        List<Question> questions = questionimpl.getMCQQuestions();
	        System.out.println(questions);

	        for (Question q : questions) {
	            if (q.getAnswer() != null && !q.getAnswer().isEmpty()) {
	                String[] lines = q.getAnswer().split("\\r?\\n");
	                List<String> opts = new ArrayList<>();
	                String correct = "";

	                for (String line : lines) {
	                    line = line.trim();
	                    if (line.startsWith("Correct Answer")) {
	                        correct = line.replace("Correct Answer:", "").trim();
	                    } else if (line.startsWith("Option")) {
	                        opts.add(line);
	                    }
	                }

	                q.setOptions(opts);
	                q.setCorrectAnswer(correct);
	            }
	        }

	        model.addAttribute("questions", questions);
	        return "mcqs";
	    }
	    
	    @GetMapping("/springmcqs")
	    public String showMcqsSpring(Model model) {
	        List<Question> questions = questionimpl.getMCQQuestions();
	        System.out.println(questions);

	        for (Question q : questions) {
	            if (q.getAnswer() != null && !q.getAnswer().isEmpty()) {
	                String[] lines = q.getAnswer().split("\\r?\\n");
	                List<String> opts = new ArrayList<>();
	                String correct = "";

	                for (String line : lines) {
	                    line = line.trim();
	                    if (line.startsWith("Correct Answer")) {
	                        correct = line.replace("Correct Answer:", "").trim();
	                    } else if (line.startsWith("Option")) {
	                        opts.add(line);
	                    }
	                }

	                q.setOptions(opts);
	                q.setCorrectAnswer(correct);
	            }
	        }

	        model.addAttribute("questions", questions);
	        return "springmcqs";
	    }
	    
	    @GetMapping("/sqlmcqs")
	    public String showMcqsS(Model model) {
	        List<Question> questions = questionimpl.getMCQQuestions();
	        System.out.println(questions);

	        for (Question q : questions) {
	            if (q.getAnswer() != null && !q.getAnswer().isEmpty()) {
	                String[] lines = q.getAnswer().split("\\r?\\n");
	                List<String> opts = new ArrayList<>();
	                String correct = "";

	                for (String line : lines) {
	                    line = line.trim();
	                    if (line.startsWith("Correct Answer")) {
	                        correct = line.replace("Correct Answer:", "").trim();
	                    } else if (line.startsWith("Option")) {
	                        opts.add(line);
	                    }
	                }

	                q.setOptions(opts);
	                q.setCorrectAnswer(correct);
	            }
	        }

	        model.addAttribute("questions", questions);
	        return "sqlmcqs";
	    }



	    
	    @RequestMapping(value = "/admin/add-mcqs", method = RequestMethod.GET)
	    public String showAddMCQsForm(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user") == null || !"admin".equals(session.getAttribute("user"))) {
	            return "redirect:/login";
	        }
	        return "add-mcqs";
	    }
	    
	    @PostMapping("/admin/save-mcq") // Use @PostMapping instead of @RequestMapping
	    public String saveMCQ(
	        @RequestParam String questionText,
	        @RequestParam String option1,
	        @RequestParam String option2,
	        @RequestParam String option3,
	        @RequestParam String option4,
	        @RequestParam String correctAnswer,
	        @RequestParam String category,
	        HttpServletRequest request) {
	        
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user") == null || !"admin".equals(session.getAttribute("user"))) {
	            return "redirect:/login";
	        }
	        
	        // Create a Question object with the MCQ data
	        Question mcq = new Question();
	        mcq.setName(questionText);
	        
	        // Format the answer to include all options and mark the correct one
//	        String answer = String.format(
//	        	    "Option 1: %s\nOption 2: %s\nOption 3: %s\nOption 4: %s\nCorrect Answer: Option %s", 
//	        	    option1, option2, option3, option4, correctAnswer
//	        	);
	        String answer = String.join("|",
	        	    "Option 1: " + option1,
	        	    "Option 2: " + option2,
	        	    "Option 3: " + option3,
	        	    "Option 4: " + option4,
	        	    "Correct Answer: Option " + correctAnswer
	        	);

	        mcq.setAnswer(answer);
	        
	        mcq.setType("mcq"); // Set type as MCQ
	        mcq.setCategory(category);
	        
	        // Save the MCQ
	        questionimpl.addQuestion(mcq);
	        
	        return "redirect:/admin/add-mcqs?success=true";
	    }
	    
	    
}
