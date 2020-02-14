package member;

public class MemberService {

	MemberDAO memberDAO;
	
	public MemberService(){
		memberDAO = new MemberDAO();
	}

	public int servinsertMember(MemberBean memberBean) { //회원가입 insert
		return memberDAO.insertMember(memberBean);		
	}

	public int servuserCheck(String customer_id, String customer_pw) { //로그인
		return memberDAO.userCheck(customer_id, customer_pw);
	}

	
	public int servidCheck(String customer_id){ //아이디 중복체크
		return memberDAO.idCheck(customer_id);
	}
	
	public int servtelCheck(String customer_tel){ //연락처 중복체크
		return memberDAO.telCheck(customer_tel);
	}

	public String servfindId(String findName, String findTel, String findEmail) { //아이디 찾기
		return memberDAO.findId(findName, findTel, findEmail);
	}

	public String servfindPw(String findpwName, String findpwId, String findpwEmail) { //비밀번호 찾기		
		return memberDAO.findPw(findpwName, findpwId, findpwEmail);
	}

	public int servsendpwEmail(String to, String pathNum) { //찾으려는 비밀번호를 이메일로 전송
		return memberDAO.sendpwEmail(to, pathNum);
		
	}
	
	public MemberBean getMemberInfo(String id) { //로그인한 회원의 정보를 불러옴	
		return memberDAO.getMemberInfo(id);
	}

	public int servupdateMember(MemberBean memberBean) { //회원정보 수정
		return memberDAO.updateMember(memberBean);
	}
	
	public String servdeleteMember(String customer_ID, String customer_pw){ //회원탈퇴
		return memberDAO.deleteMember(customer_ID, customer_pw);
	}
	
	public int servdelUpdateMember(MemberBean memberBean){ //탈퇴회원 비활성화
		return memberDAO.delUpdateMember(memberBean);
	}
	
}// MemberService end
