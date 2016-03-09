//: Playground - noun: a place where people can play

import UIKit

//optional type
var intOpt = Optional(123)
intOpt = Optional(3)//wrapping
intOpt.dynamicType

//only Optional can be nil
var stringOpt : String?
stringOpt
//if it == nil then it's optional

//unwrapping optional
var notOpt = intOpt!

//optional chain
var option : String? = "hello world"
var upper = option!.uppercaseString

//comparing optionals
var t = "some string"
if(t == "some string")//compares wrapped string not the Optional
{
    print("true")
}

//comparing optionals, conditional binding
var s : String?
if(s == nil)
{
    print("is an optional")
}

//comparing two optionals
var x : Int? = 2
var y : Int?
if(x == y)
{
    print("both optionals")
}
else
{
    print("false because one operand has a value")
}

y = 3
if(x < y)
{
    print("compares wrapped values if both have values")
}




//object types, required initializer
class Car {
    //instance properties
    var year : Int
    var make : String
    
    //instance method
    func makeNoise() -> Void {
        print("noise")
    }
    //class method
    class func CarTruck() ->Void {
        print("louder noise")
    }
    
    
    //failable initializer, could return optional
    required init?(make: String, year: Int = 0)
    {
        self.make = make
        self.year = year
        
        if(year < 0){
            return nil
        }
        
        self.makeNoise()
    }
    
    

    
    
    //initializer without optional
//    init(make : String, year : Int){
//        self.make = make
//        self.year = year
//        
//    }
    
}
var exCar = Car(make: "ford", year: -10)
exCar.dynamicType
exCar?.makeNoise()


//class properties
struct Fish {
    static let age = "1"
    static let name = "fishy"
    static var intro : String{
        return self.name + "is" + self.age
    }
}


//subscripts
class Year {
    private var names = ["freshman", "sophomore", "junior", "senior"]
    
    
    subscript(ind: Int) -> String{
        return names[ind]
    }
}
var showYr = Year()
print("I am a \(showYr[2])")

//subscript get and set
class Letters {
    
    var str : String
    
    init(str : String) {
        self.str = str
    }
    
    
    subscript(ind : Int) -> String {
        get {
            return String(str.characters[str.startIndex.advancedBy(ind)])
        }
        
        set {
            var original = str
            let range = original.startIndex.advancedBy(ind)..<original.startIndex.advancedBy(ind+1)
            
            original.replaceRange(range, with: newValue)
            self.str = original
        }
    }
}


//enum, raw type
enum Time : Int {
    case One = 1
    case Two = 2
    case Three = 3
    
    //mutating function because self is changed
    mutating func timePass() {
        let changed = Time(rawValue: self.rawValue+1)
        self = changed!
    }
}
var timeType = Time(rawValue: 2)
let equalsNil = Time(rawValue: 8)
timeType?.timePass()
timeType!


//Inheritance, final class, override
final class Truck : Car {//subclasses cannot inherit Truck
    
    override func makeNoise() {//does something different for Trucks and Cars
        print("louder noise")
    }

    
    
}
let car = Car(make: "bmw", year: 2001)
car?.makeNoise();
let truck = Truck(make: "toyota", year: 2003)
truck?.makeNoise()

//car with convenience initializer, delegating initializer, deinitializer
class Car2 {
    var make : String
    var year : Int
    
    init(make: String, year: Int){
        self.year = year
        self.make = make
    }
    
    convenience init()
    {
        self.init(make : "", year : 0)
    }
    
    deinit{
        print("bye")
    }
}


//casting
func carNoise(car : Car)
{
    car.makeNoise()
    
    //cast optional to louderCar
    let louderCar = car as? Truck
    if louderCar != nil {
        louderCar?.makeNoise()
    }
}
carNoise(car!)



//protocols
protocol SeaAnimal {
    var numOfFins : Int { get }
    
    func makeSound()
    
}

class Shark : SeaAnimal {
    var numOfFins = 3
    
    func makeSound(){
        print("whatever sound a shark makes")
    }
}


//umbrella types
func allowAnyObject(object : AnyObject){
    print("AnyObject allows all class types")
}

allowAnyObject(Car(make: "ford", year: 1992)!)
allowAnyObject("string")
allowAnyObject(2)



//extension
extension Int
{
    func incrementFive()->Int{
        return self+5
    }
}
23.incrementFive()



//errors
enum CodeError : ErrorType {
    case SyntaxError
    case LogicError
    case CompilerError
    case RuntimeError
}

//throwing errors
func badLogic() throws
{
    throw CodeError.LogicError
}

//catching errors
do {
    try badLogic()
}
catch CodeError.LogicError {
    print("caught logic error")
}
catch let error as CodeError {
    print("\(error) occured")
}
catch {
    print("there was an error")
}

try? badLogic()

//arrays
let catNames : [String] = ["whiskers", "doug", "fluffy"]
catNames[1]
catNames.contains("bob")
catNames.indexOf("fluffy")
catNames.count


//dictionary
//int is key, string is value
var animals = [Int:String]()
animals[2] = "horses"
animals[4] = "parakeets"
animals

animals.filter { (num, str) -> Bool in
    return str.containsString("e")
}



//switch statements, shortcircuiting
let myError : CodeError = .SyntaxError
switch myError {
case .CompilerError:
    print("boo there's a compiler error")
    break //will leave switch
case .LogicError:
    print("boo there's a logical error")
case .SyntaxError:
    print("boo you have a syntax error")
    fallthrough //goes to next case too
default:
    print("idk figure it out yourself")
}



//ternary expressions
var n = 6
let evenOdd = (n%2==0) ? "even" : "odd"


//while loop
while(n > 0) {
    n--
    print(n)
}

//for loop
var someString = "hello world"
for i in someString.characters where i == "o" {
    print("we came across the letter o")
}



