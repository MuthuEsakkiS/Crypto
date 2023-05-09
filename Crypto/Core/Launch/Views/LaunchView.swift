import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = [".", ".", "."]
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loop: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launchTheme.background
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        Text("Loading your portfolio ")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.launchTheme.accent)
                        
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.launchTheme.accent)
                                .opacity(counter == index ? 1 : 0)
                            
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loop += 1
                    
                    if loop > 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
