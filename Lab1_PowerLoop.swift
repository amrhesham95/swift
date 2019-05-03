import Foundation
var result=1;
func calcPower(base:Int,power:Int)->Int{
    for i in 1...power{
        result*=base;
    }
    return result;
}
print(calcPower(base:5,power:3));