//
//  ProductCardNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 08/10/20.
//

import AsyncDisplayKit

class ProductCardNode: ASCellNode {
    
    let backgroundNode = ASDisplayNode()
    let imageNode: ProductCardImageNode?
    let productCardDescNode:  ProductCardDescriptionNode
    
    
    init(model: Product) {
        
        imageNode = ProductCardImageNode(imageUrl: model.imageURL)
        productCardDescNode = ProductCardDescriptionNode(description: model.description)
        productCardDescNode.style.flexGrow = 1
        productCardDescNode.style.flexShrink = 1
        
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        backgroundNode.backgroundColor = .white
        clipsToBounds = false
        
        setShadow()
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        
        let mainStackContent  = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [self.imageNode, self.productCardDescNode].compactMap { $0 })
        
        let mainInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
            child: mainStackContent)
        
        let backgroundInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            child: backgroundNode)
        
        
        
        return ASBackgroundLayoutSpec(child: mainInset, background: backgroundInset)
        
    }
    
    func setShadow() {
        clipsToBounds = false
        cornerRadius = 8
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.12
        shadowOffset.height = 2
        shadowRadius = 4
    }
    
    override func layout() {
        super.layout()
        // Optimize performance for rendering shadow
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}
