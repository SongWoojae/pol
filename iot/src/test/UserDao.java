package test;

import java.util.List;

public interface UserDao {
	public UserInfo selectUser(UserInfo user);
	public List<UserInfo> selectUserList(UserInfo user);
	public int  deleteUser(UserInfo user);
	public int insertUser(UserInfo user);
	public int updateUser(UserInfo user);
	
}
