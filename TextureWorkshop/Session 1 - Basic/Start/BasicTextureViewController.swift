//
//  BasicTextureViewController.swift
//  TextureWorkshop
//
//  Created by Jefferson Setiawan on 06/10/20.
//

import AsyncDisplayKit

class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
    
    let mainNode = ASDisplayNode()
    let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override init() {
        super.init(node: mainNode)
        mainNode.backgroundColor = .white
        
        let subNode = ASDisplayNode()
        subNode.backgroundColor = .orange
        //        subNode.frame = CGRect(x: 0, y: 0, width: 300, height: 300) // not recommended
        subNode.style.preferredSize = CGSize(width: 300, height: 300) // use this, for texture node sizing
        
        
        mainNode.addSubnode(subNode)
        
        mainNode.layoutSpecBlock = {  _, _ -> ASLayoutSpec in
            return ASCenterLayoutSpec(
                centeringOptions: .XY,
                sizingOptions: [],
                child: subNode)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
