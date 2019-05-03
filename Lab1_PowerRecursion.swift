import Foundation
var result=1;
func calcPower(base:Int,power:Int)->Int{
   if(power>0){
      return base * calcPower(base:base,power:power-1)
   }else{
       return 1;
   }
   return result
}
print(calcPower(base:2,power:8));