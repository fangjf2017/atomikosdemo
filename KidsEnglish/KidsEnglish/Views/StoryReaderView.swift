import SwiftUI

struct StoryReaderView: View {
    let story: Story
    @Environment(\.dismiss) var dismiss
    @State private var currentPage = 0
    @State private var isAnimating = false
    @State private var showCelebration = false
    @State private var slideOffset: CGFloat = 0

    var currentPageData: StoryPage { story.pages[currentPage] }
    var isLastPage: Bool { currentPage == story.pages.count - 1 }

    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color(story.coverColor).opacity(0.2), Color.white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(Color(story.coverColor).opacity(0.8))
                    }

                    Spacer()

                    // Page indicator
                    Text("\(currentPage + 1) / \(story.pages.count)")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(Color(story.coverColor))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(story.coverColor).opacity(0.15))
                        .cornerRadius(20)

                    Spacer()

                    // Star rating placeholder
                    HStack(spacing: 2) {
                        ForEach(0..<3) { i in
                            Image(systemName: i < starsForProgress ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.system(size: 20))
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 8)

                // Progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(story.coverColor).opacity(0.15))
                            .frame(height: 8)

                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(story.coverColor))
                            .frame(width: geo.size.width * CGFloat(currentPage + 1) / CGFloat(story.pages.count), height: 8)
                            .animation(.spring(), value: currentPage)
                    }
                }
                .frame(height: 8)
                .padding(.horizontal, 20)

                Spacer()

                // Page content
                VStack(spacing: 24) {
                    // Illustration
                    Text(currentPageData.illustration)
                        .font(.system(size: 90))
                        .frame(maxWidth: .infinity)
                        .frame(height: 160)
                        .background(Color(story.coverColor).opacity(0.1))
                        .cornerRadius(30)
                        .padding(.horizontal, 20)
                        .scaleEffect(isAnimating ? 1.05 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isAnimating)

                    // Story text with highlighted words
                    HighlightedTextView(
                        text: currentPageData.text,
                        highlights: currentPageData.highlightWords,
                        highlightColor: Color(story.coverColor)
                    )
                    .padding(.horizontal, 30)
                }
                .offset(x: slideOffset)

                Spacer()

                // Navigation buttons
                HStack(spacing: 20) {
                    if currentPage > 0 {
                        Button(action: goToPreviousPage) {
                            HStack(spacing: 8) {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(Color(story.coverColor))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 16)
                            .background(Color(story.coverColor).opacity(0.15))
                            .cornerRadius(30)
                        }
                    }

                    Spacer()

                    Button(action: goToNextPage) {
                        HStack(spacing: 8) {
                            Text(isLastPage ? "Finish 🎉" : "Next")
                            if !isLastPage {
                                Image(systemName: "arrow.right")
                            }
                        }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 36)
                        .padding(.vertical, 16)
                        .background(
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(story.coverColor), Color(story.coverColor).opacity(0.7)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        )
                        .shadow(color: Color(story.coverColor).opacity(0.4), radius: 8, y: 4)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }

            // Celebration overlay
            if showCelebration {
                CelebrationView {
                    dismiss()
                }
            }
        }
        .onAppear {
            isAnimating = true
        }
    }

    var starsForProgress: Int {
        let ratio = Double(currentPage + 1) / Double(story.pages.count)
        if ratio >= 1.0 { return 3 }
        if ratio >= 0.5 { return 2 }
        return 1
    }

    func goToNextPage() {
        if isLastPage {
            withAnimation(.spring()) {
                showCelebration = true
            }
        } else {
            withAnimation(.easeInOut(duration: 0.3)) {
                slideOffset = -UIScreen.main.bounds.width
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                currentPage += 1
                slideOffset = UIScreen.main.bounds.width
                withAnimation(.easeInOut(duration: 0.3)) {
                    slideOffset = 0
                }
            }
        }
    }

    func goToPreviousPage() {
        withAnimation(.easeInOut(duration: 0.3)) {
            slideOffset = UIScreen.main.bounds.width
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            currentPage -= 1
            slideOffset = -UIScreen.main.bounds.width
            withAnimation(.easeInOut(duration: 0.3)) {
                slideOffset = 0
            }
        }
    }
}

