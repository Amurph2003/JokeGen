//
//  BadJokes.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/13/20.
//

import SwiftUI


var LovedJokes = [String]()


struct BadJokes: View {
    @State var StatusUpdate = "heart"
    @State var Saved = Bool()
    @State var JokesTold = [Int]()
    @State var isShareSheetShowing = false
    @State var Joke = Int.random(in: 1 ... 9)
    @State var SelectedJoke = "Two windmills are standing in a wind farm. One asks, 'What's your favorite type of music?' The other says, 'I'm a big metal fan.'"
    var body: some View {
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.all)
        VStack{
            Text("Bad Jokes")
                .foregroundColor(Color.blue)
                .font(Font.custom("SignPainter", size: 60))
                .padding(.top, 50)
            Spacer()
            Text("\(self.SelectedJoke)")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.purple)
                .font(Font.custom("Noteworthy", size: 25))
                .padding()
                .minimumScaleFactor(0.75)
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
            Button(action: {self.BadJoke()} ){
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
        UserDefaults.standard.stringArray(forKey: "Favorites")
        if LovedJokes.contains(SelectedJoke){
            Remove()
           // Saved = false
        } else {LovedJokes.append(SelectedJoke)
           // Saved = true
        }
        UserDefaults.standard.stringArray(forKey: "Favorites")
        print(LovedJokes)
    }
    
    func Remove() {
        let Index = LovedJokes.firstIndex(of: "\(SelectedJoke)")
        LovedJokes.remove(at: Index!)
    }
    
    func Share() {
        isShareSheetShowing.toggle()
        let ShareJoke = Text("Look what I found on Joke generator! \(SelectedJoke)")
        let av = UIActivityViewController(activityItems: [ShareJoke], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    func BadJoke(){
       
        self.Joke = Int.random(in: 1 ... 25)
        
        Repeats()
        
        
        if Joke == 1 {SelectedJoke = "God must love stupid people. He made so many!"}
        else if Joke == 2 {SelectedJoke = "Why do we tell actors to break a leg? \n Because every play has a cast!"}
        else if Joke == 3 {SelectedJoke = "I hate it when people tell puns. They always think they're so punny!"}
        else if Joke == 4 {SelectedJoke = "I think there's something in my shoe... \n Oh wait, it's just my foot!"}
        else if Joke == 5 {SelectedJoke = "Saying 'No thanks, I'm a vegetarian' when someone hands you their baby is a lot of fun!"}
        else if Joke == 6 {SelectedJoke = "I made Jesus my background picture. My phone never dies now! he's my screen-savior."}
        else if Joke == 7 {SelectedJoke = "Light travels faster than sound. That's why some people appear bright until you hear them speak."}
        else if Joke == 8 {SelectedJoke = "I'm great at multitasking. I can be unproductive, waste time, and procrastinate all at once!"}
        else if Joke == 9 {SelectedJoke = "'Going to bed and waiting to see how you feel in the morning' \n is the human version of \n 'Did you try powering it off and back on?'"}
        else if Joke == 10 {SelectedJoke = "Why are there gates around cemeteries? Because people are dying to get in."}
        else if Joke == 11 {SelectedJoke = "My boss told me to have a good day. So I went home!"}
        else if Joke == 12 {SelectedJoke = "Where did the cow go on it's date? The moovies!"}
        else if Joke == 13 {SelectedJoke = "What did the shark say after eating the clownfish? This tastes funny"}
        else if Joke == 14 {SelectedJoke = "What part of the earth is the most pessimistic? The At-most-phere!"}
        else if Joke == 15 {SelectedJoke = "When do you put a cow in an elevator? When you wanna raise the steaks!"}
        else if Joke == 16 {SelectedJoke = "What animal has more lives than a cat? Frogs, they croak every night!"}
        else if Joke == 17 {SelectedJoke = "Why did the man name his dogs Rolex and Timex? Because they were watchdogs!"}
        else if Joke == 18 {SelectedJoke = "What's the bone that only some musicians have? A trombone!"}
        else if Joke == 19 {SelectedJoke = "I'm a really down to earth guy cause, ya know... gravity"}
        else if Joke == 20 {SelectedJoke = "If someone hits you on the head with a coffee cup, have you been mugged?"}
        else if Joke == 21 {SelectedJoke = "Why is abbreviation such a long word?"}
        else if Joke == 22 {SelectedJoke = "I'm not weird, I'm special edition!"}
        else if Joke == 23 {SelectedJoke = "What do sprinters eat before a race? Nothing, they fast!"}
        else if Joke == 24 {SelectedJoke = "What’s the best way to carve wood? Whittle by whittle"}
        else if Joke == 25 {SelectedJoke = "What do you call a person with a briefcase in a tree? A branch manager"}
        Status()
        }
    
    
    func Repeats() {
        if JokesTold.contains(Joke) {
        repeat {self.Joke = Int.random(in: 1 ... 25)} while JokesTold.contains(Joke)}
        

        JokesTold.append(Joke)
        print(JokesTold)
        
        if (JokesTold.contains(1) && JokesTold.contains(2) && JokesTold.contains(3) && JokesTold.contains(4) && JokesTold.contains(5) && JokesTold.contains(6) && JokesTold.contains(7) && JokesTold.contains(8) && JokesTold.contains(9) && JokesTold.contains(10) && JokesTold.contains(11) && JokesTold.contains(12) &&
            JokesTold.contains(13) && JokesTold.contains(14) && JokesTold.contains(15) &&
            JokesTold.contains(16) && JokesTold.contains(17) && JokesTold.contains(18) &&
            JokesTold.contains(19) && JokesTold.contains(20) && JokesTold.contains(21) && JokesTold.contains(22) && JokesTold.contains(23) && JokesTold.contains(24) && JokesTold.contains(25)) {JokesTold.removeLast(25)}
    }
    
    
}

struct BadJokes_Previews: PreviewProvider {
    static var previews: some View {
        BadJokes()
    }
}
