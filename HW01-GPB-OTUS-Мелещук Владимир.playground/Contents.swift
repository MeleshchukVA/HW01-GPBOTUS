// Сгенерировать массив случайных чисел (например 200 чисел).
// Найти индекс первого повторяющегося числа в массиве.
// Если все числа разные - то -1.
// Пример : [3, 4, 5, 6, 8, 78, 67, 4, 88] - 4, индекс 1

import UIKit

extension Collection where Element: Hashable {
    
    // Функция ищет индекс первого повторяющегося числа.
    func indexOfFirstRepeated() -> Index? {
        // Индекс первого повторяющегося элемента.
        var result: Index?
        // Словарь, чтобы отследить, когда каждый элемент был впервые встречен в коллекции.
        var firstOccurrencesDict: [Element: Index] = [:]
        
        for (index, element) in zip(indices, self) {
            // Найти первое появление этого значения, если таковое имеется.
            if let firstOccurrenceValue = firstOccurrencesDict[element] {
                // Если мы нашли этот элемент ранее, проверим, не находили ли мы уже другой повторяющийся элемент.
                if let previousLowestIndex = result {
                    // Если нашли, проверим, произошло ли первое появление этого элемента до первого появления ранее обнаруженного повторяющегося элемента.
                    if firstOccurrenceValue < previousLowestIndex {
                        result = firstOccurrenceValue
                    }
                } else {
                    // Иначе предыдущий повторяющийся элемент не найден, так что это наш первый найденный повторяющийся элемент.
                    result = firstOccurrenceValue
                }
            } else {
                // Если мы попали сюда, то это первый раз, когда мы видим этот элемент, поэтому записываем индекс этого первого появления.
                firstOccurrencesDict[element] = index
            }
        }
        
        return result
    }
}


// Функция генерирует массив случайных чисел в диапазоне от 1 до 25.
// Количество элементов задаем самостоятельно.
func createRandomArray(_ n: Int) -> [Int] {
    return (0..<n).map { _ in Int.random(in: 1 ... 25) }
}

// Создаем массив из 200 случайных чисел.
let randomArray = createRandomArray(200)

if let index = randomArray.indexOfFirstRepeated() {
    print(index)
} else {
    // Если все числа в массиве разные, то выводим в консоль -1.
    print("-1")
}
