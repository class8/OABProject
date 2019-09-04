package com.oab.client.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.oab.client.common.vo.CommonVO;

public class ProductVO extends CommonVO {
	private int pt_number = 0; // 상품 번호
	private String pt_name = ""; // 상품 명
	private String pt_type = ""; // 상품 분류
	private int pt_price = 0; // 상품 가격
	private String pt_explain = ""; // 상품 설명
	private String pt_regdate = ""; // 상품 등록일자
	private String pt_status = ""; // 상품 대여가능 유무
	private String pt_thumb = ""; // 상품 썸네일
	private String pt_image1 = ""; // 상품 이미지 1
	private String pt_image2 = ""; // 상품 이미지 2
	private String pt_image3 = ""; // 상품 이미지 3

	// 파일 업로드 위한 속성
	private MultipartFile file;// 썸네일
	private MultipartFile file1;// 파일1
	private MultipartFile file2;// 파일2
	private MultipartFile file3;// 파일3
	
	public ProductVO() {
		super();
	}
	
	public ProductVO(int pt_number, String pt_name, String pt_type, int pt_price, String pt_explain, String pt_regdate,
			String pt_status, String pt_thumb, String pt_image1, String pt_image2, String pt_image3, MultipartFile file,
			MultipartFile file1, MultipartFile file2, MultipartFile file3) {
		super();
		this.pt_number = pt_number;
		this.pt_name = pt_name;
		this.pt_type = pt_type;
		this.pt_price = pt_price;
		this.pt_explain = pt_explain;
		this.pt_regdate = pt_regdate;
		this.pt_status = pt_status;
		this.pt_thumb = pt_thumb;
		this.pt_image1 = pt_image1;
		this.pt_image2 = pt_image2;
		this.pt_image3 = pt_image3;
		this.file = file;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
	}

	public int getPt_number() {
		return pt_number;
	}

	public void setPt_number(int pt_number) {
		this.pt_number = pt_number;
	}

	public String getPt_name() {
		return pt_name;
	}

	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}

	public String getPt_type() {
		return pt_type;
	}

	public void setPt_type(String pt_type) {
		this.pt_type = pt_type;
	}

	public int getPt_price() {
		return pt_price;
	}

	public void setPt_price(int pt_price) {
		this.pt_price = pt_price;
	}

	public String getPt_explain() {
		return pt_explain;
	}

	public void setPt_explain(String pt_explain) {
		this.pt_explain = pt_explain;
	}

	public String getPt_regdate() {
		return pt_regdate;
	}

	public void setPt_regdate(String pt_regdate) {
		this.pt_regdate = pt_regdate;
	}

	public String getPt_status() {
		return pt_status;
	}

	public void setPt_status(String pt_status) {
		this.pt_status = pt_status;
	}

	public String getPt_thumb() {
		return pt_thumb;
	}

	public void setPt_thumb(String pt_thumb) {
		this.pt_thumb = pt_thumb;
	}

	public String getPt_image1() {
		return pt_image1;
	}

	public void setPt_image1(String pt_image1) {
		this.pt_image1 = pt_image1;
	}

	public String getPt_image2() {
		return pt_image2;
	}

	public void setPt_image2(String pt_image2) {
		this.pt_image2 = pt_image2;
	}

	public String getPt_image3() {
		return pt_image3;
	}

	public void setPt_image3(String pt_image3) {
		this.pt_image3 = pt_image3;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	@Override
	public String toString() {
		return "ProductVO [pt_number=" + pt_number + ", pt_name=" + pt_name + ", pt_type=" + pt_type + ", pt_price="
				+ pt_price + ", pt_explain=" + pt_explain + ", pt_regdate=" + pt_regdate + ", pt_status=" + pt_status
				+ ", pt_thumb=" + pt_thumb + ", pt_image1=" + pt_image1 + ", pt_image2=" + pt_image2 + ", pt_image3="
				+ pt_image3 + ", file=" + file + ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3 + "]";
	}
	
	
}
