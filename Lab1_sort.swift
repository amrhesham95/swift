import Foundation

func sortArray(arr:[Int])->[Int]{
    var willbeReturned:[Int]
    willbeReturned=arr
    var min=willbeReturned[0];
    var minIndex=0;
    var temp=0;
    for outer in 0..<willbeReturned.count{
        min=willbeReturned[outer]
        for inner in outer ..< willbeReturned.count{
            if willbeReturned[inner]<min{
                min=willbeReturned[inner]
                minIndex=inner
            }
           
        }
         temp=willbeReturned[outer]
        willbeReturned[outer]=min
        willbeReturned[minIndex]=temp
    }
    return willbeReturned
}

var myArray=[5,6,1,3,2,4]
var returnedArray=sortArray(arr:myArray)
for item in returnedArray {
    print(item)
}
