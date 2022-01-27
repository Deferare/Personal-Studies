//
//  ImageZoomViewController.swift
//  PhotosExample
//
//  Created by Deforeturn on 1/27/22.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {
    
    var asset:PHAsset!
    let imageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView:UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        imageManager.requestImage(for: asset,
                                     targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                     contentMode: .aspectFill,
                                     options: nil,
                                     resultHandler: {image, _ in self.imageView.image = image})
                                    
    }
   
}
