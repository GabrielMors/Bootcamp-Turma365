// MARK: Interface Segregation Principle (ISP) (Princípio da Segregação da Interface)

// Muitas interfaces específicas são melhores do que uma interface única.

import Foundation

protocol Worker {
    func work()
}

protocol MeetingAttender {
    func attendMeeting()
}

protocol Coder {
    func writeCode()
}

protocol Desing {
    func createDesign()
}

class Manager: Worker, MeetingAttender {
    func work() {}
    func attendMeeting() {}
}

class Developer: Worker, MeetingAttender, Coder {
    func work() {}
    func attendMeeting() {}
    func writeCode() {}
}

class Designer: Worker, MeetingAttender, Desing {
    func work() {}
    func attendMeeting() {}
    func createDesign() {}
}


let manager = Manager()
manager.work()
manager.attendMeeting()

let programer = Developer()
programer.work()
programer.attendMeeting()
programer.writeCode()

let designer = Designer()
designer.work()
designer.attendMeeting()
designer.createDesign()
