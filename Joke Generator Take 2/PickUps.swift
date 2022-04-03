//
//  PickUps.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/17/20.
//

import SwiftUI

struct PickUps: View {
    @State var StatusUpdate = "heart"
    @State var Saved = Bool()
    @State var JokesTold = [0]
    @State var Joke = Int.random(in: 1 ... 3)
    @State var isShareSheetShowing = false
    @State var SelectedJoke = "I know someone who likes you. If I weren't so shy, I'd tell you."
    var body: some View {
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.all)
        VStack{
            Text("Pick Up Lines")
                .foregroundColor(Color.blue)
                .font(Font.custom("SignPainter", size: 60))
                .padding(.top, 50)
            Spacer()
            Text("\(self.SelectedJoke)")
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.75)
                .foregroundColor(Color.purple)
                .font(Font.custom("Noteworthy", size: 25))
                .padding()
            //    .padding(.bottom, 75)
            Spacer()
            HStack{
                Button(action: {self.isShareSheetShowing = true} ){
                    ZStack{
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 30, height: 35, alignment: .center)
                    }
                }
                    .sheet(isPresented: $isShareSheetShowing, onDismiss: {
                        print("Dismiss")
                    }, content: {
                     ActivityViewController(activityItems: ["Look what I found on Joke Generator! - bit.ly/jokegen \n \n\(self.SelectedJoke)"])
                    })
                Spacer()
            Button(action: {self.PickupLines()} ){
                ZStack{
                               Image(systemName: "rectangle.fill")
                                   .resizable()
                                   .frame(width: 100, height: 40, alignment: .center)
                                .foregroundColor(darkYellow)
                Text("New Joke")
                }
                }
    Spacer()
                Button(action: {
                    Loved()
                    Status()
                }) {
                    ZStack{
                        Image(systemName: "\(StatusUpdate)")
                            .resizable()
                            .frame(width: 40, height: 35, alignment: .center)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding([.leading, .trailing], 50)
                .padding(.bottom, 50)
                }
            }
        .edgesIgnoringSafeArea(.all)
        }
    
    func Status() {
        if LovedJokes.contains(SelectedJoke){
            StatusUpdate = "heart.fill"
        } else {
            StatusUpdate = "heart"
        }
    }
    
    func Loved() {
        UserDefaults.standard.removeObject(forKey: "Favorites")
        if LovedJokes.contains(SelectedJoke){
            Remove()
           // Saved = false
        } else {LovedJokes.append(SelectedJoke)
           // Saved = true
        }
        UserDefaults.standard.set(LovedJokes, forKey: "Favorites")
        print(LovedJokes)
    }
    
    func Remove() {
        let Index = LovedJokes.firstIndex(of: "\(SelectedJoke)")
        LovedJokes.remove(at: Index!)
    }
    
    func PickupLines(){
        self.Joke = Int.random(in: 1 ... 17)
        Repeats()
        if Joke == 1 {SelectedJoke = "You're so good looking that I forgot my pickup line!"}
        else if Joke == 2 {SelectedJoke = "If the Coronavirus doesn't take you out, can I?"}
        else if Joke == 3 {SelectedJoke = "Do you believe in love at first sight - Or should I walk by again?"}
        else if Joke == 4 {SelectedJoke = "If I were to ask you out, would your answer be the same answer to this question?"}
        else if Joke == 5 {SelectedJoke = "'Hey Siri, why am I single?' \n - 'Activating Front Camera'"}
        else if Joke == 6 {SelectedJoke = "I don't often get asked out on a date. But when I do, it's April 1st."}
        else if Joke == 7 {SelectedJoke = "If you're cooler than me, would that make me hotter than you?"}
        else if Joke == 8 {SelectedJoke = "Everything I like is either \n Expensive, \n Illegal, or \n Won't text me back."}
        else if Joke == 9 {SelectedJoke = "I've been blinded by your beauty. \n I need you name and number for insurance purposes."}
        else if Joke == 10 {SelectedJoke = "You look familiar… \n Didn't we take a class together? \n I could've sworn we had chemistry."}
        else if Joke == 11 {SelectedJoke = "Some people cause happiness wherever they go. Others do whenever they go."}
        else if Joke == 12 {SelectedJoke = "If nothing lasts forever, will you be my nothing?"}
        else if Joke == 13 {SelectedJoke = "Can I follow you home? Cause my parents always told me to follow my dreams"}
        else if Joke == 14 {SelectedJoke = "If nothing lasts forever, will you be my nothing?"}
        else if Joke == 15 {SelectedJoke = "Are you my phone charger? Because without you, I’d die"}
        else if Joke == 16 {SelectedJoke = "If I could rearrange the alphabet, I’d put ‘U’ and ‘I’ together"}
        else if Joke == 17 {SelectedJoke = "Well, here I am. What are you're other 2 wishes?"}
        Status()
        }
        
        func Repeats() {
            
            if JokesTold.contains(Joke) {
                      repeat {self.Joke = Int.random(in: 1 ... 17)} while JokesTold.contains(Joke)}
            
            JokesTold.append(Joke)
            print(JokesTold)
            
        if (JokesTold.contains(1) && JokesTold.contains(2) && JokesTold.contains(3) && JokesTold.contains(4) && JokesTold.contains(5) && JokesTold.contains(6) && JokesTold.contains(7) && JokesTold.contains(8) && JokesTold.contains(9) && JokesTold.contains(10) && JokesTold.contains(11) && JokesTold.contains(12) &&
        JokesTold.contains(13) && JokesTold.contains(14) && JokesTold.contains(15) &&
        JokesTold.contains(16) && JokesTold.contains(17)) {JokesTold.removeLast(17)}
           
        
        }
        
        func shareButton() {
            isShareSheetShowing = true
            let ShareJoke = Text("Look what I found on Joke generator! \(SelectedJoke)")
            let av = UIActivityViewController(activityItems: [ShareJoke], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        }
}

struct PickUps_Previews: PreviewProvider {
    static var previews: some View {
        PickUps()
    }
}
