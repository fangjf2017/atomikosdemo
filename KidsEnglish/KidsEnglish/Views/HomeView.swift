import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Int = 0
    @State private var showWelcome = true

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color("skyBlue").opacity(0.3), Color("sunYellow").opacity(0.2)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            if showWelcome {
                WelcomeOverlayView(isShowing: $showWelcome)
            } else {
                TabView(selection: $selectedTab) {
                    StoryListView()
                        .tabItem {
                            Label("Stories", systemImage: "book.fill")
                        }
                        .tag(0)

                    AlphabetView()
                        .tabItem {
                            Label("ABC", systemImage: "abc")
                        }
                        .tag(1)
                }
                .accentColor(Color("appleRed"))
            }
        }
    }
}

struct WelcomeOverlayView: View {
    @Binding var isShowing: Bool
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0

    var body: some View {
        VStack(spacing: 30) {
            Text("📚")
                .font(.system(size: 100))
                .scaleEffect(scale)

            Text("Kids English")
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .foregroundColor(Color("appleRed"))
                .opacity(opacity)

            Text("Learn to Read & Have Fun!")
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .opacity(opacity)

            Button(action: {
                withAnimation(.easeOut(duration: 0.4)) {
                    isShowing = false
                }
            }) {
                Text("Let's Start! 🚀")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 18)
                    .background(
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [Color("appleRed"), Color("softOrange")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                    .shadow(color: Color("appleRed").opacity(0.4), radius: 10, y: 5)
            }
            .opacity(opacity)
            .scaleEffect(scale)
        }
        .padding()
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}
