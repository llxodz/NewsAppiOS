//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 28.09.2022.
//

import UIKit

open class BaseViewController: UIViewController {
    
    public init(bundle: Bundle) {
        super.init(nibName: nil, bundle: bundle)
        modalPresentationStyle = .fullScreen
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
