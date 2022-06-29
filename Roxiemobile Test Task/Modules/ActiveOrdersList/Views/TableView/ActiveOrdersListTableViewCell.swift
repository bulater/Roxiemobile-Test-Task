//
//  ActiveOrdersListTableViewCell.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

class ActiveOrdersListTableViewCell: UITableViewCell {
    // MARK: - Public Properties

    static let cellID = "ActiveOrdersListTableViewCellID"

    lazy var startAdressLabel: UILabel = { ActiveOrdersListTableViewCell.makeLabel() }()
    lazy var endAdressLabel: UILabel = { ActiveOrdersListTableViewCell.makeLabel() }()
    lazy var orderDateLabel: UILabel = { ActiveOrdersListTableViewCell.makeLabel() }()
    lazy var orderAmountLabel: UILabel = { ActiveOrdersListTableViewCell.makeLabel() }()

    lazy var adressStackView: UIStackView = {
        ActiveOrdersListTableViewCell.makeStackViewWith(axis: .horizontal,
                                                        spacing: 10,
                                                        distribution: .fillEqually,
                                                        layoutInset: LayoutConstants.StackView.contentInset)
    }()

    lazy var orderDetailsStackView: UIStackView = {
        ActiveOrdersListTableViewCell.makeStackViewWith(axis: .horizontal,
                                                        spacing: 10,
                                                        distribution: .fillEqually,
                                                        layoutInset: LayoutConstants.StackView.contentInset)
    }()

    // MARK: - Private Properties

    enum LayoutConstants {
        enum StackView {
            static let contentInset = UIEdgeInsets(top: 3, left: 16, bottom: 3, right: 16)
        }
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(with viewModel: ActiveOrdersViewModel?) {
        guard let viewModel = viewModel else { return }
        startAdressLabel.text = "\(viewModel.startCity). \(viewModel.endAddress)"
        endAdressLabel.text = "\(viewModel.endCity). \(viewModel.endAddress)"
        orderDateLabel.text = viewModel.orderTime
        orderAmountLabel.text = "\(viewModel.amount).\(viewModel.currency)"

    }

    // MARK: - Creating Subviews

    private func addSubviews() {
        contentView.addSubview(adressStackView)
        contentView.addSubview(orderDetailsStackView)
        adressStackView.addArrangedSubview(startAdressLabel)
        adressStackView.addArrangedSubview(endAdressLabel)
        orderDetailsStackView.addArrangedSubview(orderDateLabel)
        orderDetailsStackView.addArrangedSubview(orderAmountLabel)

        activateOrderAdressStackViewConstraints()
        activateOrderDetailsStackViewConstraints()
    }
    
    static func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    static func makeStackViewWith(axis: NSLayoutConstraint.Axis, spacing: CGFloat?, distribution: UIStackView.Distribution, layoutInset: UIEdgeInsets?) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing ?? 0
        stackView.distribution = distribution
        stackView.layoutMargins = layoutInset ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    // MARK: - Layout

    private func activateOrderAdressStackViewConstraints() {
        NSLayoutConstraint.activate([
            adressStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            adressStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adressStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adressStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
        ])
    }

    private func activateOrderDetailsStackViewConstraints() {
        NSLayoutConstraint.activate([
            orderDetailsStackView.topAnchor.constraint(equalTo: adressStackView.bottomAnchor),
            orderDetailsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            orderDetailsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orderDetailsStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
        ])
    }
}
