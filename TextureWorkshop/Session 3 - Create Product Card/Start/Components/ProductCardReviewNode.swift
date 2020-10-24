//
//  ProductCardReviewNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardReviewNode: ASDisplayNode {
    
    let starNode: [ASImageNode]
    let previewCountNode = ASTextNode()
    
    init(review: Product.Description.Review) {
        
        var tempStarNodes = [ASImageNode]()
        for index in 1...5 {
            let starNode = ASImageNode()
            starNode.image = UIImage(named: index <= review.rating ? "active_star" : "inactive_star")
            starNode.style.preferredSize = CGSize(width: 11, height: 11)
            tempStarNodes.append(starNode)
        }
        
        starNode = tempStarNodes
        
        previewCountNode.attributedText = NSAttributedString(
            string: "(\(review.reviewCount))",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.darkGray
            ])
        
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let starStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 1,
            justifyContent: .start,
            alignItems: .start,
            children: self.starNode)
        
        
        // star + count text
        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 2,
            justifyContent: .center,
            alignItems: .start,
            children: [starStack, previewCountNode])
        
        return mainStack
    }
}
