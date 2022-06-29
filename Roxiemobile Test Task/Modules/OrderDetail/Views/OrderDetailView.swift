//
//  OrderDetailView.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

protocol OrderDetailViewViewDelegate: AnyObject {
}

class OrderDetailView: UIView {
    // MARK: - Public Properties

    weak var delegate: OrderDetailViewViewDelegate?

    // MARK: - Private Properties


    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configureView() {
        backgroundColor = .white
    }

    // MARK: - Creating Subviews

    func addSubviews() {

    }

    // MARK: - Layout
}
