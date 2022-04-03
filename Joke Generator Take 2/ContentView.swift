//
//  ContentView.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 9/30/20.
//

import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        controller.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
            self.presentationMode.wrappedValue.dismiss()
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

// var Category = "Blank"
let darkYellow = Color(red: 225.0/255.0, green: 173.0/255.0, blue: 1.0/255.0)

struct ContentView: View {
    var body: some View{
        NavigationView{
            ZStack{
                Color.yellow
                  .edgesIgnoringSafeArea(.all)
                VStack{
                        Text("Joke Generator")
                            .foregroundColor(Color.blue)
                            .font(Font.custom("SignPainter", size: 70))
                            .offset(x: 0, y: -25)
                            .multilineTextAlignment(.center)                   
                    ScrollView{
                        NavigationLink("Animal Jokes", destination: Animal())
                            .foregroundColor(Color.red)
                            .font(Font.custom("SignPainter", size: 40))
                            .padding()
                        NavigationLink("Bad Jokes", destination: BadJokes())
                            .foregroundColor(Color.red)
                            .font(Font.custom("SignPainter", size: 40))
                            .padding()
                        NavigationLink("Dad Jokes", destination: Dad())
                            .foregroundColor(Color.red)
                            .font(Font.custom("SignPainter", size: 40))
                            .padding()
                        NavigationLink("Funny Jokes", destination: Funny())
                            .foregroundColor(Color.red)
                            .font(Font.custom("SignPainter", size: 40))
                            .padding()
                        NavigationLink("Pick Up Lines", destination: PickUps())
                            .foregroundColor(Color.red)
                            .font(Font.custom("SignPainter", size: 40))
                            .padding()
                        NavigationLink("Your Submissions", destination: Users())
                            .foregroundColor(Color.red)
                            .font(Font.custom("SignPainter", size: 40))
                            .padding()
                        NavigationLink("Favorites", destination: Favorites())
                            .foregroundColor(Color.red)
                            .font(Font.custom("SignPainter", size: 40))
                            .padding()
                    }
                    
                        NavigationLink("Tell Us Your Joke!", destination: Submit())
                            .font(.headline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
