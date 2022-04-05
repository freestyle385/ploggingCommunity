package pciyt.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pciyt.service.HistoryService;
import pciyt.vo.History;

@Controller
public class HistoryController {
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping("/history/list")
	@ResponseBody
	public ArrayList<History> showHistoryList(Model md) throws Exception{
		
		ArrayList<History> historyList = historyService.getHistoryList();
		
		md.addAttribute("historyList", historyList);
		
		return historyList;
	}
}
