import Foundation

struct StoryData {
    static let stories: [Story] = [
        Story(
            title: "The Happy Sun",
            emoji: "☀️",
            coverColor: "sunYellow",
            pages: [
                StoryPage(
                    illustration: "☀️🌤️",
                    text: "The sun is big and bright.",
                    highlightWords: ["sun", "big", "bright"]
                ),
                StoryPage(
                    illustration: "🌻🌸🌺",
                    text: "The flowers love the sun.",
                    highlightWords: ["flowers", "love", "sun"]
                ),
                StoryPage(
                    illustration: "🐝🦋🌼",
                    text: "Bees and butterflies play in the sun.",
                    highlightWords: ["Bees", "butterflies", "play"]
                ),
                StoryPage(
                    illustration: "😊🌈☀️",
                    text: "The sun makes us happy!",
                    highlightWords: ["sun", "happy"]
                )
            ],
            difficulty: .beginner,
            ageRange: "3-5"
        ),
        Story(
            title: "My Little Cat",
            emoji: "🐱",
            coverColor: "softOrange",
            pages: [
                StoryPage(
                    illustration: "🐱🏠",
                    text: "I have a little cat.",
                    highlightWords: ["little", "cat"]
                ),
                StoryPage(
                    illustration: "🐱😴",
                    text: "My cat likes to sleep.",
                    highlightWords: ["cat", "sleep"]
                ),
                StoryPage(
                    illustration: "🐱🧶",
                    text: "My cat plays with a ball.",
                    highlightWords: ["cat", "plays", "ball"]
                ),
                StoryPage(
                    illustration: "🐱🥛",
                    text: "My cat drinks milk.",
                    highlightWords: ["cat", "drinks", "milk"]
                ),
                StoryPage(
                    illustration: "🐱❤️👦",
                    text: "I love my cat!",
                    highlightWords: ["love", "cat"]
                )
            ],
            difficulty: .beginner,
            ageRange: "3-5"
        ),
        Story(
            title: "The Red Apple",
            emoji: "🍎",
            coverColor: "appleRed",
            pages: [
                StoryPage(
                    illustration: "🌳🍎🍎🍎",
                    text: "There is a big apple tree.",
                    highlightWords: ["big", "apple", "tree"]
                ),
                StoryPage(
                    illustration: "🍎❤️",
                    text: "The apples are red.",
                    highlightWords: ["apples", "red"]
                ),
                StoryPage(
                    illustration: "👦🍎😋",
                    text: "Tom picks a big red apple.",
                    highlightWords: ["picks", "big", "red", "apple"]
                ),
                StoryPage(
                    illustration: "😋🍎",
                    text: "The apple is sweet and yummy!",
                    highlightWords: ["sweet", "yummy"]
                )
            ],
            difficulty: .beginner,
            ageRange: "3-5"
        ),
        Story(
            title: "A Rainy Day",
            emoji: "🌧️",
            coverColor: "skyBlue",
            pages: [
                StoryPage(
                    illustration: "🌧️🌂",
                    text: "Today it is raining.",
                    highlightWords: ["Today", "raining"]
                ),
                StoryPage(
                    illustration: "💧💧💧",
                    text: "I can see the raindrops.",
                    highlightWords: ["see", "raindrops"]
                ),
                StoryPage(
                    illustration: "👟💦😄",
                    text: "I like to jump in puddles!",
                    highlightWords: ["jump", "puddles"]
                ),
                StoryPage(
                    illustration: "🌈☀️🌧️",
                    text: "After the rain comes a rainbow.",
                    highlightWords: ["After", "rain", "rainbow"]
                ),
                StoryPage(
                    illustration: "🌈😍",
                    text: "The rainbow is so beautiful!",
                    highlightWords: ["rainbow", "beautiful"]
                )
            ],
            difficulty: .easy,
            ageRange: "3-5"
        ),
        Story(
            title: "Farm Animals",
            emoji: "🐄",
            coverColor: "grassGreen",
            pages: [
                StoryPage(
                    illustration: "🌾🐄🐑🐔",
                    text: "Come to the farm!",
                    highlightWords: ["farm"]
                ),
                StoryPage(
                    illustration: "🐄",
                    text: "The cow says MOO!",
                    highlightWords: ["cow", "MOO"]
                ),
                StoryPage(
                    illustration: "🐑",
                    text: "The sheep says BAA!",
                    highlightWords: ["sheep", "BAA"]
                ),
                StoryPage(
                    illustration: "🐔",
                    text: "The hen says CLUCK CLUCK!",
                    highlightWords: ["hen", "CLUCK"]
                ),
                StoryPage(
                    illustration: "🐷",
                    text: "The pig says OINK OINK!",
                    highlightWords: ["pig", "OINK"]
                ),
                StoryPage(
                    illustration: "🌾❤️🐄🐑🐔🐷",
                    text: "We love all the farm animals!",
                    highlightWords: ["love", "farm", "animals"]
                )
            ],
            difficulty: .easy,
            ageRange: "3-5"
        ),
        Story(
            title: "Colors of the World",
            emoji: "🎨",
            coverColor: "purpleDream",
            pages: [
                StoryPage(
                    illustration: "🎨🌈",
                    text: "The world is full of colors!",
                    highlightWords: ["world", "colors"]
                ),
                StoryPage(
                    illustration: "🔴❤️🍎",
                    text: "Red is the color of apples.",
                    highlightWords: ["Red", "color", "apples"]
                ),
                StoryPage(
                    illustration: "💛🌟🍌",
                    text: "Yellow is the color of bananas.",
                    highlightWords: ["Yellow", "color", "bananas"]
                ),
                StoryPage(
                    illustration: "💚🌿🍃",
                    text: "Green is the color of leaves.",
                    highlightWords: ["Green", "color", "leaves"]
                ),
                StoryPage(
                    illustration: "💙🌊🌀",
                    text: "Blue is the color of the sky.",
                    highlightWords: ["Blue", "color", "sky"]
                ),
                StoryPage(
                    illustration: "🎨😊🌈",
                    text: "Colors make our world beautiful!",
                    highlightWords: ["Colors", "beautiful"]
                )
            ],
            difficulty: .easy,
            ageRange: "3-5"
        )
    ]
}
