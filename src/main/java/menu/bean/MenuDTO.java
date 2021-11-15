package menu.bean;

public class MenuDTO {
	private String sep; // 메뉴 구분자(?-1)
	private int stock_num; // 기본 시퀀스 (a-?) =>>>> 'a-1'완성!!!!
	private String menu_name;
	private String image; // 파일이름
	private String info;
	private String nutrition_info; /* 제품 영양 정보 -> ex> 90(g) */
	private String info1; /* 1회 제공량 (kcal) */
	private String info2; /* 나트륨 (g) */
	private String info3; /* 포화지방 (g) */
	private String info4; /* 당류 (g) */
	private String info5; /* 단백질 (g) */
	// info6 varchar2(10) /* 카페인 (g)*/
	private int price;
	private int stock_count; /* 보유수량 */
	
	public String getSep() {
		return sep;
	}
	public void setSep(String sep) {
		this.sep = sep;
	}
	public int getStock_num() {
		return stock_num;
	}
	public void setStock_num(int stock_num) {
		this.stock_num = stock_num;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getNutrition_info() {
		return nutrition_info;
	}
	public void setNutrition_info(String nutrition_info) {
		this.nutrition_info = nutrition_info;
	}
	public String getInfo1() {
		return info1;
	}
	public void setInfo1(String info1) {
		this.info1 = info1;
	}
	public String getInfo2() {
		return info2;
	}
	public void setInfo2(String info2) {
		this.info2 = info2;
	}
	public String getInfo3() {
		return info3;
	}
	public void setInfo3(String info3) {
		this.info3 = info3;
	}
	public String getInfo4() {
		return info4;
	}
	public void setInfo4(String info4) {
		this.info4 = info4;
	}
	public String getInfo5() {
		return info5;
	}
	public void setInfo5(String info5) {
		this.info5 = info5;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock_count() {
		return stock_count;
	}
	public void setStock_count(int stock_count) {
		this.stock_count = stock_count;
	}

	

}
