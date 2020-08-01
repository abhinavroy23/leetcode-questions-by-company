/*

Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

Example 1:

Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
 

Constraints:

Each string consists only of '0' or '1' characters.
1 <= a.length, b.length <= 10^4
Each string is either "0" or doesn't contain any leading zero.

*/

class Solution {
  func addBinary(_ a: String, _ b: String) -> String {

    let zero = Character("0")
    let one = Character("1")
    
    let first: [Character] = a.reversed()
    let second: [Character] = b.reversed()
    
    let aLength: Int = first.count
    let bLength: Int = second.count
    
    if aLength == 0 && bLength > 0 { return b } else if aLength > 0 && bLength == 0{ return a }
    
    let greater = aLength > bLength ? aLength : bLength
    
    var result: [Character] = [Character]()
    var carryOver: Character = zero
    
    for i in 0..<greater {
      let firstChar = i < first.count ? first[i] : "0"
      let secondChar = i < second.count ? second[i] : "0"
      if firstChar == zero && secondChar == zero {
        if carryOver == one {
          carryOver = zero
          result.append(one)
        } else {
          carryOver = zero
          result.append(zero)
        }
      }else if (firstChar == one && secondChar == zero) || (firstChar == zero && secondChar == one) {
        if carryOver == one {
          carryOver = one
          result.append(zero)
        } else {
          carryOver = zero
          result.append(one)
        }
      } else {
        if carryOver == one {
          carryOver = one
          result.append(one)
        } else {
          carryOver = one
          result.append(zero)
        }
      }
    }
    if carryOver == one {
      result.append(carryOver)
    }
    return String(result.reversed())
  }
}
