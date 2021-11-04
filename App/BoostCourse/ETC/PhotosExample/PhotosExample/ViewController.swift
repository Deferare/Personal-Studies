//
//  ViewController.swift
//  PhotosExample
//
//  Created by KANG SEUNG HOON on 2021/10/23.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver {
    @IBOutlet weak var tableView:UITableView!
    var fetchResult:PHFetchResult<PHAsset>!
    let imageManager = PHCachingImageManager()
    let cellIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let asset = self.fetchResult[indexPath[indexPath.row]]
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult)
            else{return}
        fetchResult = changes.fetchResultAfterChanges
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    func requestCollection(){
        // 카메라 롤 컬렉션 가져 옮.
        let cameraRoll = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        // 거기 사진들 가져오고.
        guard let cameraRollCollection = cameraRoll.firstObject else{
            return
        }
        let fetchOptions = PHFetchOptions()
        
        // 최신 순으로 정렬.
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // 그 결과를 저장.
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAurhorizationStatus {
        case .notDetermined:
            print("응답 없음.")
            PHPhotoLibrary.requestAuthorization({status in
                switch status {
                case .authorized:
                print("사용자가 허용함.")
                self.requestCollection()
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
                case .denied:
                    print("사용자가 불허함.")
                default:break
                }
            })
        case .restricted:
            print("접근 제한.")
        case .denied:
            print("접근 불허.")
        case .authorized:
            print("접근 허가.")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        case .limited:
            print("limited.")
        default:
            print("@@@")
        }
        PHPhotoLibrary.shared().register(self)
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let asset:PHAsset = fetchResult.object(at: indexPath.row)

        imageManager.requestImage(for: asset,
                                     targetSize: CGSize(width:30, height:30),
                                     contentMode: .aspectFill,
                                     options: nil,
                                     resultHandler: {image, _ in
                                        cell.imageView?.image = image
        })
        return cell
    }
}

