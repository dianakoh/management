
public class Management {
	boolean login;
	String userId = "jiwan";
	String userPassword = "1410436";
	
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
}
