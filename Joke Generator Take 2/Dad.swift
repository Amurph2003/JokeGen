//
//  Dad.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/17/20.
//

import SwiftUI

struct Dad: View {
    @State var StatusUpdate = "heart"
    @State var Saved = Bool()
    @State var JokesTold = [0]
    @State var Joke = Int.random(in: 1 ... 3)
    @State var isShareSheetShowing = false
    @State var SelectedJoke = "I was sitting in traffic the other day. Probably why I got run over."
    var body: some View {
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.all)
        VStack{
            Text("Dad Jokes")
                .foregroundColor(Color.blue)
                .font(Font.custom("SignPainter", size: 60))
                .padding(.top, 50)
            Spacer()
            Text("\(self.SelectedJoke)")
                .multilineTextAlignment(.center).minimumScaleFactor(0.75)
                .foregroundColor(Color.purple)
                .font(Font.custom("Noteworthy", size: 25))
            //    .padding(.bottom, 75)
                .padding()
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
            Button(action: {self.DadJokes()} ){
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
                    }
                }
            }
            .padding([.leading, .trailing], 50)
            .padding(.bottom, 50)
       //     Banner()
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
    
    func DadJokes(){
        self.Joke = Int.random(in: 1 ... 35)
        Repeats()
        if Joke == 1 {SelectedJoke = "God must love stupid people. He made so many!"}
        else if Joke == 2 {SelectedJoke = "Why do we tell actors to break a leg? Because every play has a cast!"}
        else if Joke == 3 {SelectedJoke = "I hate it when people tell puns. They always think they're so punny!"}
        else if Joke == 4 {SelectedJoke = "I think there's something in my shoe... Oh wait, it's just my foot!"}
        else if Joke == 5 {SelectedJoke = "I heard Donald Trump is going to ban shredded cheese. He says it'll make America Grate Again!"}
        else if Joke == 6 {SelectedJoke = "Someone told me that onions are the only food that make you cry. So I threw an apple at their face."}
        else if Joke == 7 {SelectedJoke = "I wanna change my Facebook username to Nobody, so that when I like people's really bad posts, it'll say 'Nobody likes this'"}
        else if Joke == 8 {SelectedJoke = "I changed my passwords to 'Incorrect' so when I forget my password, it will tell me 'Your Password Is Incorrect'"}
        else if Joke == 9 {SelectedJoke = "You know what always catches my eye? Short people with umbrellas."}
        else if Joke == 10 {SelectedJoke = "I hired a landscape gardener. Then he told me he can't do anything because the garden was portrait."}
        else if Joke == 11 {SelectedJoke = "It takes guts to be an organ donor."}
        else if Joke == 12 {SelectedJoke = "All my jokes are organic because they're Home Groan"}
        else if Joke == 13 {SelectedJoke = "What do you call an unpredictable camera? A loose Canon."}
        else if Joke == 14 {SelectedJoke = "Sore throats are a pain in the neck."}
        else if Joke == 15 {SelectedJoke = "Stephen King has a son named Joe. I'm not joking, but he is"}
        else if Joke == 16 {SelectedJoke = "Working in a mirror factory is something I can totally see myself doing."}
        else if Joke == 17 {SelectedJoke = "Whenever my son fixes my computer and I ask him what was wrong, he gives me the same amnswer. 'It was an ID ten T error'"}
        else if Joke == 18 {SelectedJoke = "Why did the nurse need a red pen at work?\nIn case she needed to draw blood!"}
        else if Joke == 19 {SelectedJoke = "A father and his child are sitting on a couch. The child says, 'Dad, am I adopted?' The father says 'Not yet kiddo, I only put the ad up yesterday.'"}
        else if Joke == 20 {SelectedJoke = "I invented a new word the other day! Plagarism!"}
        else if Joke == 21 {SelectedJoke = "To the man who stole my wheelchair and camoflauge jacket - You can hide but you can't run!"}
        else if Joke == 22 {SelectedJoke = "Atheism is a non-prophet organization"}
        else if Joke == 23 {SelectedJoke = "I'm glad I know sign language. It comes in pretty handy!"}
        else if Joke == 24 {SelectedJoke = "What do you call an apology written in dots and dashes? Re-morse Code!"}
        else if Joke == 25 {SelectedJoke = "Can I tell you a vegan joke? I promise it isn't cheesy!"}
        else if Joke == 26 {SelectedJoke = "I wonder what my parents did to pass the time before internet. I asked my 19 brothers and sisters and they don't know either."}
        else if Joke == 27 {SelectedJoke = "What award did the Avengers win? The Stan-Lee Cup!"}
        else if Joke == 28 {SelectedJoke = "Where does a one-legged waitress work? IHop!"}
        else if Joke == 29 {SelectedJoke = "Why are elevator jokes the best? They work on so many levels!"}
        else if Joke == 30 {SelectedJoke = "Did you hear Steve Harvey got into a fight with his wife? It was a Family Feud!"}
        else if Joke == 31 {SelectedJoke = "If spaghetti made an action movie, what would it be called? Mision: Im-pasta-ble!"}
        else if Joke == 32 {SelectedJoke = "What do you call a lazy Doctor? Dr. Do little"}
        else if Joke == 33 {SelectedJoke = "What is Starbucks favorite city? Fort Latte-Dale"}
        else if Joke == 34 {SelectedJoke = "I saw Tom Hanks today and asked him for an Autograph. All he wrote was Thanks"}
        else if Joke == 35 {SelectedJoke = "How many lips does a flower have? Two lips!"}
        Status()
    }
        
        func Repeats() {
            
            if JokesTold.contains(Joke) {
                   repeat {self.Joke = Int.random(in: 1 ... 35)} while JokesTold.contains(Joke)}
            
            JokesTold.append(Joke)
            print(JokesTold)
            
        if (JokesTold.contains(1) && JokesTold.contains(2) && JokesTold.contains(3) && JokesTold.contains(4) && JokesTold.contains(5) && JokesTold.contains(6) && JokesTold.contains(7) && JokesTold.contains(8) && JokesTold.contains(9) && JokesTold.contains(10) && JokesTold.contains(11) && JokesTold.contains(12) &&
            JokesTold.contains(13) && JokesTold.contains(14) && JokesTold.contains(15) &&
            JokesTold.contains(16) && JokesTold.contains(17) && JokesTold.contains(18) &&
            JokesTold.contains(19) && JokesTold.contains(20) && JokesTold.contains(21) &&
            JokesTold.contains(22) && JokesTold.contains(23) && JokesTold.contains(24) &&
            JokesTold.contains(25) && JokesTold.contains(26) && JokesTold.contains(27) && JokesTold.contains(28) && JokesTold.contains(29) && JokesTold.contains(30) && JokesTold.contains(31) && JokesTold.contains(32) && JokesTold.contains(33) && JokesTold.contains(34) && JokesTold.contains(35)) {JokesTold.removeLast(35)}
        
        }
}

struct Dad_Previews: PreviewProvider {
    static var previews: some View {
        Dad()
    }
}
