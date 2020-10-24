//
//  ProductCardImageNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardImageNode: ASDisplayNode {
    
    let imageNode = ASNetworkImageNode()
    let whishlistNode = ProductCardWishlistNode()
    
    init(imageUrl: URL?) {
        super.init()
        automaticallyManagesSubnodes = true
        
        if imageUrl == nil {
            imageNode.backgroundColor = .darkGray
            imageNode.image = UIImage(named: "product")
        } else {
            imageNode.url = imageUrl
        }
        
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
        imageNode.cornerRadius = 6
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let whishlistInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 4, left: 4, bottom: .infinity, right: .infinity),
            child: whishlistNode)
        
        return ASOverlayLayoutSpec(
            child: imageNode,
            overlay: whishlistInset)
    }
}
