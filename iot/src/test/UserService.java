package test;

import java.util.List;

public interface UserService {
	public UserInfo login(UserInfo user);
	public UserInfo selectUser(UserInfo user);
	public List<UserInfo> selectUserList(UserInfo user);
	public int insertUser(UserInfo user);
	public int insertUserList(UserInfo[] userList);
	public int deleteUser(UserInfo user);
	public int updateUser(UserInfo user);
	
}
