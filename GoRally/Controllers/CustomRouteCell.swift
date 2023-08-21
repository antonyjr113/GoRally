//
//  CustomRouteCell.swift
//  GoRally
//
//  Created by Don Wolfton on 21.08.23.
//

import UIKit

class CustomRouteCell: UITableViewCell {


    @IBOutlet weak var routeCellTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .white
        routeCellTitle.textAlignment = .left
        let viewForCell = UIView()
        viewForCell.backgroundColor = .systemYellow
        addSubview(viewForCell)
        viewForCell.addSubview(routeCellTitle)
        viewForCell.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        routeCellTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

    func customizeCell(with title: String) {
        routeCellTitle.text = "Title"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        routeCellTitle.text = "777"

    }

}
