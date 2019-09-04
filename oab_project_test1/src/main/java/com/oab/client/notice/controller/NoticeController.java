package com.oab.client.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.notice.service.NoticeService;
import com.oab.client.notice.vo.NoticeVO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {

	private Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService; //자동으로 무명의 빈 객체를 생성한다
	
	//글 목록을 구현
	@RequestMapping(value ="/noticeList", method =RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		
		log.info("noticeList 호출 성공");
		
		//페이지 세팅
		Paging.setPage(nvo);
		
		//전체 레코드 수를 구현
		int total = noticeService.noticeListCnt(nvo);
		log.info("total = " + total);
		
		//글 번호 재설정
		int count = total - (Util.nvl(nvo.getPage())-1) * Util.nvl(nvo.getPageSize());
		log.info("count = " + count);
		
		
		List<NoticeVO> noticeList = noticeService.noticeList();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);
		
		System.out.println(noticeList);
		
		return "notice/noticeList";
	}

	//글 상세보기 구현하기
	@RequestMapping(value ="/noticeDetail", method =RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {
	
		log.info("noticeDetail 호출 성공");
		log.info("nt_number = " + nvo.getNt_number());
		
		NoticeVO detail = new NoticeVO();
		detail = noticeService.noticeDetail(nvo);
		
		if(detail!=null && (!detail.equals(""))) {
			
			detail.setNt_content(detail.getNt_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "notice/noticeDetail";
		
	}
	
}
