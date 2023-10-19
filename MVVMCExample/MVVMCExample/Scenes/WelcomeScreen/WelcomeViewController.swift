//Created by Lugalu on 17/10/23.

import UIKit

class WelcomeViewController: UIViewController {
    
    var viewModel: WelcomeViewModelProtocol = WelcomeViewModel()

    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = viewModel.scrollViewDelegate
        
        return scroll
    }()
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        return button
    }()
    
    
    lazy var calendar: UICalendarView = {
        let calendar = UICalendarView()
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        return calendar
    }()
    
    lazy var remindersView: UITableView = {
        let table = UITableView()
        
        table.dataSource = viewModel.tableController
        table.delegate = viewModel.tableController
        table.register(viewModel.getCellType(), forCellReuseIdentifier: viewModel.getCellIdentifer())
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.backgroundColor = .white
        table.layer.maskedCorners = .layerMinXMinYCorner
        table.layer.cornerRadius = 32
        
        return table
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        #if DEBUG
        if ProcessInfo.processInfo.environment["OverwriteFirstTime"] == "True" {
            let onboarding = OnboardingCoordinator(root: self)
            onboarding.start()
            NotificationCenter.default.addObserver(self, selector: #selector(updateFromOnboarding), name: .didReturnFromOnboarding, object: nil)
        }
        
        #else

        if !UserDefaults.isFirstTime {
            let onboarding = OnboardingCoordinator(root: self)
            onboarding.start()
            NotificationCenter.default.addObserver(self, selector: #selector(updateFromOnboarding), name: .didReturnFromOnboarding, object: nil)
        }
        
        #endif
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
        
    }
    
    func configureConstraints() {
        
    }
    
    
}



