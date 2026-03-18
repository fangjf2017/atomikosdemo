import SwiftUI

struct StoryListView: View {
    let stories = StoryData.stories
    @State private var selectedStory: Story?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    VStack(spacing: 8) {
                        Text("📖 Story Time!")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(Color("appleRed"))

                        Text("Pick a story to read")
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 20)

                    // Story grid
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(stories) { story in
                            StoryCardView(story: story) {
                                selectedStory = story
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30)
                }
            }
            .background(
                LinearGradient(
                    colors: [Color("skyBlue").opacity(0.1), Color.white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            .navigationBarHidden(true)
            .fullScreenCover(item: $selectedStory) { story in
                StoryReaderView(story: story)
            }
        }
    }
}

struct StoryCardView: View {
    let story: Story
    let onTap: () -> Void

    @State private var isPressed = false

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                // Cover illustration
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(story.coverColor).opacity(0.25))
                        .frame(height: 120)

                    Text(story.emoji)
                        .font(.system(size: 60))
                }

                // Story info
                VStack(spacing: 4) {
                    Text(story.title)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)

                    Text("\(story.pages.count) pages • \(story.difficulty.rawValue)")
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color(story.coverColor).opacity(0.3), radius: 8, y: 4)
            .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.easeInOut(duration: 0.1)) { isPressed = true }
                }
                .onEnded { _ in
                    withAnimation(.easeInOut(duration: 0.1)) { isPressed = false }
                }
        )
    }
}
