//
//  ViewController.swift
//  CustomUILabel
//
//  Created by CPU11613 on 10/31/18.
//  Copyright © 2018 CPU11613. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, CustomUILabelDelegate {
    let numberOfCells : NSInteger = 44
    var states : Array<Bool>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
        states = [Bool](repeating: true, count: numberOfCells)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSource = preparedSources()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExpandableCell
        cell.customLabel.delegate = self
        cell.customLabel.expandedAttributedLink = NSAttributedString(string: "Thu gọn", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray])
        cell.customLabel.collapsedAttributedLink = NSAttributedString(string: "Xem thêm", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray])
        
        cell.layoutIfNeeded()
        
        cell.customLabel.shouldCollapse = true
        cell.customLabel.textReplacementType = currentSource.textReplacementType
        cell.customLabel.numberOfLines = currentSource.numberOfLines
        cell.customLabel.collapsed = states[indexPath.row]
        cell.customLabel.text = currentSource.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func preparedSources() -> [(text: String, textReplacementType: CustomUILabel.TextReplacementType, numberOfLines: Int, textAlignment: NSTextAlignment)] {
        return [(sampleText1(), .word, 3, .left),
                (sampleText2(), .word, 2, .center),
                (sampleText3(), .character, 1, .right),
                (sampleText4(), .character, 1, .left),
                (sampleText3(), .word, 4, .center),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 3, .right),
                (sampleText1(), .word, 2, .left),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 5, .center),
                (sampleText3(), .word, 3, .right),
                (sampleText4(), .character, 1, .left),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText1(), .word, 3, .left),
                (sampleText2(), .word, 2, .center),
                (sampleText3(), .character, 1, .right),
                (sampleText4(), .character, 1, .left),
                (sampleText3(), .word, 4, .center),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 3, .right),
                (sampleText1(), .word, 2, .left),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 5, .center),
                (sampleText3(), .word, 3, .right),
                (sampleText4(), .character, 1, .left),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText1(), .word, 3, .left),
                (sampleText2(), .word, 2, .center),
                (sampleText3(), .character, 1, .right),
                (sampleText4(), .character, 1, .left),
                (sampleText3(), .word, 4, .center),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 3, .right),
                (sampleText1(), .word, 2, .left),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 5, .center),
                (sampleText3(), .word, 3, .right),
                (sampleText4(), .character, 1, .left),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText1(), .word, 3, .left),
                (sampleText2(), .word, 2, .center),
                (sampleText3(), .character, 1, .right),
                (sampleText4(), .character, 1, .left),
                (sampleText3(), .word, 4, .center),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 3, .right),
                (sampleText1(), .word, 2, .left),
                (textWithShortWordsPerLine(), .character, 3, .center),
                (sampleText2(), .character, 5, .center),
                (sampleText3(), .word, 3, .right),
                (sampleText4(), .character, 1, .left),
                (textWithShortWordsPerLine(), .character, 3, .center)]
    }
    
    
    func sampleText1() -> String {
        return "Kim Dung, tiểu thuyết gia nổi tiếng người Trung Quốc với hàng loạt tác phẩm võ hiệp kinh điển, vừa qua đời ở tuổi 94.  Truyền thông Hong Kong ngày 30/10 cho biết nhà văn Kim Dung, tên thật là Tra Lương Dung, đã qua đời ở tuổi 94. Apple Daily News cho biết nhà văn Kim Dung qua đời tại Bệnh viện Hong Kong sau một thời gian dài chiến đấu với bệnh tật. Con rể của ông là Ng Wai Cheong đã xác nhận thông tin này với South China Morning Post vào tối cùng ngày."
    }
    
    func sampleText2() -> String {
        return "Kim Dung tên thật là Tra Lương Dung, sinh năm 1924 tại Chiết Giang (Trung Quốc). Ông là tác giả tiểu thuyết võ hiệp xuất sắc đương đại, được mệnh danh là \"Võ lâm minh chủ\" về sách kiếm hiệp. Ông cũng là người sáng lập tờ Minh Báo nổi tiếng tại Hong Kong. Các cuốn tiểu thuyết kiếm hiệp nổi tiếng nhất của ông có \"Anh hùng xạ điêu\", \"Thần điêu đại hiệp\", \"Ỷ thiên đồ long ký\", \"Lộc Đỉnh Ký\", \"Tiếu Ngạo Giang Hồ\",..."
    }
    
    func sampleText3() -> String {
        return "Kim Dung, tiểu thuyết gia nổi tiếng người Trung Quốc với hàng loạt tác phẩm võ hiệp kinh điển, vừa qua đời ở tuổi 94. \n  Truyền thông Hong Kong ngày 30/10 cho biết nhà văn Kim Dung, tên thật là Tra Lương Dung, đã qua đời ở tuổi 94. \n Apple Daily News cho biết nhà văn Kim Dung qua đời tại Bệnh viện Hong Kong sau một thời gian dài chiến đấu với bệnh tật. Con rể của ông là Ng Wai Cheong đã xác nhận thông tin này với South China Morning Post vào tối cùng ngày."
    }
    
    func sampleText4() -> String {
        return "Kim Dung tên thật là Tra Lương Dung, sinh năm 1924 tại Chiết Giang (Trung Quốc). Ông là tác giả tiểu thuyết võ hiệp xuất sắc đương đại, được mệnh danh là \"Võ lâm minh chủ\" về sách kiếm hiệp. Ông cũng là người sáng lập tờ Minh Báo nổi tiếng tại Hong Kong.\n Các cuốn tiểu thuyết kiếm hiệp nổi tiếng nhất của ông có \"Anh hùng xạ điêu\", \"Thần điêu đại hiệp\", \"Ỷ thiên đồ long ký\", \"Lộc Đỉnh Ký\", \"Tiếu Ngạo Giang Hồ\", \"Lục Mạch Thần Kiếm\",..."
    }
    
    func textWithShortWordsPerLine() -> String {
        return "A\nB\nC\nD\nE\nF\nG\nH\nI\nJ\nK\nL\nM\nN"
    }
    
    //
    // MARK: ExpandableLabel Delegate
    //
    
    func willExpandLabel(_ label: CustomUILabel) {
        tableView.beginUpdates()
    }
    
    func didExpandLabel(_ label: CustomUILabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            states[indexPath.row] = false
            DispatchQueue.main.async { [weak self] in
//                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
    
    func willCollapseLabel(_ label: CustomUILabel) {
        tableView.beginUpdates()
    }
    
    func didCollapseLabel(_ label: CustomUILabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            states[indexPath.row] = true
            DispatchQueue.main.async { [weak self] in
//                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
}

extension String {
    
    func specialPriceAttributedStringWith(_ color: UIColor) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int),
                          .foregroundColor: color, .font: fontForPrice()]
        return NSMutableAttributedString(attributedString: NSAttributedString(string: self, attributes: attributes))
    }
    
    func priceAttributedStringWith(_ color: UIColor) -> NSAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor: color, .font: fontForPrice()]
        
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    func priceAttributedString(_ color: UIColor) -> NSAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    fileprivate func fontForPrice() -> UIFont {
        return UIFont(name: "Helvetica-Neue", size: 13) ?? UIFont()
    }
    
//    override func viewDidLoad() {
//
//        label.numberOfLines = 3
//        //        label.collapsed = true
//        label.expandedAttributedLink = NSAttributedString(string: "Thu gọn", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray])
//        label.collapsedAttributedLink = NSAttributedString(string: "Xem thêm", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray])
//        label.ellipsis = NSAttributedString(string: "...")
//        label.text = "TTO - Bao nilông các loại đang được dùng tràn lan trong các cửa hàng, quán sá, chợ, siêu thị... Giá thành bao nilông thấp, tiện trong sinh hoạt nên người dân sử dụng rất phổ biến, thậm chí còn lạm dụng mà không để ý đến tác hại của nó."
//        super.viewDidLoad()
//
//        label.delegate = self
//
//
//    }


}

