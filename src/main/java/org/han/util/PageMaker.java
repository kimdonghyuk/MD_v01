package org.han.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class PageMaker {

	private int page; // �����ַ��� �ϴ� page�� ����
	private int cnt; // ���� ������ �����ϴµ� �ʿ��� ������ ��
	private int lineCount; // ȭ�� �� ������ ����?
	private int perPage; // �������� �� ����
	private int first; // ȭ�� ������ ù��°
	private int last; // ȭ�� ������ ������
	
	private String keyword; // �˻� keyword�� ��� �׸� �з��� �ϱ� ���� ����
	private String[] typeArr; // jsp�� hidden���κ��� �˻����� ������ Ȯ���ϱ� ���� ����
	private Map<String, String> criMap;
	private Map<String, String> colMap;
	private List<String> values;
	
	// String���� Integer�� �ٲ���
	public static int getNumber(String str) {
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return 1;
		}
	}
	
	public PageMaker() {
		this(1);
	}

	public PageMaker(int page) {
		this(page, 0);
	}

	public PageMaker(String pageStr) {
		this(getNumber(pageStr), 0);
	}

	public PageMaker(int page, int cnt) {
		this(page, cnt, 10, 10);
	}

	public PageMaker(int page, int cnt, int lineCount, int perPage) {
		super();
		this.page = page;
		this.cnt = cnt;
		this.lineCount = lineCount;
		this.perPage = perPage;
		this.first = 1;
		this.last = 10;		
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLineCount() {
		return lineCount;
	}
	public void setLineCount(int lineCount) {
		this.lineCount = lineCount;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getFirst() {
		return ((int)((Math.floor((page - 1) / (double) lineCount)) * lineCount) + 1);
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return (int)((Math.floor((page - 1) / (double) lineCount) * lineCount) + 10);
	}
	public void setLast(int last) {
		this.last = last;
	}
	
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	public Map<String, String> getCriMap() {
		return criMap;
	}

	public void setCriMap(Map<String, String> criMap) {
		this.criMap = criMap;
	}

	public Map<String, String> getColMap() {
		return colMap;
	}

	public void setColMap(Map<String, String> colMap) {
		this.colMap = colMap;
	}

	public List<String> getValues() {
		return values;
	}

	public void setValues(List<String> values) {
		this.values = values;
	}

	public String checked(String type) {
		if (typeArr == null || typeArr.length == 0) {
			return "";
		}
		for (int i = 0; i < typeArr.length; i++) {

			if (typeArr[i].equals(type)) {
				return "checked";
			}
		}
		return "";
	}

	// xml������ Sql EL���� ȣ���ϴ� �޼ҵ�
	// where title like '%��%' or userid like '%han%' or cont like '%hi%'
	public String getSql() {
		if(keyword == null || keyword.length() == 0 || typeArr == null){
			return "";}
		// keyword ���� ���ų� keyword�� �����̰ų� type�� ���õ� ���� ������ ������ ��ȯ (�������� ����x)
		
		criMap = new HashMap<String,String>();
		colMap = new HashMap<String,String>();
		
		colMap.put("t","title");
		colMap.put("w","userid");
		colMap.put("c","cont");
		
		for(String type : typeArr){
			criMap.put(type, keyword);
		}
		
		StringBuilder builder = new StringBuilder(" where ");
		// �˻��� query�� ������ ���� where�� �޾Ƶ�.
		
		Iterator<String> iter = criMap.keySet().iterator();
		// Iterator�� ���ؼ� cripMap�� key������ setting��.
		values = new ArrayList<String>();
	
		
		for (int i = 0; i < criMap.size(); i++) {
			this.values.add("dummy");
			// �� type�� key������ŭ dummy date�� add����.
		}

		while(iter.hasNext()){

			String key = iter.next();
			values.add(criMap.get(key));

			builder.append(colMap.get(key) + " like '%'||#{key}||'%' or ");
			}
		return builder.substring(0, builder.length()-4);
	}
	
	public String getKey() {
		return values.remove(0);
	}

	@Override
	public String toString() {
		return "PageMaker [page=" + page + ", cnt=" + cnt + ", lineCount="
				+ lineCount + ", perPage=" + perPage + ", first=" + first
				+ ", last=" + last + ", keyword=" + keyword + ", typeArr="
				+ Arrays.toString(typeArr) + ", criMap=" + criMap + ", colMap="
				+ colMap + ", values=" + values + "]";
	}
	
	

	
//	public static void main(String[] args) {
//		PageMaker pm = new PageMaker(41);
//		int first = pm.getFirst();
//		int last = pm.getLast();
//		System.out.println("first �� : " + first + "||||" + "last �� : " + last );
//	}
//	
	

}
