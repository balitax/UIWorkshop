//
//  ProductCardWishlistNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardWishlistNode: ASDisplayNode {
    
    let backgroundNode: ASDisplayNode
    let activeNode: ASImageNode
    let inactiveNode: ASImageNode
    var isWhishlist = false
    
    
    override init() {
        backgroundNode = ASDisplayNode()
        backgroundNode.backgroundColor = .lightGray
        backgroundNode.cornerRadius = 14
        
        activeNode = ASImageNode()
        activeNode.style.preferredSize = CGSize(width: 24, height: 24)
        activeNode.image = #imageLiteral(resourceName: "active_heart")
        
        inactiveNode = ASImageNode()
        inactiveNode.style.preferredSize = CGSize(width: 24, height: 24)
        inactiveNode.image = #imageLiteral(resourceName: "inactive_heart")
        
        super.init()
        automaticallyManagesSubnodes = true
        
        
        activeNode.addTarget(self, action: #selector(self.changeWishlistState), forControlEvents: .touchUpInside)
        inactiveNode.addTarget(self, action: #selector(self.changeWishlistState), forControlEvents: .touchUpInside)
        
    }
    
    @objc func changeWishlistState() {
        isWhishlist.toggle()
        setNeedsLayout()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        var child: ASImageNode
        if isWhishlist {
            child = activeNode
        } else {
            child = inactiveNode
        }
        
        let wishlistInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2),
            child: child
        )
        
        return ASBackgroundLayoutSpec(
            child: wishlistInset,
            background: backgroundNode
        )
    }
}
