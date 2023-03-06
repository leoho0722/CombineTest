//
//  MainViewController.swift
//  CombineTest
//
//  Created by Leo Ho on 2023/3/6.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var txfMessage: UITextField!
    @IBOutlet weak var btnPush: UIButton!
    @IBOutlet weak var tvMessage: UITableView!
    
    // MARK: - Variables
    
    let vm = MainViewModel()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        subscriberBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupTextField()
        setupButton()
        setupTableView()
        dismissKeyboard()
    }
    
    /// 設定 UITextField 樣式
    private func setupTextField() {
        txfMessage.placeholder = "請輸入留言..."
    }
    
    /// 設定 UIButton 樣式
    private func setupButton() {
        btnPush.setTitle("發送", for: .normal)
    }
    
    /// 設定 UITableView 樣式
    private func setupTableView() {
        tvMessage.delegate = self
        tvMessage.dataSource = self
        tvMessage.register(MainTableViewCell.loadFromNib(),
                           forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    // MARK: - Subscriber Binding
    
    /// 設定 UI 元件的訂閱者觸發事件綁定
    private func subscriberBinding() {
        btnPush.publisher(for: .touchUpInside)
            .sink { [unowned self] _ in
                // btnPush 按下後要做什麼事
                guard let message = txfMessage.text, !message.isEmpty else {
                    return
                }
                #if DEBUG
                print(message)
                #endif
                vm.messageArray.append(message)
                tvMessage.reloadData()
            }
            .store(in: &vm.subscribes) // 將 btnPush 的訂閱狀態儲存在 ViewModel 裡的 subscribes
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extensions

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,
                                                       for: indexPath) as? MainTableViewCell else {
            fatalError("MainTableViewCell Load Failed！")
        }
        cell.setInit(message: vm.messageArray[indexPath.row])
        return cell
    }
}

// MARK: - Protocol


