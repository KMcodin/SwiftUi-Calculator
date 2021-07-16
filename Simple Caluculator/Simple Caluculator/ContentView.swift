import SwiftUI

struct ContentView: View {
    
    //variables
    @State var displayText = ""
    @State var num1 = ""
    @State var num2 = ""
    @State var answer = 0.0
    @State var input = ""
    @State var inputIndex = 0
    @State var operatorCheck: Bool = false
    @State var operators = ""
    @State var firstNumCheck: Bool = false
    @State var decimalCheck: Bool = false
    @State var negativeCheck: Bool = false
    @State var modCheck: Bool = false
    @State var equalCheck: Bool = false
    @State var inputHis = ""
    
    var body: some View {
        NavigationView {
                VStack{
                    Text("\(displayText)")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding([.top, .bottom, .trailing])
                        .frame(width: 350, height: 80, alignment: .trailing)
                        .background(Color(UIColor(red: 0.9, green: 0.9, blue: 0.7, alpha: 1)))
                        .font(.largeTitle)
                    
                    HStack{
                        Button(action: {
                            AC()
                        }, label: {
                            Image("AC")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            negative()
                        }, label: {
                            Image("+-")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            mod()
                        }, label: {
                            Image("%")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            div()
                        }, label: {
                            Image("div")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                    }
                    HStack{
                        Button(action: {
                            numButton(num: 7)
                        }, label: {
                            Image("7")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            numButton(num: 8)
                        }, label: {
                            Image("8")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            numButton(num: 9)
                        }, label: {
                            Image("9")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            multi()
                        }, label: {
                            Image("X")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                    }
                    HStack{
                        Button(action: {
                            numButton(num: 4)
                        }, label: {
                            Image("4")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            numButton(num: 5)
                        }, label: {
                            Image("5")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            numButton(num: 6)
                        }, label: {
                            Image("6")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            sub()
                        }, label: {
                            Image("-")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                    }
                    HStack{
                        Button(action: {
                            numButton(num: 1)
                        }, label: {
                            Image("1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            numButton(num: 2)
                        }, label: {
                            Image("2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            numButton(num: 3)
                        }, label: {
                            Image("3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            add()
                        }, label: {
                            Image("+")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                    }
                    HStack{
                        Button(action: {
                            numButton(num: 0)
                        }, label: {
                            Image("0")
                                .resizable()
                                .frame(width: 170, height: 60)
                        }
                        )
                        Button(action: {
                            decimal()
                        }, label: {
                            Image("dot")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                        Button(action: {
                            equal()
                        }, label: {
                            Image("=")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        }
                        )
                    }
                    Spacer()
                    Text("\(input)")
                        .padding()
                        .frame(width: 350, height: 50, alignment: .leading)
                        .border(Color.black, width: 1)
                    HStack{
                        ScrollView{
                            Text("\(inputHis)").frame(alignment: .leading)
                        }.frame(width: 350, height: 180, alignment: .leading)
                    }
                    Spacer()
                }.navigationTitle("Simple Calculator")
        }
        
    }
    func numButton(num: Int){
        if(!equalCheck){
            if(!firstNumCheck){
                num1 += "\(num)"
                displayText = num1
                input = num1 + operators + num2
            }else{
                num2 += "\(num)"
                displayText = num2
                input = num1 + operators + num2
            }
        }
    }
    
    func AC(){
        input = ""
        displayText = "0"
        num1 = ""
        num2 = ""
        operators = ""
        firstNumCheck = false
        decimalCheck = false
        negativeCheck = false
        modCheck = false
        operatorCheck = false
        equalCheck = false
        inputIndex += 1
        inputHis = "[\(inputIndex)]: AC -> 0\n\n" + inputHis
    }
    
    func add(){
        if(!operatorCheck){
            if equalCheck {
                operators = "+"
                displayText = "+"
                input = num1 + "+"
                operatorCheck = true
                firstNumCheck = true
                equalCheck = false
                decimalCheck = false
            }else {
                operators = "+"
                displayText = "+"
                input += "+"
                operatorCheck = true
                firstNumCheck = true
                decimalCheck = false
            }
            
        }
    }
    
    func sub(){
        if(!operatorCheck){
            if equalCheck {
                input = num1 + "-"
                operators = "-"
                displayText = "-"
                operatorCheck = true
                firstNumCheck = true
                equalCheck = false
                decimalCheck = false
            }else{
                displayText = "-"
                operators = "-"
                input += "-"
                operatorCheck = true
                firstNumCheck = true
                decimalCheck = false
            }
        }
    }
    
    func multi(){
        if(!operatorCheck){
            if equalCheck {
                input = num1 + "x"
                operators = "x"
                displayText = "x"
                operatorCheck = true
                firstNumCheck = true
                equalCheck = false
                decimalCheck = false
            }else{
                operators = "x"
                displayText = "x"
                input += "x"
                operatorCheck = true
                firstNumCheck = true
                decimalCheck = false
            }
        }
    }
    
    func div(){
        if(!operatorCheck){
            if equalCheck {
                input = num1 + "/"
                operators = "/"
                displayText = "/"
                operatorCheck = true
                firstNumCheck = true
                equalCheck = false
                decimalCheck = false
            }else{
                operators = "/"
                displayText = "/"
                input += "/"
                operatorCheck = true
                firstNumCheck = true
                decimalCheck = false
            }
        }
    }
    
    func decimal(){
        if !equalCheck {
            if(!decimalCheck){
                if(!firstNumCheck){
                    num1 += "."
                    input = num1 + operators + num2
                    displayText = num1
                    decimalCheck = true
                }else{
                    num2 += "."
                    input = num1 + operators + num2
                    displayText = num2
                    decimalCheck = true
                }
            }
        }
    }
    
    func negative(){
        if !equalCheck {
            if(!negativeCheck){
                if !firstNumCheck {
                    num1 = "-" + num1
                    input = num1 + operators + num2
                    displayText = num1
                    negativeCheck = true
                }else{
                    num2 = "-" + num2
                    input = num1 + operators + num2
                    displayText = num2
                    negativeCheck = true
                }
            }else {
                if !firstNumCheck {
                    num1.removeFirst()
                    input = num1 + operators + num2
                    displayText = num1
                    negativeCheck = false
                }else{
                    num2.removeFirst()
                    input = num1 + operators + num2
                    displayText = num2
                    negativeCheck = false
                }
            }
        }
    }
    
    func mod(){
//        if(!operatorCheck){
//            if equalCheck {
//                input = num1 + "%"
//                operators = "%"
//                displayText = "%"
//                operatorCheck = true
//                firstNumCheck = true
//                equalCheck = false
//                decimalCheck = false
//            }else{
//                operators = "%"
//                displayText = "%"
//                input += "%"
//                operatorCheck = true
//                firstNumCheck = true
//                decimalCheck = false
//            }
//        }
//        For actual percentage
        if !equalCheck {
            if !firstNumCheck {
                num1 = String(Double(num1)!/100)
                displayText = num1
                input = num1 + operators + num2
            }else{
                num2 = String(Double(num2)!/100)
                displayText = num2
                input = num1 + operators + num2
            }
        }
    }
    
    func equal(){
        if(operatorCheck){
            if(operators == "+"){
                answer = Double(num1)! + Double(num2)!
            }
            if operators == "-" {
                answer = Double(num1)! - Double(num2)!
            }
            if operators == "/" {
                answer = Double(num1)! / Double(num2)!
            }
            if operators == "x"{
                answer = Double(num1)! * Double(num2)!
            }
//            if operators == "%"{
//                answer = Double(num1)!.truncatingRemainder(dividingBy: Double(num2)!)
//            }
            
            input += " = " + String(answer)
            inputIndex += 1
            inputHis = "[\(inputIndex)]: \(input)\n\n" + inputHis
            displayText = String(answer)
            num1 = String(answer)
            num2 = ""
            operatorCheck = false
            firstNumCheck = true
            operators = ""
            equalCheck = true
        }else{
            displayText = "Error"
        }
    }
}
//content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
