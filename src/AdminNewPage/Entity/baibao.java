package AdminNewPage.Entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "baibao")
public class baibao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idbb;
	
	private String tieude;
	private String tomtat;
	private String noidung1;
	private String noidung2;
	private String hinhanh1;
	private String hinhanh2;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date ngaydang;
	
	@ManyToOne
	@JoinColumn(name = "username")
	private taikhoan taikhoan;
	
	@ManyToOne
	@JoinColumn(name = "madanhmuc")
	private danhmuc danhmuc;
	
	@OneToMany(mappedBy = "baibao", fetch = FetchType.EAGER)
	private Collection<binhluan> binhluan;

	public int getIdbb() {
		return idbb;
	}

	public void setIdbb(int idbb) {
		this.idbb = idbb;
	}

	public String getTieude() {
		return tieude;
	}

	public void setTieude(String tieude) {
		this.tieude = tieude;
	}

	public String getTomtat() {
		return tomtat;
	}

	public void setTomtat(String tomtat) {
		this.tomtat = tomtat;
	}

	public String getNoidung1() {
		return noidung1;
	}

	public void setNoidung1(String noidung1) {
		this.noidung1 = noidung1;
	}

	public String getNoidung2() {
		return noidung2;
	}

	public void setNoidung2(String noidung2) {
		this.noidung2 = noidung2;
	}

	public String getHinhanh1() {
		return hinhanh1;
	}

	public void setHinhanh1(String hinhanh1) {
		this.hinhanh1 = hinhanh1;
	}

	public String getHinhanh2() {
		return hinhanh2;
	}

	public void setHinhanh2(String hinhanh2) {
		this.hinhanh2 = hinhanh2;
	}

	public Date getNgaydang() {
		return ngaydang;
	}

	public void setNgaydang(Date ngaydang) {
		this.ngaydang = ngaydang;
	}

	public taikhoan getTaikhoan() {
		return taikhoan;
	}

	public void setTaikhoan(taikhoan taikhoan) {
		this.taikhoan = taikhoan;
	}

	public danhmuc getDanhmuc() {
		return danhmuc;
	}

	public void setDanhmuc(danhmuc danhmuc) {
		this.danhmuc = danhmuc;
	}

	public Collection<binhluan> getBinhluan() {
		return binhluan;
	}

	public void setBinhluan(Collection<binhluan> binhluan) {
		this.binhluan = binhluan;
	}

	@Override
	public String toString() {
		return "baibao [idbb=" + idbb + ", tieude=" + tieude + ", tomtat=" + tomtat + ", noidung1=" + noidung1
				+ ", noidung2=" + noidung2 + ", hinhanh1=" + hinhanh1 + ", hinhanh2=" + hinhanh2 + ", ngaydang="
				+ ngaydang + ", taikhoan=" + taikhoan + ", danhmuc=" + danhmuc + "]";
	}
	
	
}
