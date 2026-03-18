import SwiftUI

struct AlphabetView: View {
    let letters = AlphabetData.letters
    @State private var selectedLetter: AlphabetLetter?

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    VStack(spacing: 8) {
                        Text("🔤 The Alphabet")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(Color("purpleDream"))

                        Text("Tap a letter to learn it!")
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 20)

                    // Alphabet grid
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(letters) { letter in
                            AlphabetCardView(letter: letter) {
                                selectedLetter = letter
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30)
                }
            }
            .background(
                LinearGradient(
                    colors: [Color("purpleDream").opacity(0.1), Color.white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            .navigationBarHidden(true)
            .sheet(item: $selectedLetter) { letter in
                LetterDetailView(letter: letter)
            }
        }
    }
}

struct AlphabetCardView: View {
    let letter: AlphabetLetter
    let onTap: () -> Void

    @State private var isPressed = false

    // Cycle through colors
    var cardColor: Color {
        let colors: [Color] = [
            Color("appleRed"), Color("softOrange"), Color("sunYellow"),
            Color("grassGreen"), Color("skyBlue"), Color("purpleDream")
        ]
        let index = letter.letter.unicodeScalars.first.map { Int($0.value) - 65 } ?? 0
        return colors[index % colors.count]
    }

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                Text(letter.letter)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(cardColor)

                Text(letter.emoji)
                    .font(.system(size: 24))

                Text(letter.word)
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(cardColor.opacity(0.12))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(cardColor.opacity(0.3), lineWidth: 1.5)
            )
            .scaleEffect(isPressed ? 0.92 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.easeInOut(duration: 0.1)) { isPressed = true }
                }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) { isPressed = false }
                }
        )
    }
}

struct LetterDetailView: View {
    let letter: AlphabetLetter
    @Environment(\.dismiss) var dismiss
    @State private var bouncing = false
    @State private var showWord = false

    var cardColor: Color {
        let colors: [Color] = [
            Color("appleRed"), Color("softOrange"), Color("sunYellow"),
            Color("grassGreen"), Color("skyBlue"), Color("purpleDream")
        ]
        let index = letter.letter.unicodeScalars.first.map { Int($0.value) - 65 } ?? 0
        return colors[index % colors.count]
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [cardColor.opacity(0.2), Color.white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                // Close button
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(cardColor.opacity(0.7))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)

                Spacer()

                // Big letter
                Text(letter.letter)
                    .font(.system(size: 150, weight: .bold, design: .rounded))
                    .foregroundColor(cardColor)
                    .shadow(color: cardColor.opacity(0.3), radius: 10, y: 5)
                    .scaleEffect(bouncing ? 1.1 : 1.0)
                    .animation(.spring(response: 0.4, dampingFraction: 0.4).repeatCount(3), value: bouncing)

                // Big emoji
                Text(letter.emoji)
                    .font(.system(size: 100))
                    .scaleEffect(showWord ? 1.0 : 0.1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6).delay(0.3), value: showWord)

                // Word
                VStack(spacing: 6) {
                    Text(letter.word)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(cardColor)

                    Text("Sounds like: \"\(letter.sound)\"")
                        .font(.system(size: 18, design: .rounded))
                        .foregroundColor(.secondary)
                }
                .opacity(showWord ? 1 : 0)
                .offset(y: showWord ? 0 : 20)
                .animation(.easeOut(duration: 0.4).delay(0.5), value: showWord)

                // Lowercase
                HStack(spacing: 24) {
                    VStack(spacing: 4) {
                        Text("Uppercase")
                            .font(.system(size: 14, design: .rounded))
                            .foregroundColor(.secondary)
                        Text(letter.letter)
                            .font(.system(size: 60, weight: .bold, design: .rounded))
                            .foregroundColor(cardColor)
                    }

                    Text("•")
                        .font(.system(size: 30))
                        .foregroundColor(cardColor.opacity(0.4))

                    VStack(spacing: 4) {
                        Text("Lowercase")
                            .font(.system(size: 14, design: .rounded))
                            .foregroundColor(.secondary)
                        Text(letter.letter.lowercased())
                            .font(.system(size: 60, weight: .bold, design: .rounded))
                            .foregroundColor(cardColor.opacity(0.7))
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 40)
                .background(cardColor.opacity(0.1))
                .cornerRadius(20)

                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                bouncing = true
                showWord = true
            }
        }
    }
}
