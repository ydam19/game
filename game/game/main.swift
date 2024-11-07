//
//  main.swift
//  game
//
//  Created by 김예담의 Mac on 11/6/24.
//

import Foundation

// 정답 숫자 생성
func randomNumber() -> Int {
    let num = (1...9).shuffled().prefix(3)
    return num.reduce(0) { $0 * 10 + $1 } // 초기값을 0으로 설정한 뒤 0 * 10 + 숫자 형태로 계속 증가 시킴
}

let answer = randomNumber()


// 사용자 입력 받기
print("숫자를 입력하세요 : ")
if let input = readLine(), input.count == 3 {
    let inputSet = Set(input) // 입력된 숫자를 Set으로 변환하여 중복 제거
    if inputSet.count < input.count {
        print("중복된 숫자가 있습니다.")
    } else {

        var strike = 0
        var ball = 0
        
        // 정답과 입력값 비교
        let answernum = Array(String(answer)) // 정답 숫자를 문자 배열로 변환
        let inputnum = Array(input) // 입력값을 문자 배열로 변환
        
        for (index, numb) in inputnum.enumerated() {
            if numb == answernum[index] {
                strike += 1 // 같은 자리에 같은 숫자가 있으면 스트라이크 증가
            } else if answernum.contains(numb) {
                ball += 1 // 다른 자리에 같은 숫자가 있으면 볼 증가
            }
        }
        
        // 결과 출력
        print("정답 : \(answer)")
                if strike == 3 {
                    print("정답입니다!") // 스트라이크가 3일 경우 정답 메시지 출력
                } else if strike == 0 && ball == 0 {
                    print("nothing") // 다른 자리에도 같은 숫자가 없으면 nothing 출력
                } else {
                    print("\(strike) 스트라이크, \(ball) 볼")
                }
            }
} else {
    print("올바른 형식이 아닙니다.")
}
