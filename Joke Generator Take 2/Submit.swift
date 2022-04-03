//
//  Submit.swift
//  Joke Generator Take 2
//
//  Created by Alex Murphy on 12/17/20.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

struct Submit: View {
    @State var showSafari = false
    @State var urlString = "https://forms.gle/XfyCe2Kud6NSazFD6"
    @State var urlString1 = "https://docs.google.com/forms/d/e/1FAIpQLSeQxA0bCB43AgMAKzvsU_bM3dxaxUPUQsQ_AVkARGCQXldhAw/viewform?usp=sf_link"
    var body: some View {
        ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            ScrollView{
            VStack{
                Text("Submit Your Own Jokes!")
                    .foregroundColor(Color.blue)
                    .font(Font.custom("SignPainter", size: 47))
                    .scaledToFit()
                    .padding([.top, .bottom])
                Spacer()
                Text("Email generatingjokes@gmail.com")
                    .foregroundColor(Color.red)
                    .font(Font.custom("Noteworthy", size: 28))
                Text("Please Identify yourself by any of the following:   \n     - first name and last initial, \n     - first name, \n     - anonymous")
                    .foregroundColor(Color.red)
                    .font(Font.custom("Bradley Hand", size: 20))
                Spacer()
                Text("Or tap the button below!")
                    .foregroundColor(Color.red)
                    .font(Font.custom("Bradley Hand", size: 30))
                Button(action: {self.showSafari = true}) {
                    ZStack{
                    Image(systemName: "rectangle.fill")
                        .resizable()
                        .frame(width: 150, height: 40, alignment: .center)
                        .foregroundColor(darkYellow)
                    Text("Tap Here!")
                        .foregroundColor(Color.red)
                     .font(Font.custom("Bradley Hand", size: 30))
                    }
                     .sheet(isPresented: $showSafari) {
                     SafariView(url: URL(string: self.urlString)!)
                          }
                }
        /*        Text("Complaints or Bugs?")
                    .foregroundColor(Color.red)
                    .font(Font.custom("Bradley Hand", size: 30))
                Button(action: {self.showSafari = true}) {
                    ZStack{
                    Image(systemName: "rectangle.fill")
                        .resizable()
                        .frame(width: 150, height: 40, alignment: .center)
                        .foregroundColor(darkYellow)
                    Text("Tap Here!")
                        .foregroundColor(Color.red)
                     .font(Font.custom("Bradley Hand", size: 30))
                    }
                     .sheet(isPresented: $showSafari) {
                     SafariView(url: URL(string: self.urlString1)!)
                          }
                }
 */
            }
                
            }
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
