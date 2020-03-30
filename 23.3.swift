protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable {
    func printSelf() { print(self) }
}

extension Int: SelfPrintable {}
extension String: SelfPrintable {}
extension Double: SelfPrintable {}

1024.printSelf()
3.14.printSelf()
"hana".printSelf()