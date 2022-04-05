package pciyt.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import pciyt.vo.History;

@Mapper
public interface HistoryRepository {

	ArrayList<History> getHistoryList() throws Exception;


}