struct HighlightedTextView: View {
    let text: String
    let highlights: [String]
    let highlightColor: Color

    var body: some View {
        let words = text.components(separatedBy: " ")

        return FlowLayout(spacing: 8) {
            ForEach(Array(words.enumerated()), id: \.offset) { _, word in
                let cleanWord = word.trimmingCharacters(in: .punctuationCharacters)
                let isHighlighted = highlights.contains(cleanWord) ||
                    highlights.contains(word.trimmingCharacters(in: .punctuationCharacters))

                Text(word + " ")
                    .font(.system(size: 28, weight: isHighlighted ? .bold : .regular, design: .rounded))
                    .foregroundColor(isHighlighted ? highlightColor : .primary)
                    .padding(.horizontal, isHighlighted ? 4 : 0)
                    .padding(.vertical, isHighlighted ? 2 : 0)
                    .background(
                        isHighlighted ?
                        RoundedRectangle(cornerRadius: 6)
                            .fill(highlightColor.opacity(0.15)) : nil
                    )
            }
        }
        .multilineTextAlignment(.center)
    }
}

struct FlowLayout: Layout {
    let spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var height: CGFloat = 0
        var currentX: CGFloat = 0
        var currentRowHeight: CGFloat = 0
        var rowCount = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > maxWidth && currentX > 0 {
                height += currentRowHeight + spacing
                currentX = 0
                currentRowHeight = 0
                rowCount += 1
            }
            currentX += size.width + spacing
            currentRowHeight = max(currentRowHeight, size.height)
        }
        height += currentRowHeight

        return CGSize(width: maxWidth, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let maxWidth = bounds.width
        var currentX = bounds.minX
        var currentY = bounds.minY
        var currentRowHeight: CGFloat = 0
        var rowItems: [(subview: LayoutSubview, size: CGSize, x: CGFloat)] = []

        func placeRow() {
            let totalRowWidth = rowItems.last.map { $0.x + $0.size.width - bounds.minX } ?? 0
            let startX = bounds.minX + (maxWidth - totalRowWidth) / 2
            for item in rowItems {
                item.subview.place(
                    at: CGPoint(x: startX + item.x - bounds.minX, y: currentY),
                    proposal: ProposedViewSize(item.size)
                )
            }
        }

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > bounds.maxX && !rowItems.isEmpty {
                placeRow()
                currentY += currentRowHeight + spacing
                currentX = bounds.minX
                currentRowHeight = 0
                rowItems.removeAll()
            }
            rowItems.append((subview, size, currentX))
            currentX += size.width + spacing
            currentRowHeight = max(currentRowHeight, size.height)
        }
        placeRow()
    }
}

struct CelebrationView: View {
    let onDismiss: () -> Void
    @State private var scale: CGFloat = 0.3
    @State private var confettiOpacity: Double = 1.0

    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()

            VStack(spacing: 24) {
                Text("🎉🌟🎊")
                    .font(.system(size: 80))
                    .scaleEffect(scale)

                Text("Great Job!")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(Color("appleRed"))

                Text("You finished the story!")
                    .font(.system(size: 22, design: .rounded))
                    .foregroundColor(.gray)

                HStack(spacing: 16) {
                    Button(action: onDismiss) {
                        Text("Back to Stories 📚")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 16)
                            .background(
                                Capsule()
                                    .fill(LinearGradient(
                                        colors: [Color("appleRed"), Color("softOrange")],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    ))
                            )
                            .shadow(color: Color("appleRed").opacity(0.4), radius: 8, y: 4)
                    }
                }
            }
            .padding(40)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 30)
            .scaleEffect(scale)
        }
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                scale = 1.0
            }
        }
    }
}
