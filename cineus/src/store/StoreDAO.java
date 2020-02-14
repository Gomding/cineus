package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	//커넥션풀로부터 커넥션을 얻기 위한 메서드
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		
		//커넥션풀 얻기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
		
		//커넥션풀로부터 커넥션 객체 얻기
		con = ds.getConnection();
		
		return con;
		
	}//getConnection()
	
	//자원 해제 하기 위한 메서드
	private void freeResource() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			System.out.println("freeResource()메서드에서 오류" + e);
		}
	}//freeResource()
	
//-----------------------------------------------------------------------------------------
	
	//스토어 씨네티켓 목록 조회
	public List<StoreBean> listStore1() {
		List<StoreBean> storeList = new ArrayList<StoreBean>();
		
		try {
			con = getConnection();
			String sql = "SELECT * FROM item WHERE item_type = 'ticket'";//씨네티켓 목록
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int item_code = rs.getInt("item_code");
				String item_type = rs.getString("item_type");
				String item_name = rs.getString("item_name");
				String item_detail = rs.getString("item_detail");
				String place = rs.getString("place");
				String exp = rs.getString("exp");
				int price = rs.getInt("price");
				int sale_price = rs.getInt("sale_price");
				String item_image = rs.getString("item_image");
				int item_status = rs.getInt("item_status");
				
				StoreBean storeTicket = new StoreBean();
				
				storeTicket.setItem_code(item_code);
				storeTicket.setItem_name(item_name);
				storeTicket.setItem_detail(item_detail);
				storeTicket.setPlace(place);
				storeTicket.setExp(exp);
				storeTicket.setPrice(price);
				storeTicket.setSale_price(sale_price);
				storeTicket.setItem_image(item_image);
				storeTicket.setItem_status(item_status);
				
				storeList.add(storeTicket);//씨네티켓

			}
				
		} catch (Exception e) {
			System.out.println("listStore1()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return storeList;
	}//listStore1()
	
	//스토어 씨네친스 목록 조회
	public List<StoreBean> listStore2() {
		List<StoreBean> storeList = new ArrayList<StoreBean>();
		
		try {
			con = getConnection();
			String sql = "SELECT * FROM item WHERE item_type = 'event'";//씨네찬스 목록
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int item_code = rs.getInt("item_code");
				String item_type = rs.getString("item_type");
				String item_name = rs.getString("item_name");
				String item_detail = rs.getString("item_detail");
				String place = rs.getString("place");
				String exp = rs.getString("exp");
				int price = rs.getInt("price");
				int sale_price = rs.getInt("sale_price");
				String item_image = rs.getString("item_image");
				int item_status = rs.getInt("item_status");
				
				StoreBean storeEvent = new StoreBean();
				
				storeEvent.setItem_code(item_code);
				storeEvent.setItem_name(item_name);
				storeEvent.setItem_detail(item_detail);
				storeEvent.setPlace(place);
				storeEvent.setExp(exp);
				storeEvent.setPrice(price);
				storeEvent.setSale_price(sale_price);
				storeEvent.setItem_image(item_image);
				storeEvent.setItem_status(item_status);
				
				storeList.add(storeEvent);//씨네찬스

			}
				
		} catch (Exception e) {
			System.out.println("listStore2()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return storeList;
	}//listStore2()
	
	//스토어 씨네푸드 목록 조회
	public List<StoreBean> listStore3() {
		List<StoreBean> storeList = new ArrayList<StoreBean>();
		
		try {
			con = getConnection();
			String sql = "SELECT * FROM item WHERE item_type = 'food'";//씨네푸드 목록
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int item_code = rs.getInt("item_code");
				String item_type = rs.getString("item_type");
				String item_name = rs.getString("item_name");
				String item_detail = rs.getString("item_detail");
				String place = rs.getString("place");
				String exp = rs.getString("exp");
				int price = rs.getInt("price");
				int sale_price = rs.getInt("sale_price");
				String item_image = rs.getString("item_image");
				int item_status = rs.getInt("item_status");
				
				StoreBean storeFood = new StoreBean();
				
				storeFood.setItem_code(item_code);
				storeFood.setItem_name(item_name);
				storeFood.setItem_detail(item_detail);
				storeFood.setPlace(place);
				storeFood.setExp(exp);
				storeFood.setPrice(price);
				storeFood.setSale_price(sale_price);
				storeFood.setItem_image(item_image);
				storeFood.setItem_status(item_status);
				
				storeList.add(storeFood);//씨네푸드

			}
				
		} catch (Exception e) {
			System.out.println("listStore3()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return storeList;
	}//listStore3()

	//스토어 상품상세보기
	public StoreBean viewStore(int itemCode) {
		StoreBean storeBean = new StoreBean();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM item WHERE item_code = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemCode);
			rs = pstmt.executeQuery();
			rs.next();
			
			int item_code = rs.getInt("item_code");
			String item_type = rs.getString("item_type");
			String item_name = rs.getString("item_name");
			String item_detail = rs.getString("item_detail");
			String place = rs.getString("place");
			String exp = rs.getString("exp");
			int price = rs.getInt("price");
			int sale_price = rs.getInt("sale_price");
			String item_image = rs.getString("item_image");
			int item_status = rs.getInt("item_status");
			
			storeBean.setItem_code(item_code);
			storeBean.setItem_type(item_type);
			storeBean.setItem_name(item_name);
			storeBean.setItem_detail(item_detail);
			storeBean.setPlace(place);
			storeBean.setExp(exp);
			storeBean.setPrice(price);
			storeBean.setSale_price(sale_price);
			storeBean.setItem_image(item_image);
			storeBean.setItem_status(item_status);			
			
		} catch (Exception e) {
			System.out.println("viewStore()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return storeBean;
	}//viewStore()

	//스토어 상품 추가
	public static int insertNewStore(StoreBean store) {
		
		return 0;
	}

	//스토어 상품 삭제1
	public List<Integer> selectRemovedItems(int item_code) {
		
		return null;
	}

	//스토어 상품 삭제2
	public void deleteStore(int item_code) {
		
		
	}
	
	//스토어 상품 수정
	public void updateStore(StoreBean store) {
		
	}

	//장바구니 상품 삭제
	public int deleteCart(String customer_id, int item_code) {
		int check = 0;
		try {
			con = getConnection();
			sql = "DELETE FROM cart WHERE customer_id = ? AND item_code = ? AND cart_status = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			pstmt.setInt(2, item_code);
			check = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("deleteCart()메서드에서 오류" + e);
		} finally {
			freeResource();
		}

		return check;
	}//deleteCart()

	//장바구니 수량 변경
	public int modifyCart(String customer_id, int item_code, int cart_qty) {
		int check = 0;
		try {
			con = getConnection();
			sql = "UPDATE cart SET cart_qty = ?  WHERE customer_ID = ? AND item_code = ? AND cart_status = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart_qty);
			pstmt.setString(2, customer_id);
			pstmt.setInt(3, item_code);
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("modifyCart()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return check;
	}//modifyCart()

	

}//StoreDAO클래스
