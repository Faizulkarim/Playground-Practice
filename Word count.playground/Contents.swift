func canFormWord(_ availableLetters:[Character],_ word:String ) -> Int {
    let wordLenght = word.count
    let availableLettersCount = availableLetters.count

    if availableLettersCount < wordLenght || availableLettersCount > 102 || wordLenght < 4 || wordLenght > 102 {
        return -1
    }

    var letterCounts = [Character: Int]()
    for letter in availableLetters {
        letterCounts[letter,default: 0] += 1
    }

    for char in word {
        if let count = letterCounts[char], count > 0 {
            letterCounts[char] = count - 1
        }else {
            return 0
        }
    }
    return 1
}
