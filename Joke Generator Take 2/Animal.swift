//
//  Animal.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/17/20.
//

import SwiftUI

struct Animal: View {
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
                    Button(action: {self.AnimalJokes()} ){
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
            
            func Share() {
                isShareSheetShowing.toggle()
                let ShareJoke = Text("Look what I found on Joke generator! \(SelectedJoke)")
                let av = UIActivityViewController(activityItems: [ShareJoke], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
            }
    
    func AnimalJokes(){
        self.Joke = Int.random(in: 1 ... 25)
        
        Repeats()
        
      if Joke == 1 {SelectedJoke = "Why’d the duck cross the road? To prove it wasn’t chicken!"}
else if Joke == 2 {SelectedJoke = "What animal has the best sense of time? A watchdog!"}
else if Joke == 3 {SelectedJoke = "Where do dogs go to get new tails? A re-tail shop!"}
else if Joke == 4 {SelectedJoke = "My dog likes to chase people on a bike. They kept complaining, and it got so bad I had to take his bike away."}
else if Joke == 5 {SelectedJoke = "Why does a chicken coop only have 2 doors? Because else if it had 4, it would be a chicken sedan!"}
else if Joke == 6 {SelectedJoke = "How do you count cows? With a cow-culator"}
else if Joke == 7 {SelectedJoke = "What kind of dogs have the best comebacks? A Burn-ese!"}
else if Joke == 8 {SelectedJoke = "I went to the zoo the other day and it only had one animal. It was a shitzu!"}
else if Joke == 9 {SelectedJoke = "Why did the man name his dogs Rolex and Timex? Because they were watchdogs!"}
else if Joke == 10 {SelectedJoke = "Why can’t you play hide and seek in the jungle? There are too many Cheetahs!"}
else if Joke == 11 {SelectedJoke = "Can a kangaroo jump higher than the Empire State Building? Of course, the Empire State Building can’t jump!"}
else if Joke == 12 {SelectedJoke = "What did the fish say after swimming into a wall? Dam!"}
else if Joke == 13 {SelectedJoke = "My email was hacked again yesterday. That’s the third time I’ve had to rename the dog."}
else if Joke == 14 {SelectedJoke = "What do you call a toothless bear? A gummy bear!"}
else if Joke == 15 {SelectedJoke = "Why are fish so smart? They’re always in schools!"}
else if Joke == 16 {SelectedJoke = "What animal has more lives than a cat? Frogs, they croak every night!"}
else if Joke == 17 {SelectedJoke = "What can horses never get anything done at meetings? All they say is neigh!"}
else if Joke == 18 {SelectedJoke = "Why are mice afraid of swimming? Catfish"}
else if Joke == 19 {SelectedJoke = "Why does Mozart hate chickens? All they ever say is ‘Bach’"}
else if Joke == 20 {SelectedJoke = "Why are teddy bears never hungry? They’re always stuffed!"}
else if Joke == 21 {SelectedJoke = "What do you call a sleeping bull? A Bull-Dozer!"}
else if Joke == 22 {SelectedJoke = "Why couldn’t the pony sing? It was a little horse!"}
else if Joke == 23 {SelectedJoke = "What do you call a penguin in the desert? Lost"}
else if Joke == 24 {SelectedJoke = "Where do sheep go to get a haircut? The Baa-baa shop"}
else if Joke == 25 {SelectedJoke = "Who tells the best jokes on the farm? The comedi-hen"}
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
    

           

struct Animal_Previews: PreviewProvider {
    static var previews: some View {
        Animal()
    }
}
