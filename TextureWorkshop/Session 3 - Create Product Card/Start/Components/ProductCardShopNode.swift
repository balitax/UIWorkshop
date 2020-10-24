//
//  ProductCardShopNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardShopNode: ASDisplayNode {
    
    let badgeNode: ASImageNode?
    let nameShopNode = ASTextNode()
    
    init(shop: Product.Description.Shop) {
        
        switch shop.type {
        case .officialStore:
            badgeNode = ASImageNode()
            badgeNode?.image = #imageLiteral(resourceName: "official_store")
        case .powerMerchant:
            badgeNode = ASImageNode()
            badgeNode?.image = #imageLiteral(resourceName: "power_merchant")
        case .none:
            badgeNode = nil
        }
        
        badgeNode?.style.preferredSize = CGSize(width: 16, height: 16)
        badgeNode?.style.flexShrink = 1
        
        nameShopNode.attributedText = NSAttributedString.init(
            string: shop.name,
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.darkGray
            ]
        )
        
        nameShopNode.style.flexShrink = 1
        
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 8,
            justifyContent: .start,
            alignItems: .center,
            children: [badgeNode, nameShopNode].compactMap { $0 })
    }
}
