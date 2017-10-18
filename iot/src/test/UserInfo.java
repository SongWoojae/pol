package test;

public class UserInfo {
	private int userNum;
	private String userId;
	private String userName;
	private String userPwd;
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	@Override
	public String toString() {
		return "dto [userNum=" + userNum + ", userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd
				+ "]";
	}
	
	
	
	
}
