
import "dart:io";  //for input output

class Product{
  String? Name;
  String? Discription;
  double? Price;

  Product(String name, String discribe, double price){
    this.Name = name;
    this.Discription = discribe;
    this.Price = price;
  }

  // Should override toString function to print other wise itll print the instance on the ViewAll!!
  @override
  String toString() {
    return 'Product(name: $Name, description: $Discription, price: $Price)';
  }
}


class Manage{
  var array = [];
  
  void Adder(String name, String discribe, double price){
    array.add(Product(name, discribe, price));
  }
  
  void ViewAll(){ 
    for(var arr in array){
      print("Product name = ${arr.Name} , Product Description = ${arr.Discription} , Product Price = ${arr.Price}");
    }
  }

  void ViewSingle(var check){
    for(var arr in array){
      if(arr.Discription == check){
        print("Product name = ${arr.Name} , Product Description = ${arr.Discription} , Product Price = ${arr.Price}");
      }
    }
  }

  void Update(String toChange, String name, String disc, double price){
    for(var arr in array){
      if(arr.Discription == toChange){
        arr.Name = name;
        arr.Discription = disc;
        arr.Price = price;
      }
    }
  }
  void Delete(String check1){
    var index = 0;
    for(var arr in array){
      if(arr.Discription == check1){
        break;
      }else{
        index += 1;
      }
    }
    array.removeAt(index);
  }
}
void main(){
  Manage p1 = new Manage();
  String? userChoice;

  while(true){
      print("---------------------------------------------");
      print("1, Add new Product");
      print("2, View Single Product");
      print("3, View all Product");
      print("4, Edit a Product");
      print("5, Delete a Product");
      print("6, Quit");
      print("--------------------------------------------------");
    userChoice = stdin.readLineSync();
    int choice = int.parse(userChoice!);

    switch(choice){
      case 1:
      print("insert product name:");
      String? name = stdin.readLineSync();
      print("insert product discription:");
      String? disc = stdin.readLineSync();
      print("insert product price:");
      String? price = stdin.readLineSync();
      double pri = double.parse(price!);
      // p1.Adder(name,disc,price);
      if (name != null && disc != null ) {
        p1.Adder(name, disc, pri);
      }
      break;

      case 2:
      print("insert product description");
      String? discc = stdin.readLineSync();
      p1.ViewSingle(discc);
      break;

      case 3:
      p1.ViewAll();
      break;

      case 4:
      print("insert product discription to be updated:");
      String? checkk = stdin.readLineSync();

      print("insert product name:");
      String? name1 = stdin.readLineSync();
      print("insert product discription:");
      String? disc1 = stdin.readLineSync();
      print("insert product price:");
      String? price = stdin.readLineSync();
      double pri1 = double.parse(price!);

      if (checkk != null && name1 != null && disc1 != null ) {
        p1.Update(checkk, name1, disc1, pri1);
      }
      break;

      case 5:
      print("insert product description to be deleted");
      String? discc = stdin.readLineSync();
      if(discc != null){
        p1.Delete(discc);
      }
      break;

      case 6:
      print("exiting...");
      return;

      default:
      print("Invalid choice, please choose again!");  
    }
  }
}