# 🌐 EduSite – An Interactive Learning Platform 🎓💻  

CodeSphere is a **Spring MVC + JDBC + JSP powered educational platform** designed for students, developers, and educators. It offers **topic-wise programming practice, MCQs, and an in-browser IDE** to boost coding skills interactively.  

---

## ✨ Features  

### 👨‍🎓 User Features  
- ✅ Topic-wise questions across **Java, Advanced Java, Spring, Spring Boot, SQL, JavaScript**, and more.  
- ✅ Practice **MCQs** by category for self-assessment.  
- ✅ **In-browser IDE** to write, run, and test code instantly without external setup.  

### 👨‍💻 Admin Features  
- 🔧 Upload and manage questions visible to users.  
- 🔧 Add new MCQ questions.  
- 🔧 Edit/Delete existing questions for seamless content updates.  

---

## 🛠️ Tech Stack  

- **Backend**: Spring MVC, Spring JDBC, Spring Core  
- **Frontend**: JSP, HTML, CSS, JavaScript  
- **Database**: MySQL  
- **Server**: Apache Tomcat  
- **IDE**: Eclipse / IntelliJ  

---

## 🚀 Getting Started  

Follow these steps to set up the project locally:  

1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/codesphere.git
cd codesphere

2️⃣ Setup Database (MySQL)
Create a new MySQL database (e.g., codesphere_db).
Import the provided SQL file (if available) or create tables for:

1. user
2. question
3. contact

3️⃣ Configure Database Connection
Update your applicationContext.xml / JDBC config with:

<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://localhost:3306/codesphere_db"/>
    <property name="username" value="your-username"/>
    <property name="password" value="your-password"/>
</bean>

4️⃣ Deploy on Tomcat

Run the project on Apache Tomcat (v9 or above).


Future Scope
🔮 AI-based question recommendations
🔮 Gamification with badges and leaderboards
🔮 Expand to cover Data Structures, Algorithms, and Aptitude
