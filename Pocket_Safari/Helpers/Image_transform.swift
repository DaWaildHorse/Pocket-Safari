//
//  Image_transform.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 09/10/24.
//

import SwiftUI

extension Image {
    func toUIImage() -> UIImage? {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = CGSize(width: 300, height: 300) // Adjust as needed
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.bounds = CGRect(origin: .zero, size: targetSize)
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
}
