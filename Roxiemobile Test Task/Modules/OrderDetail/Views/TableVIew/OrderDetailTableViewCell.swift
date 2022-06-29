//
//  OrderDetailTableViewCell.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {
    // MARK: - Public Properties

    static let cellID = "OrderDetailTableViewCellID"

    lazy var startAdressLabel: UILabel = { OrderDetailTableViewCell.makeLabel() }()
    lazy var endAdressLabel: UILabel = { OrderDetailTableViewCell.makeLabel() }()
    lazy var orderDateLabel: UILabel = { OrderDetailTableViewCell.makeLabel() }()
    lazy var orderAmountLabel: UILabel = { OrderDetailTableViewCell.makeLabel() }()
    lazy var regNumberLabel: UILabel = { OrderDetailTableViewCell.makeLabel() }()
    lazy var modelNameLabel: UILabel = { OrderDetailTableViewCell.makeLabel() }()
    lazy var driverNameLabel: UILabel = { OrderDetailTableViewCell.makeLabel() }()
    lazy var vehicleImageView: UIImageView = { OrderDetailTableViewCell.makeVehicleImageView() }()

    lazy var adressStackView: UIStackView = {
        OrderDetailTableViewCell.makeStackViewWith(axis: .horizontal,
                                                        spacing: 10,
                                                        distribution: .fillEqually,
                                                        layoutInset: LayoutConstants.StackView.contentInset)
    }()

    lazy var orderDetailsStackView: UIStackView = {
        OrderDetailTableViewCell.makeStackViewWith(axis: .horizontal,
                                                        spacing: 10,
                                                        distribution: .fillEqually,
                                                        layoutInset: LayoutConstants.StackView.contentInset)
    }()

    lazy var vehicleInfoStackView: UIStackView = {
        OrderDetailTableViewCell.makeStackViewWith(axis: .vertical,
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
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configureView() {
        selectionStyle = .none
    }

    // MARK: - Public Methods

    func configure(with viewModel: ActiveOrdersViewModel?) {
        guard let viewModel = viewModel else { return }
        startAdressLabel.text = """
                                \(viewModel.startCity).
                                \(viewModel.startAdress).
                                """
        endAdressLabel.text = """
                                \(viewModel.endCity).
                                \(viewModel.endAddress).
                              """
        orderDateLabel.text = viewModel.orderTime.dateFormate(with: .dateAndTime)
        orderAmountLabel.text = "\(viewModel.amount) \(viewModel.currency)"

        regNumberLabel.text = viewModel.regNumber
        modelNameLabel.text = viewModel.modelName
        driverNameLabel.text = viewModel.driverName
        NetworkManager.shared.setOrderVehicleImage(from: viewModel, image: self.vehicleImageView)
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

        addSubview(vehicleImageView)
        activateVehicleImageViewConstraints()

        contentView.addSubview(vehicleInfoStackView)
        vehicleInfoStackView.addArrangedSubview(driverNameLabel)
        vehicleInfoStackView.addArrangedSubview(regNumberLabel)
        vehicleInfoStackView.addArrangedSubview(modelNameLabel)
        activateVehicleInfoStackViewConstraints()
    }

    static func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
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

    static func makeVehicleImageView() -> UIImageView {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }

    // MARK: - Layout

    private func activateOrderDetailsStackViewConstraints() {
        NSLayoutConstraint.activate([
            orderDetailsStackView.topAnchor.constraint(equalTo: adressStackView.bottomAnchor),
            orderDetailsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            orderDetailsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orderDetailsStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1)
        ])
    }

    private func activateOrderAdressStackViewConstraints() {
        NSLayoutConstraint.activate([
            adressStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            adressStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adressStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adressStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1)
        ])
    }

    private func activateVehicleImageViewConstraints() {
        NSLayoutConstraint.activate([
            vehicleImageView.topAnchor.constraint(equalTo: orderDetailsStackView.bottomAnchor),
            vehicleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            vehicleImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            vehicleImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }

    private func activateVehicleInfoStackViewConstraints() {
        NSLayoutConstraint.activate([
            vehicleInfoStackView.topAnchor.constraint(equalTo: vehicleImageView.bottomAnchor),
            vehicleInfoStackView.widthAnchor.constraint(equalTo: widthAnchor),
            vehicleInfoStackView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
    }
}
