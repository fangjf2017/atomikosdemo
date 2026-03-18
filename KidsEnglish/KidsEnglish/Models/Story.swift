import Foundation

struct Story: Identifiable, Codable {
    let id: UUID
    let title: String
    let emoji: String
    let coverColor: String
    let pages: [StoryPage]
    let difficulty: Difficulty
    let ageRange: String

    enum Difficulty: String, Codable, CaseIterable {
        case beginner = "Beginner"
        case easy = "Easy"
        case medium = "Medium"
    }

    init(id: UUID = UUID(), title: String, emoji: String, coverColor: String, pages: [StoryPage], difficulty: Difficulty, ageRange: String) {
        self.id = id
        self.title = title
        self.emoji = emoji
        self.coverColor = coverColor
        self.pages = pages
        self.difficulty = difficulty
        self.ageRange = ageRange
    }
}

struct StoryPage: Identifiable, Codable {
    let id: UUID
    let illustration: String   // emoji-based illustration
    let text: String
    let highlightWords: [String]

    init(id: UUID = UUID(), illustration: String, text: String, highlightWords: [String] = []) {
        self.id = id
        self.illustration = illustration
        self.text = text
        self.highlightWords = highlightWords
    }
}
