package AdminNewPage.Entity;

public class timeBL {
	private String time;
	private binhluan bl;
	
	public timeBL() {
		super();
	}

	public timeBL(String time, binhluan bl) {
		super();
		this.time = time;
		this.bl = bl;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public binhluan getBl() {
		return bl;
	}

	public void setBl(binhluan bl) {
		this.bl = bl;
	}
	
	
}
