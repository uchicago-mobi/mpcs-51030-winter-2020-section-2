//
//  CollectionViewController.swift
//  SimpleDiffableDataSourceDemo
//
//  Created by Susan Stevens on 2/12/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    var sorted = true
    var states: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load list of states from text file
        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "states", ofType: "txt")!)
        states = text.components(separatedBy:"\n")
        
        // Create the diffable datasource
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, state in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                          for: indexPath) as! CollectionViewCell
            cell.label.text = state
            return cell
        }
        
        // Create and apply the snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(states)
        dataSource.apply(snapshot)
    }
    
    @IBAction func didTapButton(_ sender: UIBarButtonItem) {
        sorted.toggle()
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        
        if sorted {
            snapshot.appendItems(states.sorted())
            sender.title = "Shuffle"
        } else {
            snapshot.appendItems(states.shuffled())
            sender.title = "Sort"
        }
        
        // Apply the new snapshot
        dataSource.apply(snapshot)
    }
}
