import Foundation

struct AlphabetLetter: Identifiable {
    let id = UUID()
    let letter: String
    let emoji: String
    let word: String
    let sound: String
}

struct AlphabetData {
    static let letters: [AlphabetLetter] = [
        AlphabetLetter(letter: "A", emoji: "🍎", word: "Apple", sound: "ah"),
        AlphabetLetter(letter: "B", emoji: "🐝", word: "Bee", sound: "buh"),
        AlphabetLetter(letter: "C", emoji: "🐱", word: "Cat", sound: "kuh"),
        AlphabetLetter(letter: "D", emoji: "🐶", word: "Dog", sound: "duh"),
        AlphabetLetter(letter: "E", emoji: "🐘", word: "Elephant", sound: "eh"),
        AlphabetLetter(letter: "F", emoji: "🐸", word: "Frog", sound: "fuh"),
        AlphabetLetter(letter: "G", emoji: "🦒", word: "Giraffe", sound: "guh"),
        AlphabetLetter(letter: "H", emoji: "🐴", word: "Horse", sound: "huh"),
        AlphabetLetter(letter: "I", emoji: "🍦", word: "Ice cream", sound: "ih"),
        AlphabetLetter(letter: "J", emoji: "🃏", word: "Joker", sound: "juh"),
        AlphabetLetter(letter: "K", emoji: "🦘", word: "Kangaroo", sound: "kuh"),
        AlphabetLetter(letter: "L", emoji: "🦁", word: "Lion", sound: "luh"),
        AlphabetLetter(letter: "M", emoji: "🌙", word: "Moon", sound: "muh"),
        AlphabetLetter(letter: "N", emoji: "🐦", word: "Nest", sound: "nuh"),
        AlphabetLetter(letter: "O", emoji: "🐙", word: "Octopus", sound: "oh"),
        AlphabetLetter(letter: "P", emoji: "🐼", word: "Panda", sound: "puh"),
        AlphabetLetter(letter: "Q", emoji: "👸", word: "Queen", sound: "kwuh"),
        AlphabetLetter(letter: "R", emoji: "🌈", word: "Rainbow", sound: "ruh"),
        AlphabetLetter(letter: "S", emoji: "⭐", word: "Star", sound: "suh"),
        AlphabetLetter(letter: "T", emoji: "🐢", word: "Turtle", sound: "tuh"),
        AlphabetLetter(letter: "U", emoji: "☂️", word: "Umbrella", sound: "uh"),
        AlphabetLetter(letter: "V", emoji: "🌹", word: "Violet", sound: "vuh"),
        AlphabetLetter(letter: "W", emoji: "🐳", word: "Whale", sound: "wuh"),
        AlphabetLetter(letter: "X", emoji: "🎸", word: "Xylophone", sound: "zuh"),
        AlphabetLetter(letter: "Y", emoji: "🧶", word: "Yarn", sound: "yuh"),
        AlphabetLetter(letter: "Z", emoji: "🦓", word: "Zebra", sound: "zuh")
    ]
}
