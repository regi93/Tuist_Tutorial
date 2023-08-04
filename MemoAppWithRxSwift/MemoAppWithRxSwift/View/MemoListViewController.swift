//
//  ViewController.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/03.
//

import UIKit

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    typealias ViewModelType = MemoListViewModel
    
    var viewModel = MemoListViewModel()
    
    func bindViewModel() {
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
    }
    
    private func configureUI(){
        self.title = "Memo List"
        self.title = "MainViewController"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
    }
}

 
