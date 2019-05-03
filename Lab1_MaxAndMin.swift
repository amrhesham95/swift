import Foundation

func calcMinMax(arr:[Int])->(min:Int,max:Int){
    var min=Int.max;
    var max=Int.min;
    var temp=0;
    for item in arr {
        if(item<min){
            min=item
        }else if(item>max){
            max=item;
        }
        
    }
    return(min,max)
    
}

var myArray=[5,6,1,3,2,4]

let returnedTuple=calcMinMax(arr:myArray)
print("min number is \(returnedTuple.0) and max number is \(returnedTuple.1)")
