package user;

public class User {

	private String accout;
	private String password;
	private String name;
	private String nickName;
	
	public User() { }
	
	public User(String accout, String password, String name, String nickName) {
		super();
		this.accout = accout;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
	}

	public String getAccout() {
		return accout;
	}
	public void setAccout(String accout) {
		this.accout = accout;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	
}
