//
//  DetailViewController.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/04.
//

import UIKit

class DetailViewController: UIViewController, ViewModelBindableType {
    
    typealias ViewModelType = DetailViewModel
    
    var viewModel: DetailViewModel!
    
    func bindViewModel() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func configureUI(){
        self.title = "Detail"
    }
}

