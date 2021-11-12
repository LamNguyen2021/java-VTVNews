package AdminNewPage.Entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "taikhoan")
public class taikhoan {
	@Id
	private String username;
	private String password;
	private String hoten;
	private String sdt;
	private int vaitro;
	private String anh;
	private String gioitinh;
	
	@OneToMany(mappedBy = "taikhoan", fetch = FetchType.EAGER)
	private Collection<binhluan> binhluan;
	
	@OneToMany(mappedBy = "taikhoan", fetch = FetchType.EAGER)
	private Collection<baibao> baibao;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public int getVaitro() {
		return vaitro;
	}

	public void setVaitro(int vaitro) {
		this.vaitro = vaitro;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public String getGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
	}

	public Collection<binhluan> getBinhluan() {
		return binhluan;
	}

	public void setBinhluan(Collection<binhluan> binhluan) {
		this.binhluan = binhluan;
	}

	public Collection<baibao> getBaibao() {
		return baibao;
	}

	public void setBaibao(Collection<baibao> baibao) {
		this.baibao = baibao;
	}

	@Override
	public String toString() {
		return "taikhoan [username=" + username + ", password=" + password + ", hoten=" + hoten + ", sdt=" + sdt
				+ ", vaitro=" + vaitro + ", gioitinh=" + gioitinh + "]";
	}
	
	
	
}
