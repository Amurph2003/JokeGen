//
//  Funny.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/17/20.
//

import SwiftUI

struct Funny: View {
    @State var StatusUpdate = "heart"
    @State var Saved = Bool()
    @State var JokesTold = [0]
    @State var isShareSheetShowing = false
    @State var Joke = Int.random(in: 1 ... 3)
    @State var SelectedJoke = "What do a middle finger and a middle name have in common? They're both used when someone's pissed at you!"
        @State var IsFavorited: Bool = true
    var body: some View {
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.all)
        VStack{
            Text("Funny Jokes")
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
                Button(action: {self.FunnyJokes()} ){
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
          //  Banner()
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

    func FunnyJokes(){
        self.Joke = Int.random(in: 1 ... 25)
        Repeats()
     //   CheckFavoritedJokes()
        
        if Joke == 1 {SelectedJoke = "Why are soviet ubers the best? \n Because they're always Russian!"}
        else if Joke == 2 {SelectedJoke = "The gym is calling my name but my bed is holding me captive"}
        else if Joke == 3 {SelectedJoke = "A turtle is crossing the road and was mugged by two snails. \n When the police arrive, they ask what happened. \n The turtle responded 'I don't know. It all happened so fast!'"}
        else if Joke == 4 {SelectedJoke = "I ordered a chicken and an egg from Amazon. \n I'll let you know."}
        else if Joke == 5 {SelectedJoke = "It must be pretty difficult to post inspirational stuff when you're blood type is B-Negative!"}
        else if Joke == 6 {SelectedJoke = "My neighbor knocked on my door at 2:30 in the morning. can you believe it, 2:30 a.m.! \n Luckily I was still up playing the bagpipes."}
        else if Joke == 7 {SelectedJoke = "I was arrested at the airport a while ago. \n Apparently Security doesn't appreciate you yelling 'Shotgun!' before boarding a plane."}
        else if Joke == 8 {SelectedJoke = "I'm Buzz Aldrin, second man to step on the moon. \n Neil before me!"}
        else if Joke == 9 {SelectedJoke = "When filling out applications, when I reach the part saying 'In an emergency, notify:' I put 'doctor.' \n I mean, what's my mother going to do. "}
        else if Joke == 10 {SelectedJoke = "I'm more pissed off than a dragon trying to blowout candles."}
        else if Joke == 11 {SelectedJoke = "A thief broke into my house last night and started searching for money. I woke up and helped him."}
        else if Joke == 12 {SelectedJoke = "A stupid person laughs at a joke 3 times. Once when everyone else is laughing. A second time when he finally gets the joke and a third time when he realizes he was laughing without getting the joke at first."}
        else if Joke == 13 {SelectedJoke = "It takes real skill to choke on air, fall up the stairs and trip over nothing. I have those skills."}
        else if Joke == 14 {SelectedJoke = "Research has shown that laughing for 2 minutes is just as healthy as a 20 minute jog. Now I sit in the park laughing at all the joggers."}
        else if Joke == 15 {SelectedJoke = "I've been bored recently so I've decided to take up fencing. The neighbors said they'll call the police unless I put it back."}
        else if Joke == 16 {SelectedJoke = "You think you're bored? Sir Isaac newton invented Calculus during a plague. You know how bored you have to be to INVENT Calculus?!"}
        else if Joke == 17 {SelectedJoke = "I really feel bad for the class of 2020. Everyone says your senior year flies. \n I just didn't realize it would Zoom."}
        else if Joke == 18 {SelectedJoke = "A drum and a cymbal fell off a cliff..."}
        else if Joke == 19 {SelectedJoke = "I like telling Dad jokes. Sometimes he laughs."}
        else if Joke == 20 {SelectedJoke = "The secret service isn't allowed to yell 'Get down!' anymore when the president is about to be attacked. Now they have to yell 'Donald duck!'"}
        else if Joke == 21 {SelectedJoke = "The numbers 19 and 20 got into a fight - 21"}
        else if Joke == 22 {SelectedJoke = "June's over?? Julying!"}
        else if Joke == 23 {SelectedJoke = "Who hates speeding tickets? Raise your right foot"}
        else if Joke == 24 {SelectedJoke = "Why didn't the power line go to prom? Because it was grounded!"}
        else if Joke == 25 {SelectedJoke = "What's the opposite of Irony? Wrinkly!"}
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
        JokesTold.contains(19) && JokesTold.contains(20) && JokesTold.contains(21) &&
        JokesTold.contains(22) && JokesTold.contains(23) && JokesTold.contains(24) && JokesTold.contains(25)) {JokesTold.removeLast(25)}
           
        
        }
}

struct Funny_Previews: PreviewProvider {
    static var previews: some View {
        Funny()
    }
}
