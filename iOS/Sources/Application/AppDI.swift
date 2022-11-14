import Foundation

struct AppDI {
    let onboardingViewController: OnboardingViewController
    let categoryViewController: CategoryViewController
    let editProfileViewController: EditProfileViewController
    let newsViewController: NewsViewController
    let lottoViewController: LottoViewController
    let mainViewController: MainViewController
    let myPageViewController: MyPageViewController
    let bookViewController: BookViewController
    let characterViewController: CharacterViewController
    let flowerViewController: FlowerViewController
    let fortuneViewController: FortuneViewController
    let idiomViewController: IdiomViewController
    let quizViewController: QuizViewController
    let cafeMenuViewController: CafeMenuViewController
    let foodViewController: FoodViewController
    let movieViewController: MovieViewController
    let musicViewController: MusicViewController
    let webtoonViewController: WebtoonViewController
}

extension AppDI {
    static func resolve() -> AppDI {
        let onboardingViewController = OnboardingViewController()

        let categoryViewController = CategoryViewController()
        let editProfileViewController = EditProfileViewController()

        let newsViewController = NewsViewController()
        let lottoViewController = LottoViewController()

        let mainViewController = MainViewController()

        let myPageViewController = MyPageViewController()
        let bookViewController = BookViewController()
        let characterViewController = CharacterViewController()
        let flowerViewController = FlowerViewController()
        let fortuneViewController = FortuneViewController()
        let idiomViewController = IdiomViewController()
        let quizViewController = QuizViewController()

        let cafeMenuViewController = CafeMenuViewController()
        let foodViewController = FoodViewController()
        let movieViewController = MovieViewController()
        let musicViewController = MusicViewController()
        let webtoonViewController = WebtoonViewController()

        return .init(
            onboardingViewController: onboardingViewController,
            categoryViewController: categoryViewController,
            editProfileViewController: editProfileViewController,
            newsViewController: newsViewController,
            lottoViewController: lottoViewController,
            mainViewController: mainViewController,
            myPageViewController: myPageViewController,
            bookViewController: bookViewController,
            characterViewController: characterViewController,
            flowerViewController: flowerViewController,
            fortuneViewController: fortuneViewController,
            idiomViewController: idiomViewController,
            quizViewController: quizViewController,
            cafeMenuViewController: cafeMenuViewController,
            foodViewController: foodViewController,
            movieViewController: movieViewController,
            musicViewController: musicViewController,
            webtoonViewController: webtoonViewController
        )
    }
}