//Created by Lugalu on 17/10/23.

import UIKit

class WelcomeViewController: UIViewController {
    
    var viewModel: WelcomeViewModelProtocol = WelcomeViewModel()

    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = viewModel.scrollViewDelegate
        scroll.isScrollEnabled = true
        scroll.bounces = false
        scroll.backgroundColor = UIColor.lightDarkPurple
        return scroll
    }()
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lore Ipsum"
        return label
    }()
    
    lazy var configurationButton: UIButton = {
        let button = UIButton(configuration: .plain())

        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white

        let action = UIAction(){ _ in
            print("OPEN CONFIG")
        }
        
        button.addAction(action, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var dateLabel: LabelCluster = {
        return LabelCluster()
    }()
    
    lazy var recordButton: CustomButton = {
        let button = CustomButton()
        let action = UIAction(){_ in
            print("RECORD")
        }
        
        button.setup(title: "record", actionState: .touchUpInside, action: action)
        button.layer.shadowColor = UIColor.clear.cgColor
        return button
    }()
    
    
    lazy var calendar: UIDatePicker = {
        let calendar = UIDatePicker()
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.preferredDatePickerStyle = .compact
        calendar.datePickerMode = .date
        calendar.tintColor = .ultraPink

        return calendar
    }()
    
    lazy var reminders: UITableView = {
        let table = UITableView()
        table.dataSource = viewModel.tableController
        table.delegate = viewModel.tableController
        table.isScrollEnabled = false
        table.bounces = false
        table.register(viewModel.getCellType(), forCellReuseIdentifier: viewModel.getCellIdentifer())
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        
        table.layer.maskedCorners = CornerToMask.topLeft.getMask()
        table.layer.cornerRadius = 32
        table.sectionIndexColor = .black
        table.insetsContentViewsToSafeArea = true
        table.insetsLayoutMarginsFromSafeArea = true
        table.rowHeight = 72
        table.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 70)
        table.separatorColor = .slightPink
        
        

        return table
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !UserDefaults.isFirstTime {
            let onboarding = OnboardingCoordinator(root: self)
            onboarding.start()
            NotificationCenter.default.addObserver(self, selector: #selector(updateFromOnboarding), name: .didReturnFromOnboarding, object: nil)
        }

        let contentRect: CGRect = scroll.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        scroll.contentSize = CGSize(width: contentRect.width, height: contentRect.height - 50)
    }
    
    
    func setup() {
        addViews()
        reminders.reloadData()
        configureConstraints()
        self.navigationController?.navigationBar.isHidden = true

    }
    
    @objc
    func updateFromOnboarding() {
        NotificationCenter.default.removeObserver(self, name: .didReturnFromOnboarding, object: nil)
        //TODO: UPDATE NAME LABEL
        print("Hey Ho")
    }
    

}

extension WelcomeViewController: ViewProtocol {
    
    func addViews() {
        view.addSubview(scroll)
        scroll.addSubview(nameLabel)
        scroll.addSubview(configurationButton)
        scroll.addSubview(dateLabel)
        scroll.addSubview(recordButton)
        scroll.addSubview(calendar)
        scroll.addSubview(reminders)
    }
    
    func configureConstraints() {
        addScrollConstraints()
        addNameLabelConstraints()
        addConfigurationButtonConstraints()
        addDateLabelConstraints()
        addRecordButtonConstraints()
        addCalendarConstraints()
        addRemindersConstraints()
    }
    
    private func addScrollConstraints(){
        let constraints = [
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addNameLabelConstraints(){
        let constraints = [
            nameLabel.leadingAnchor.constraint(equalTo: scroll.contentLayoutGuide.leadingAnchor, constant: 40),
            nameLabel.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor, constant: 60)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addConfigurationButtonConstraints(){
        let constraints = [
            configurationButton.trailingAnchor.constraint(equalTo: scroll.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            configurationButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            configurationButton.widthAnchor.constraint(equalToConstant: 30),
            configurationButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addDateLabelConstraints(){
        let constraints = [
            dateLabel.leadingAnchor.constraint(equalTo: scroll.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addRecordButtonConstraints(){
        let constraints = [
            recordButton.trailingAnchor.constraint(equalTo: scroll.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            recordButton.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addCalendarConstraints(){
        let constraints = [
            calendar.leadingAnchor.constraint(equalTo: scroll.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            calendar.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 40),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addRemindersConstraints(){
        let constraints = [
            reminders.trailingAnchor.constraint(equalTo: scroll.safeAreaLayoutGuide.trailingAnchor),
            reminders.leadingAnchor.constraint(equalTo: scroll.safeAreaLayoutGuide.leadingAnchor),
            reminders.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 40),
            reminders.heightAnchor.constraint(greaterThanOrEqualToConstant: reminders.contentSize.height + 60),
            reminders.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}



