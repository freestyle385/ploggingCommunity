package pciyt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberId;
	private String infoOrigin; // ex) Kakao
	private String email;
	private String nickname;
	private String gender;
	private String ageRange; // ex) "10~19", "20~29"
	private String regDate;
	private String delDate;
	private int delStatus; // 미탈퇴=0, 탈퇴=1
}
