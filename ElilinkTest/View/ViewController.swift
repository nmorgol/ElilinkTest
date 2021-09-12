//
//  ViewController.swift
//  ElilinkTest
//
//  Created by Николай Морголь on 12.09.21.
//



import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var imageArray: [UIImage] = []
    
    var cellCount = 140
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addBarButtonItems()
        createCollectionView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        
        updateAll()
    }

    
    private func makeRequest(){
        if imageArray.count >= 140{
            cellCount += 1
        }
        ApiManager.shared.getPhoto { image in
            DispatchQueue.main.async {[weak self] in
                self?.imageArray.append(UIImage(data: image)!)
                self? .collectionView.reloadData()
            }
        }
    }
    
    
    private func updateAll() {
        imageArray.removeAll()
        collectionView.reloadData()
        cellCount = 140
        for _ in 1...140 {
            makeRequest()
        }
    }
    
    
    private func createCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (view.frame.width - 14)/7, height: (view.frame.width - 14)/7)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        let origin = CGPoint(x: 0, y: (view.frame.origin.y + (self.navigationController?.navigationBar.frame.height ?? 0)))
        let size = CGSize(width: view.frame.width, height: view.frame.width*11/7)
        
        collectionView = UICollectionView(frame: CGRect(origin: origin, size: size), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StartCollectionViewCell.self, forCellWithReuseIdentifier: StartCollectionViewCell.idintifire)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        
        view.addSubview(collectionView)
        
    }
    
    
    private func addBarButtonItems(){
        let rightBarButton = UIBarButtonItem(title: "+", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightSideBarButtonItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let leftBarButton = UIBarButtonItem(title: "Обновить все", style: UIBarButtonItem.Style.done, target: self, action: #selector(leftSideBarButtonItemTapped(_:)))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func rightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        makeRequest()
    }
    
    @objc func leftSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        updateAll()
    }
    
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StartCollectionViewCell.idintifire, for: indexPath)
        if indexPath.row > imageArray.count{
            (cell as! StartCollectionViewCell).activityIndikator.startAnimating()
            (cell as! StartCollectionViewCell).activityIndikator.isHidden = false
        }
        if indexPath.row <= imageArray.count-1{
            (cell as! StartCollectionViewCell).activityIndikator.stopAnimating()
            (cell as! StartCollectionViewCell).activityIndikator.isHidden = true
            (cell as! StartCollectionViewCell).startCellImageView.image = imageArray[indexPath.row]
        }
        return cell
    }
    


}

