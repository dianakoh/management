## Daily user management ##

### Management 실행 절차 ###
	* Management.war 압축 해제 후 이클립스 실행
	* MySQL local db table 생성
	* url, dbId, dbPassword 수정 

### MySQL local db table 생성 ###
	* users(String id, String pw, String name, Date birth, String email, String img);
	* phoneBook(int no, String userID, String name, int phone, Date birth, String email);
	* schedule(int no, String userID, String title, String content, Date scheduleDate, String scheduleTime);

### url, dbId, dbPassword 수정 ###
	* loginProcess.jsp
	* phoneBook.jsp
	* phoneBook_Add.jsp
	* phoneBook_AddProcess.jsp
	* phoneBook_DeleteProcess.jsp
	* phoneBook_Update.jsp
	* phoneBook_UpdateProcess.jsp
	* scheduler.jsp
	* schedulerView.jsp
	* scheduler_Add.jsp
	* scheduler_AddProcess.jsp
	* scheduler_DeleteProcess.jsp
	* scheduler_Update.jsp
	* scheduler_UpdateProcess.jsp
	* user_Update.jsp
	* user_UpdateProcess.jsp

----------

### JUnit test files ###
	* Management.java
	* ManagementTest.java