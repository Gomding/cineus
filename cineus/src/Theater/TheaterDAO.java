package Theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TheaterDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	List<TheaterDTO> theaters_list;
	List<Integer> theaters_num_list_by_group;
	int group_size;
	
	public TheaterDAO() {
		theaters_list=new ArrayList<>();
		//sql="select * from theaters";
		sql="select l.group_num, t.code, t.img, t.name, t.address, t.theater_ID, t.x, t.y " 
			+"from theater "
			+"t left join locations l using(code) "
			+"order by l.group_num, "
			+"if(ascii(substring(t.name,1))<128,9,1) asc, "
			+"t.name asc";
		List<Integer> temp=new ArrayList<>();
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				temp.add(rs.getInt("group_num"));
				TheaterDTO dto=new TheaterDTO(
						rs.getInt("theater_ID"),
						rs.getString("code"),
						rs.getString("img"),
						rs.getString("name"),
						rs.getString("address"),
						rs.getDouble("x"),
						rs.getDouble("y")
				);
				theaters_list.add(dto);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		
		group_size=this.getGroupSize();
		
		theaters_num_list_by_group=new ArrayList<>(Collections.nCopies(group_size, 0));
		
		for(int i=0; i<temp.size();i++){ //theater 개수만큼 돈다
			int curr_index=temp.get(i)-1; //
			int val=theaters_num_list_by_group.get(curr_index);
			theaters_num_list_by_group.set(curr_index, val+1);
		}
	}
	
	private void getConnection(){
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void close(){
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<TheaterDTO> getTheatersList(){
		//리턴하는 theater_list 값 출력
		return theaters_list;
	}
	
	public List<TheaterDTO> getTheatersListByCode(String code){
		//code는 bs, cc, su... 등 스트링 값이다.
		//필요하면 구현하기
		return null;
	}
	
	public List<Integer> getTheatersNumListByGroup(){
		return theaters_num_list_by_group;
	}
	
	public List<TheaterDTO> getTheatersListByGroup(int groupNum){ 
		/*파라미터는 정수 1~8*/
		List<TheaterDTO> theaters_list_by_group=new ArrayList<>();
		int curr_group_index=groupNum-1; /*0~7*/
		int start=0; //시작 인덱스
		int end=0;	 //마지막 인덱스
		
		//해당 theaters의 시작인덱스,  끝 인덱스를 구한다. 
		for(int i=0; i<curr_group_index;i++){
			start+=theaters_num_list_by_group.get(i);
		}
		end=start+theaters_num_list_by_group.get(curr_group_index)-1;
		
		//theaters갯수만큼
		for(int i=start; i<=end;i++){
			theaters_list_by_group.add(theaters_list.get(i));
		}
		return theaters_list_by_group;
	}
	
	public int getGroupSize(){ //그룹의 개수를 구한다.
		sql="select max(group_num) from locations";
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return 0;
	}/*getGroupSize 끝*/
	
	public TheaterDTO getTheaterByIndex(int t_idx, int l_idx){
		//sql문 고쳐야함. -- 
		/*sql="select * from theater where theater_ID=?";*/
		sql="select * from theater where code=("
			+"select code from locations where group_num=?) "
			+"order by if(ascii(substring(name,1))<128,9,1) asc, "
			+"name asc "
			+"limit ?,1;";
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, l_idx);
			pstmt.setInt(2, t_idx-1);
			rs=pstmt.executeQuery();
			if(rs.next()){
				TheaterDTO dto=new TheaterDTO(
						rs.getInt("theater_ID"),
						rs.getString("code"),
						rs.getString("img"),
						rs.getString("name"),
						rs.getString("address"),
						rs.getDouble("x"),
						rs.getDouble("y")
				);
				return dto;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return null;
	}
}
