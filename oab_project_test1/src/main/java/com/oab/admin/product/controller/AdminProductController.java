package com.oab.admin.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.admin.product.service.AdminProductService;
import com.oab.client.common.file.FileUploadUtil;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.product.vo.ProductVO;

@Controller
@RequestMapping(value = "/admin/product")
public class AdminProductController {
	private Logger log = LoggerFactory.getLogger(AdminProductController.class);

	@Autowired
	private AdminProductService adminProductService;

	// 상품 전체 목록 구현
	@RequestMapping(value = "/adminProductList", method = RequestMethod.GET)
	public String adminProductList(@ModelAttribute ProductVO pvo, Model model) {
		System.out.println("productList 호출");

		// 페이지 세팅
		Paging.setPage(pvo);

		// 전체 레코드 수 구현
		int total = adminProductService.adminProductListCnt(pvo);

		// 글번호 재설정
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());

		List<ProductVO> adminProductList = adminProductService.adminProductList(pvo);

		model.addAttribute("adminProductList", adminProductList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", pvo);
		return "admin/product/adminProductList";
	}

	// 상품 등록 폼 출력
	@RequestMapping(value = "/productWriteForm")
	public String adminProductWrite(HttpSession session) {
		System.out.println("productWrite Method 호출 성공");
		return "admin/product/adminProductWrite";
	}

	// 상품 등록 구현하기
	@RequestMapping(value = "/adminProductWrite", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String adminProductInsert(@ModelAttribute ProductVO pvo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException, Exception {
		log.info("상품 등록 메서드 호출 성공");

		// 파일명 제대로 들어오는지 확인
		log.info("썸네일 이미지 : " + pvo.getFile().getOriginalFilename());

		int result = 0;
		String url = "";

		if (pvo.getFile() != null) {
			String pt_thumb = FileUploadUtil.fileUpload(pvo.getFile(), request, "thumb");
			pvo.setPt_thumb(pt_thumb);
		}
		if (pvo.getFile1() != null && !(pvo.getFile1().equals(""))) {
			String pt_image1 = FileUploadUtil.fileUpload(pvo.getFile1(), request, "image1");
			pvo.setPt_image1(pt_image1);

		}
		if (pvo.getFile2() != null && !(pvo.getFile2().equals(""))) {
			String pt_image2 = FileUploadUtil.fileUpload(pvo.getFile2(), request, "image2");
			pvo.setPt_image2(pt_image2);

		}
		if (pvo.getFile3() != null && !(pvo.getFile3().equals(""))) {
			String pt_image3 = FileUploadUtil.fileUpload(pvo.getFile3(), request, "image3");
			pvo.setPt_image3(pt_image3);

		}

		result = adminProductService.adminProductWrite(pvo);
		if (result == 1) {
			url = "/admin/product/adminProductList";
		} else {
			log.info("확인해");
			url = "/admin/product/adminProductWrite";
		}
		return "redirect:" + url;
	}

	// 상품상세보기
	@RequestMapping(value = "/adminProductDetail", method = RequestMethod.GET)
	public String adminProductDetail(@ModelAttribute ProductVO pvo, Model model) {
		log.info("adminProductDetail 호출 성공");
		log.info("pt_number = " + pvo.getPt_number());

		ProductVO detail = new ProductVO();
		detail = adminProductService.adminProductDetail(pvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setPt_explain(detail.getPt_explain().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("detail", detail);

		return "admin/product/adminProductDetail";
	}

	// 상품 수정 폼 출력하기
	@RequestMapping(value = "/productModifyForm")
	public String adminProductUpdateForm(@ModelAttribute ProductVO pvo, Model model) {
		log.info("adminProductUpdateForm 호출 성공");
		log.info("pt_number =" + pvo.getPt_number());

		ProductVO modifyData = new ProductVO();
		modifyData = adminProductService.adminProductDetail(pvo);
		log.info(modifyData.getPt_thumb());
		model.addAttribute("modifyData", modifyData);
		return "admin/product/adminProductModify";
	}

	// 상품 수정하기 구현
	@RequestMapping(value = "/adminProductModify", method = RequestMethod.POST)
	public String adminproductUpdate(@ModelAttribute ProductVO pvo, HttpServletRequest request)
			throws IllegalStateException, IOException {

		int result = 0;
		String url = "";

		if (pvo.getFile() != null) {
			String pt_thumb = FileUploadUtil.fileUpload(pvo.getFile(), request, "thumb");
			pvo.setPt_thumb(pt_thumb);
		}
		if (pvo.getFile1() != null && !(pvo.getFile1().equals(""))) {
			String pt_image1 = FileUploadUtil.fileUpload(pvo.getFile1(), request, "image1");
			pvo.setPt_image1(pt_image1);
		}
		if (pvo.getFile2() != null && !(pvo.getFile2().equals(""))) {
			String pt_image2 = FileUploadUtil.fileUpload(pvo.getFile2(), request, "image2");
			pvo.setPt_image2(pt_image2);
		}
		if (pvo.getFile3() != null && !(pvo.getFile3().equals(""))) {
			String pt_image3 = FileUploadUtil.fileUpload(pvo.getFile3(), request, "image3");
			pvo.setPt_image3(pt_image3);
		}

		result = adminProductService.adminProductModify(pvo);

		if (result == 1) {
			url = "/admin/product/adminProductDetail?pt_number=" + pvo.getPt_number() + "&page=" + pvo.getPage()
					+ "&pageSize=" + pvo.getPageSize();
		}
		return "redirect:" + url;
	}

	// 상품 삭제 구현하기
	@RequestMapping(value = "/adminProductDelete")
	public String adminProductDelete(@ModelAttribute ProductVO pvo, HttpServletRequest request) throws IOException {
		int result = 0;
		String url = "";

		if (pvo.getFile() != null) {
			FileUploadUtil.fileDelete(pvo.getPt_thumb(), request);
		}
		if (pvo.getFile1() != null) {
			FileUploadUtil.fileDelete(pvo.getPt_image1(), request);
		}
		if (pvo.getFile2() != null) {
			FileUploadUtil.fileDelete(pvo.getPt_image2(), request);
		}
		if (pvo.getFile3() != null) {
			FileUploadUtil.fileDelete(pvo.getPt_image3(), request);
		}

		result = adminProductService.adminProductDelete(pvo.getPt_number());

		if (result == 1) {
			url = "/admin/product/adminProductList?page=" + pvo.getPage() + "&pageSize=" + pvo.getPageSize();
		} else {
			url = "/admin/product/adminProductDetail?pt_number=" + pvo.getPt_number() + "&page=" + pvo.getPage()
					+ "&pageSize=" + pvo.getPageSize();
		}
		return "redirect:" + url;
	}
}
