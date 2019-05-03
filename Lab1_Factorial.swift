import Foundation
var fact=1;
func getFactorial(num:Int)->Int{
    for i in 2...num{
        fact=fact*i;
    }
    return fact;
}
print(getFactorial(num:5));