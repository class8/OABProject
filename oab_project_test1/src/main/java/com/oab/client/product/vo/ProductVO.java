package com.oab.client.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.oab.client.common.vo.CommonVO;

public class ProductVO extends CommonVO {
	private int pt_number;
	private String pt_name;
	private int pt_price;
	private String pt_explain;
	private String pt_regdate;
	private String pt_status;
	private String pt_thumb;
	private String pt_image1;
	private String pt_image2;
	private String pt_image3;
	private MultipartFile file;

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

}
