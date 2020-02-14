package store;

import java.sql.Timestamp;
import java.util.List;

import member.MemberBean;

public class StoreService {
	StoreDAO storeDAO;
	CartDAO cartDAO;
	PayDAO payDAO;
	
	public StoreService() {
		storeDAO = new StoreDAO();
		cartDAO = new CartDAO();
		payDAO = new PayDAO();
	}
	
	//티켓 목록 조회
	public List<StoreBean> listStore1(){
		List<StoreBean> storeList = storeDAO.listStore1();
		return storeList;
	}
	
	//찬스 목록 조회
	public List<StoreBean> listStore2(){
		List<StoreBean> storeList = storeDAO.listStore2();
		return storeList;
	}
	
	//푸드 목록 조회
	public List<StoreBean> listStore3(){
		List<StoreBean> storeList = storeDAO.listStore3();
		return storeList;
	}	
	
	
	//상품 상세 보기
	public StoreBean viewStore(int item_code){
		StoreBean store = null;
		store = storeDAO.viewStore(item_code);
		return store;
	}
	
	//상품 추가하기(미구현)
	public int addStore(StoreBean store){
		return storeDAO.insertNewStore(store);
	}
	
	//상품 삭제하기(미구현)
	public List<Integer> removeStore(int item_code){
		List<Integer> itemCodeList = storeDAO.selectRemovedItems(item_code);
		storeDAO.deleteStore(item_code);
		return itemCodeList;
	}
	
	//상품 수정하기(미구현)
	public void modStore(StoreBean store){
		storeDAO.updateStore(store);
	}

	//장바구니 담기
	public void insertCart(CartBean cartBean) {
		cartDAO.insertCart(cartBean);
	}

	//장바구니 중복 확인
	public int listCart(String customer_id, int item_code) {
		return cartDAO.listCart(customer_id, item_code);
	}

	//장바구니 목록 보기
	public List<CartBean> viewCart(String customer_id) {
		List<CartBean> cartList = cartDAO.viewCart(customer_id);
		return cartList;
	}
	
	//구매자 정보 확인
	public MemberBean viewMemberInfo(String customer_id) {
		MemberBean memberBean = null;
		memberBean = cartDAO.viewMemberInfo(customer_id);
		return memberBean;
	}

	//장바구니 담긴 개수 확인
	public int countCart(String customer_id) {
		return cartDAO.countCart(customer_id);
	}

	//장바구니 상품 삭제
	public int deleteCart(String customer_id, int item_code) {
		int check = storeDAO.deleteCart(customer_id, item_code);
		return check;
	}

	//장바구니 수량 변경
	public int modifyCart(String customer_id, int item_code, int cart_qty) {
		int check = storeDAO.modifyCart(customer_id, item_code, cart_qty);
		return check;
	}

	//결제코드 생성
	public String createPayCode() {
		String code = payDAO.createPayCode();
		return code;
	}

	//쿠폰코드 생성
	public String createCoupon() {
		String coupon = payDAO.createCoupon();
		return coupon;
	}

	//결제 정보 저장
	public void insertPayCode(PayBean payBean, PayDetailBean payDetailBean) {
		payDAO.insertPayCode(payBean, payDetailBean);
	}
	
	//장바구니 정보 결제 상세에 저장
	public void cartToPaydetail(PayBean payBean) {
		payDAO.cartToPaydetail(payBean);
	}

	//쿠폰 생성 및 저장
	public void insertCoupon(String cp_code, int item_code, String customer_id) {
		payDAO.insertCoupon(cp_code, item_code, customer_id);
	}

	//장바구니에서 삭제된 상품에 대한 쿠폰 삭제
	public void deleteCoupon(int item_code, String customer_id) {
		payDAO.deleteCoupon(item_code, customer_id);
	}

	//마이페이지 결제목록 불러오기
	public List<PayBean> listPay(String customer_id) {
		List<PayBean> payList = payDAO.listPay(customer_id);
		return payList;
	}

	//마이페이지 쿠폰목록 불러오기(ajax용인데 현재 사용 불가)
	public List<CouponBean> listCoupon(String pay_code, String customer_id) {
		List<CouponBean> couponList = payDAO.listCoupon(pay_code, customer_id);
		return couponList;
	}

	//마이페이지 쿠폰목록 불러오기
	public List<CouponBean> listCoupon(String customer_id) {
		List<CouponBean> couponList = payDAO.listCoupon(customer_id);
		return couponList;
	}

	//결제 상태 변경(삭제)
	public int deletePayStore(String payCode) {
		int delChk = payDAO.deletePayStore(payCode);
		return delChk;
	}
	
	//장바구니 1분 삭제 이벤트
	public void cartEvent() {
		cartDAO.cartEvent();
	}

	//쿠폰번호 1분 삭제 이벤트
	public void couponEvent() {
		cartDAO.couponEvent();
	}

	




	
	
	
	
	
	
	
}//StoreService
