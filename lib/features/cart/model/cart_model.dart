
class CartItem {


  String img;
  String id;
  int price;
  int quantity;
  String name;



  CartItem( 
      this.img,
    this.id, this.price, this.quantity, this.name);

  toJson() {
    return {
      'img': img,
      
      'id': id,
      'price': price,
      'quantity': quantity,
      'name': name,
     
    };
  }

  static CartItem fromJson(itemJson) {
    return CartItem(
      itemJson['img'],
    
      itemJson['id'],
      itemJson['price'],
      itemJson['quantity'],
      itemJson['name'],
    
    );
  }
}
