var starting_number = 999999999999999888
var current_number = starting_number
var previous_numbers: [Int] = []
var solved = false
var number_remainder = 0
var repeated_count = 0
var restart_new_number = false
var repeated_numbers: [Int: Int] = [:]
var mode: Int = 1 // 1 for highest number possible, 2 for sequence to 1

if mode == 1 {
    var starting_number = 20
} else {
    var starting_number = 999999999999999888
}

while !solved {
    // Restart the sequence with a new starting number
    if restart_new_number {
        current_number = starting_number
        restart_new_number = false
        previous_numbers = [] // Clear history
        print("Restarting with new starting number: \(current_number)")
        print("repated numbers list\(repeated_numbers)")
    }

    // Check if the number is even or odd
    number_remainder = current_number % 2

    if number_remainder == 0 {
        // Even number
        current_number /= 2
        print("Number is \(current_number) (even step)")
    } else {
        // Odd number
        current_number = current_number * 3 + 1
        print("Number is \(current_number) (odd step)")
    }

    // Check if the sequence is solved (e.g., number becomes 1)
    if current_number == 1 {
        solved = true
        print("Sequence solved!")
        break
    }

    // Add the current number to the list of previous numbers
    previous_numbers.insert(current_number, at: 0)
    if previous_numbers.count > 20000 {
        previous_numbers.removeLast() // Keep only the last 3 numbers
    }

    print("Previous numbers: \(previous_numbers)")

    // Check for repetition
    repeated_count = previous_numbers.filter { $0 == current_number }.count

    if repeated_count > 3 {
        starting_number += 1
        restart_new_number = true
        print("Repeated number detected. Incrementing starting number to \(starting_number).")
        print("repeated number \(current_number): \(repeated_count) times")
        repeated_numbers[current_number] = repeated_count
        break
    }
}

print("curent number: \(current_number), starting number: \(starting_number)")
print("repeatng numbers list\(repeated_numbers)")
