import Foundation

func swap(num1: inout Int,num2:inout Int){
    var temp=num1;
    num1=num2;
    num2=temp;
}


var first=120
var second=5
print("before swapping first=\(first) and second = \(second)")
swap(num1:&first,num2:&second)
print("after swapping first=\(first) and second = \(second)")
print()
