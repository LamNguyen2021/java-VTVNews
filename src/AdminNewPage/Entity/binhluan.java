package AdminNewPage.Entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "binhluan")
public class binhluan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idbl;

	private String noidung;
	
	@Temporal(TemporalType.DATE)
	private Date ngaybl;
	
	@ManyToOne
	@JoinColumn(name = "idbb")
	private baibao baibao;
	
	@ManyToOne
	@JoinColumn(name = "iduser")
	private taikhoan taikhoan;

	public int getIdbl() {
		return idbl;
	}

	public void setIdbl(int idbl) {
		this.idbl = idbl;
	}

	public String getNoidung() {
		return noidung;
	}

	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}

	public Date getNgaybl() {
		return ngaybl;
	}

	public void setNgaybl(Date ngaybl) {
		this.ngaybl = ngaybl;
	}

	public baibao getBaibao() {
		return baibao;
	}

	public void setBaibao(baibao baibao) {
		this.baibao = baibao;
	}

	public taikhoan getTaikhoan() {
		return taikhoan;
	}

	public void setTaikhoan(taikhoan taikhoan) {
		this.taikhoan = taikhoan;
	}
	
	
}
