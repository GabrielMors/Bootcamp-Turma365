//
//  ViewController.swift
//  CollectionView-Simples
//
//  Created by Gabriel Mors  on 9/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var personList: [Person] = [Person(name: "Gabriel"),
                                Person(name: "Nathalia"),
                                Person(name: "Wagner"),
                                Person(name: "Sthashy"),
                                Person(name: "Thais"),
                                Person(name: "Edu"),
                                Person(name: "Gabriel"),
                                Person(name: "Nathalia"),
                                Person(name: "Wagner"),
                                Person(name: "Sthashy"),
                                Person(name: "Thais"),
                                Person(name: "Edu"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }

    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PersonCollectionViewCell.nib(), forCellWithReuseIdentifier: PersonCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.identifier, for: indexPath) as? PersonCollectionViewCell
        let indexCell =  personList[indexPath.row]
        cell?.setupCell(data: indexCell)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
}
