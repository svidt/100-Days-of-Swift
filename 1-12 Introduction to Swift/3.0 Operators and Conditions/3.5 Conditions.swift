// Conditions are written using *if* statements. Here's an example of drawing two cards: if combined they equal *2* the program prints out "Aces - lucky!", if the combined amount is equal to *21* it says "Blackjack!", otherwise - any other combination returns "Regular cards".

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}
