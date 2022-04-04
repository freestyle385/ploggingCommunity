package pciyt.vo;

import java.awt.Point;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class History {
	private int historyId;
	private int memberId;
	private String date;
	private ArrayList<Point> polygon; // 지도에 생성된 폴리곤 좌표
	private String content;
	private int difficulty; // 1~5점
	private String regDate;
	private String delDate;
	private int delStatus; // 미삭제=0, 삭제=1
}
