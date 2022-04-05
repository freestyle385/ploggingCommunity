package pciyt.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pciyt.repository.HistoryRepository;
import pciyt.vo.History;

@Service
public class HistoryService {
	@Autowired
	private HistoryRepository historyRepository;

	public ArrayList<History> getHistoryList() throws Exception{
		
		ArrayList<History> historyList = historyRepository.getHistoryList();
		
		return historyList;
	}

}
