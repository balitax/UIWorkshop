//
//  ProductCardDescriptionNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardDescriptionNode: ASDisplayNode {
    
    let nameNode = ASTextNode()
    let priceNode = ASTextNode()
    let shopNode: ProductCardShopNode
    let starReviewNode: ProductCardReviewNode
    let freeShippingNode: ASImageNode?
    
    init(description: Product.Description) {
        
        shopNode = ProductCardShopNode(shop: description.shop)
        
        
        starReviewNode = ProductCardReviewNode(review: description.review)
        
        nameNode.attributedText = NSAttributedString.init(
            string: description.name,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)
            ])
        nameNode.maximumNumberOfLines = 2
        
        priceNode.attributedText = NSAttributedString.init(
            string: description.price,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)
            ])
        priceNode.maximumNumberOfLines = 1
        
        freeShippingNode = description.isFreeShipping ? ASImageNode() : nil
        freeShippingNode?.image = UIImage(named: "free_shipping")
        freeShippingNode?.style.preferredSize = CGSize(width: 67, height: 16)
        freeShippingNode?.style.spacingBefore = 4
        
        super.init()
        automaticallyManagesSubnodes = true
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let verticalStackContent  = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .start,
            alignItems: .start,
            children: [self.nameNode, self.priceNode, self.shopNode, starReviewNode, self.freeShippingNode].compactMap { $0 } )
        
        return verticalStackContent
    }
}
