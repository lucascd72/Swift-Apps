//
//  ViewController.swift
//  youtube-copy
//
//  Created by Lucas Danelon on 09/06/2020.
//  Copyright © 2020 Lucas Danelon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var video = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideo()
        
    }
    
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ video: [Video]) {
        
        // set the return video of the proprity
        self.video = video
        
        //refresh the tableview
        tableView.reloadData()
    }
    
    
    // MARK: - Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return video.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstanteName.videoCell, for: indexPath)
        
        
        // set the title
        let title = self.video[indexPath.row].title
        
        cell.textLabel?.text = title
        //Configure the cell with the data
        
        
        //Return the cell
        return cell
    }
    


}

