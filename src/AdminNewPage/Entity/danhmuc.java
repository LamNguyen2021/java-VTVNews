package AdminNewPage.Entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "danhmuc")
public class danhmuc {
	
	@Id
	private String madanhmuc;
	private String tendanhmuc;
	
	@OneToMany(mappedBy = "danhmuc", fetch = FetchType.EAGER)
	private Collection<baibao> baibao;

	public String getMadanhmuc() {
		return madanhmuc;
	}

	public void setMadanhmuc(String madanhmuc) {
		this.madanhmuc = madanhmuc;
	}

	public String getTendanhmuc() {
		return tendanhmuc;
	}

	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}

	public Collection<baibao> getBaibao() {
		return baibao;
	}

	public void setBaibao(Collection<baibao> baibao) {
		this.baibao = baibao;
	}
	
	
}
