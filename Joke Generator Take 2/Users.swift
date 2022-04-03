//
//  Users.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/17/20.
//

import SwiftUI

struct Users: View {
    @State var StatusUpdate = "heart"
    @State var Saved = Bool()
    @State var JokesTold = [0]
    @State var isShareSheetShowing = false
    @State var Joke = Int.random(in: 1 ... 3)
    @State var SelectedJoke = "I want to get Chinese symbols tattoed on my arm, saying 'I don't know, I don't speak Chinese'. And when someone asks..."
    @State var User = "- Alex M"
    var body: some View{
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.all)
        VStack{
            Text("Your Jokes")
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
            Text("\(self.User)")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.purple)
                .font(Font.custom("Noteworthy", size: 20))
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
            Button(action: {self.YourJoke()} ){
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
    
    func YourJoke(){
        self.Joke = Int.random(in: 1 ... 9)
        if Joke == 1 {SelectedJoke = "What do you get when you cross a fruit with a Gazelle? \n A Cantaloupe!"
            User = "- Eyram G."}
        else if Joke == 2 {SelectedJoke = "Why did the monkey fall out of the tree? \n Because it was dead!"
            User = "- Eyram G."}
        else if Joke == 3 {SelectedJoke = "What's the best thing about Switzerland? I don't know, but the flag is a big plus!"
            User = "- Anonymous"}
        else if Joke == 4 {SelectedJoke = "What's an astronaut's favorite computer part? The space bar!"
            User = "- Anonymous"}
        else if Joke == 5 {SelectedJoke = "Today at the bank an old lady asked me to check her balance. So I pushed her over!"
            User = "- Anonymous"}
        else if Joke == 6 {SelectedJoke = "What do you get when you cross the Atlantic ocean and the Titanic? Halfway"
            User = "- Anonymous"}
        else if Joke == 7 {SelectedJoke = "Harry Potter can't tell the difference between his cooking pot and his best mate. They're both cauldron!"
            User = "- Anonymous"}
        else if Joke == 8 {SelectedJoke = "What's worse than an insult from a leprechaun? A burn from a dragon!"
            User = "- Anonymous"}
        else if Joke == 9 {SelectedJoke = "Grandma asks her grandson: \n 'Hey sweetie, what’s the name of that German guy that goes around my house hiding all my stuff?' \n 'Alzheimer grandma, Alzheimer!'"
            User = "- Anonymous"}
        else if Joke == 10 {SelectedJoke = "The other day I put my grandma on speed dial and now call her... \n 'Insta-gram!'"
            User = "- Anonymous"}
        else if Joke == 11 {SelectedJoke = "Why did Mickey Mouse go to space? \n To look for Pluto"
            User = "- Lizzie M."}
        Status()
        }
    
    func Repeats() {
    if (JokesTold.contains(1) && JokesTold.contains(2) && JokesTold.contains(3) && JokesTold.contains(4) && JokesTold.contains(5) && JokesTold.contains(6) && JokesTold.contains(7) && JokesTold.contains(8)) {JokesTold.removeLast(8)}
        repeat {self.Joke = Int.random(in: 1 ... 8)} while JokesTold.contains(Joke)
    JokesTold.append(Joke)
    print(JokesTold)
    }
    
    func shareButton() {
        isShareSheetShowing = true
        let ShareJoke = Text("Look what I found on Joke generator! \(SelectedJoke) \(User)")
        let av = UIActivityViewController(activityItems: [ShareJoke], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        Users()
    }
}
