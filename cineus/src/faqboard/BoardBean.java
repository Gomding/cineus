package faqboard;

public class BoardBean {
	
	private int num; // 글 번호
	private String faq_group; // FQA 글 종류 (영화관, 영화예매, 멤버십, 할인/신용카드, 홈페이지, 기타)
	private String question; // 질문
	private String answer; // 답변
	private int hit; //조회수
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getFaq_group() {
		return faq_group;
	}
	public void setFaq_group(String faq_group) {
		this.faq_group = faq_group;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
