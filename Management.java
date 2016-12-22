
public class Management {
	boolean login;
	String userId = "jiwan";
	String userPassword = "1410436";
	String name = "hyein";
	String phone = "01043689422";
	String birth = "19950421";
    String email = "yui08@naver.com";
	
	boolean processLogin(String formId, String formPassword) {
		login = false;
		if (formId.equals(userId) && formPassword.equals(userPassword)) {
			login = true;
		}
		return login;
	}
	
	String updateUserPassword(String formId, String changedPassword) {
		if (formId.equals(userId)) {
			userPassword = changedPassword;
		}
		return userPassword;
	}
	
	public String setPhonebookAddProcessSql(String name, String phone, String birth, String email) {
		String sql = "";
		sql = "INSERT INTO phoneBook(name, phone, birth, email) values(?, ?, ?, ?, ?)";
	      
	    return sql; 
	}
	
	public String phonebookUpdatePhone(String phone, String updatePhone) {
		if(phone != null) {
			phone = updatePhone;
		}
		return phone;
	}
}
