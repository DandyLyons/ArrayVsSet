//
//  main.swift
//  ArrayVsSet
//
//  Created by Daniel Lyons on 2024-09-17.
//

import ArrayVsSet
import CollectionsBenchmark

var benchmark = Benchmark(title: "ArrayVsSet Benchmark")

benchmark.addSimple(
    title: "Array<Int> init",
    input: Int.self
) { input in
    blackHole(Array(0..<input))
}

benchmark.addSimple(
    title: "Set<Int> init",
    input: Int.self
) { input in
    blackHole(Set(0..<input))
}

benchmark.add(
    title: "Array<Int> append",
    input: Int.self
) { input in
    return { timer in
        var array = Array<Int>()
        timer.measure {
            for i in 0..<input {
                array.append(i)
            }
        }
        blackHole(array)
    }
}

benchmark.addSimple(
    title: "Array<Int> insert at 0",
    input: [Int].self
) { input in
    var array = Array<Int>()
    for i in input {
        _ = array.insert(i, at: 0)
    }
    blackHole(array)
}

benchmark.add(
    title: "Set<Int> insert",
    input: Int.self
) { input in
    return { timer in
        var set = Set<Int>()
        timer.measure {
            for i in 0..<input {
                set.insert(i)
            }
        }
        blackHole(set)
    }
}

benchmark.add(
    title: "Array<Int> removeLast",
    input: Int.self
) { input in
    return { timer in
        var array = Array<Int>(0..<input)
        timer.measure {
            for _ in 0..<input {
                array.removeLast()
            }
        }
        precondition(array.isEmpty, "Array<Int> should be empty after all removals.")
        blackHole(array)
    }
}

benchmark.add(
    title: "Array<Int> removeFirst",
    input: Int.self
) { input in
    return { timer in
        var array = Array<Int>(0..<input)
        timer.measure {
            for _ in 0..<input {
                array.removeFirst()
            }
        }
        precondition(array.isEmpty, "Array<Int> should be empty after all removals.")
        blackHole(array)
    }
}

benchmark.add(
    title: "Set<Int> remove",
    input: ([Int], [Int]).self
) { input, removals in
    return { timer in
        var set = Set<Int>(input)
        timer.measure {
            for i in removals {
                set.remove(i)
            }
        }
        precondition(set.isEmpty, "Set<Int> should be empty after all removals.")
        blackHole(set)
    }
}


benchmark.main()
