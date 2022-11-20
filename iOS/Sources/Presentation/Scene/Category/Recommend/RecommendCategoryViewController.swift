import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class RecommendCategoryViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: RecommendCategoryViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()
    private let bookmark = PublishRelay<Int>()

    // MARK: - UI
    private let categoryTableView = UITableView().then {
        $0.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        $0.backgroundColor = .gray1
        $0.rowHeight = 110
        $0.separatorStyle = .none
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 추천")
        navigationController?.navigationBar.setBackButtonToArrow()
        viewAppear.accept(())
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Bind
    private func bind() {
        let input = RecommendCategoryViewModel.Input(
            viewAppear: viewAppear.asDriver(onErrorJustReturn: ()),
            index: categoryTableView.rx.itemSelected.asDriver(),
            bookmark: bookmark.asDriver(onErrorJustReturn: 0)
        )

        let output = viewModel.transform(input)

        output.subjectList.bind(to: categoryTableView.rx.items(
            cellIdentifier: "cell",
            cellType: CategoryTableViewCell.self
        )) { row, items, cell in
            cell.setData(items)
            var amount = items.amount

            cell.bookMarkButton.rx.tap
                .subscribe(onNext: {
                    self.bookmark.accept(row)
                    cell.bookMarkButton.isSelected.toggle()
                    if cell.bookMarkButton.isSelected {
                        amount += 1
                        cell.bookMarkTitle.text = "즐겨찾기 한 사람: \(amount)"
                    } else {
                        amount -= 1
                        cell.bookMarkTitle.text = "즐겨찾기 한 사람: \(amount)"
                    }
                })
                .disposed(by: cell.disposeBag)
        }
        .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension RecommendCategoryViewController {
    private func addSubviews() {
        view.addSubview(categoryTableView)
    }
    private func makeSubviewConstraints() {
        categoryTableView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).inset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
