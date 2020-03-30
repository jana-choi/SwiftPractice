protocol Receiveable {
    func received(data: Any, from: Sendable)
}

extension Receiveable {
    func received(data: Any, from: Sendable) {
        print("\(self) received \(data) from \(from)")
    }
}

protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    func send(data: Any)
    static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable {
    var from: Sendable { return self }

    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }

    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Message: Sendable, Receiveable {
    var to: Receiveable?
}

class Mail: Sendable, Receiveable {
    var to: Receiveable?
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

print(Message.isSendableInstance("Hello"))
print(Message.isSendableInstance(myPhoneMessage))
print(Message.isSendableInstance(yourPhoneMessage))
print(Mail.isSendableInstance(myPhoneMessage))
print(Mail.isSendableInstance(myMail))