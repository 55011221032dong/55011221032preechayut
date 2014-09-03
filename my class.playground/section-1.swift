class myarray{
    let test:Int
    var fac:Double
    
    init(test:Int,fac:Double){
    self.test=test
    self.fac=fac
    }
    
    func factory()->Double{
        var res:Double
        for (var i=0;i<10;i++){
            res=1*i ;
        }
    return res
    }
    
    
}
var tt=myarray(test: 5, fac: 10)

tt.factory()


