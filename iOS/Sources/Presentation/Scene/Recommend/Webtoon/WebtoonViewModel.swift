import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class WebtoonViewModel: ViewModel, Stepper {

    var steps = PublishRelay<Step>()

    struct Input {
    }

    struct Output {
    }

    func transform(_ input: Input) -> Output {
        return Output()
    }
}
