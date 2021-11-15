package market.bean;

public class MarketDTO {
    private int market_id;
    private String id;	// 고객id
    private String name; // 고객id에 해당되는 이름
    private int stock_num;	//
    private String menu_name;	//
    private int price;	//
    private int money;	
    private int amount;	//
    //장수훈 추가 - 장바구니용
    private String image; //이미지 경로
    private String info; //상품 설명용
    
    //market DTO에 image.jpg 경로가 있어야 함. 없어서 화면이 나오지 않을 것임
    //market DTO에 "달콤한 초콜렛..." 같은 상품설명이 없음. 따라서 화면에 나오지 않을 것임
    
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
	public int getMarket_id() {
		return market_id;
	}
	public void setMarket_id(int market_id) {
		this.market_id = market_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "MarketDTO [market_id=" + market_id + ", id=" + id + ", name=" + name + ", stock_num=" + stock_num
				+ ", menu_name=" + menu_name + ", price=" + price + ", money=" + money + ", amount=" + amount
				+ ", image=" + image + ", info=" + info + "]";
	}    
}
