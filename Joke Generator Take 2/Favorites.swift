//
//  Favorites.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/13/20.
//

import SwiftUI

struct Favorites: View {
    @State var StatusUpdate = "heart"
    @State var Saved = Bool()
    //@State var SelectedJoke = UserDefaults.standard.string(forKey: "Favorites")
    @State var isShareSheetShowing = false
    @State var numb = 0
    @State var SelectedJoke = "Welcome to the your favorites! If you've marked any favorite jokes, push the button. If not, go find a favorite."
    var body: some View {
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.top)
            VStack{
                Text("Favorites")
                    .foregroundColor(Color.blue)
                    .font(Font.custom("SignPainter", size: 60))
                    .padding(.top, 50)
                Spacer()
                Text("\(SelectedJoke)" )
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.75)
                    .foregroundColor(Color.purple)
                    .font(Font.custom("Noteworthy", size: 25))
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
                Button(action: {favs()} ){
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
    
    func favs(){
        for SelectJoke in LovedJokes.shuffled() {
            SelectedJoke = SelectJoke
            Status()
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
