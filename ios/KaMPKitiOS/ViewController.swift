//
//  ViewController.swift
//  KaMPKitiOS
//
//  Created by Kevin Schildhorn on 12/18/19.
//  Copyright © 2019 Touchlab. All rights reserved.
//

import UIKit
import shared

class BreedsViewController: UIViewController {

    @IBOutlet weak var breedTableView: UITableView!
    var data: [Breed] = []
    var ocObject : TestOCInvokeKotlin?
    let log = koin.get(objCClass: Kermit.self, parameter: "ViewController") as! Kermit
    
    lazy var adapter: NativeViewModel = NativeViewModel(
        viewUpdate: { [weak self] summary in
            self?.viewUpdate(for: summary)
        }, errorUpdate: { [weak self] errorMessage in
            self?.errorUpdate(for: errorMessage)
        }
    )
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        breedTableView.dataSource = self
        //We check for stalk data in this method
        adapter.getBreedsFromNetwork()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        adapter.onDestroy()
    }
    
    // MARK: BreedModel Closures
    
    private func viewUpdate(for summary: ItemDataSummary) {
        log.d(withMessage: {"View updating with \(summary.allItems.count) breeds"})
        data = summary.allItems
        breedTableView.reloadData()
    }
    
    private func errorUpdate(for errorMessage: String) {
        log.e(withMessage: {"Displaying error: \(errorMessage)"})
        let alertController = UIAlertController(title: "error", message: errorMessage, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource
extension BreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath)
        if let breedCell = cell as? BreedCell {
            let breed = data[indexPath.row]
            breedCell.bind(breed)
            breedCell.delegate = self
        }
        return cell
    }
}

// MARK: - BreedCellDelegate
extension BreedsViewController: BreedCellDelegate {
    func toggleFavorite(_ breed: Breed) {
        // 测试OC调用kotlin
        self.testOcInvokeKotlinLostFrameStack()
        
        // 测试Swift调用kotlin
//        self.testSwiftInvokeKotlin(breed: breed)
    }
    
    // 测试oc调用kotlin发生crash是否会丢失堆栈
    private func testOcInvokeKotlinLostFrameStack() {
        ocObject = TestOCInvokeKotlin()
        ocObject?.lostFrameStack(adapter)
    }
    
    
    //*********************************************************************************************
    // 测试Swift调用kotlin
    private func testSwiftInvokeKotlin(breed: Breed) {
        self.real1(breed: breed)
    }
    
    private func real1(breed: Breed) {
        self.real2(breed: breed)
    }
    
    private func real2(breed: Breed) {
        self.real3(breed: breed)
    }
    
    private func real3(breed: Breed) {
        adapter.updateBreedFavorite(breed: breed)
    }
    //*********************************************************************************************
}
