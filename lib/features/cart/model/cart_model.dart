
class CartItem {

  String id;
  int price;
  int quantity;
  String name;


  CartItem( this.id, this.price, this.quantity, this.name);

  toJson() {
    return {
      
      'id': id,
      'price': price,
      'quantity': quantity,
      'name': name,
     
    };
  }

  static CartItem fromJson(itemJson) {
    return CartItem(
    
      itemJson['id'],
      itemJson['price'],
      itemJson['quantity'],
      itemJson['name'],
    
    );
  }
}
