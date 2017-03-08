//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Student on 2/7/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit

//Bring in UITable DataSource and Delegate
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var myCollegeObject:[CollegeClass] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "Miami University", Type: "Public", Population: "11,000", URL: "http://miamioh.edu/fsb/", Image: UIImage(named:"MiamiImage")!))
        myCollegeObject.append(CollegeClass(Name: "Indiana University", Type: "Public", Population: "38,000", URL: "https://kelley.iu.edu", Image: UIImage(named:"default")!))
        myCollegeObject.append(CollegeClass(Name: "University of Illinois", Type: "Public", Population: "33,000", URL: "http://illinois.edu", Image: UIImage(named:"IllinoisImage")!))
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }
    
    @IBAction func myButtonTapped(_ sender: AnyObject)
    {
    
        let alert = UIAlertController(title: "Add college", message: nil, preferredStyle: .alert)
        
        alert.addTextField
            {
                (titleTextField) in titleTextField.placeholder = "Add college here"
            }
        
        alert.addTextField
            {
                (populationTextField) in populationTextField.placeholder = "Add population here"
            }
        
        alert.addTextField
            {
                (urlTextField) in urlTextField.placeholder = "Click Url here"
            }
        
        let addAction = UIAlertAction(title: "Add College", style: .default) { (addAction) -> Void in
        
            let titleTextField = alert.textFields?[0]
            let populationTextField = alert.textFields?[1]
            let urlTextField = alert.textFields?[2]
            
            
            self.myCollegeObject.append(CollegeClass(Name: (titleTextField?.text)!, Population: (populationTextField?.text)!, URL: (urlTextField?.text)!))
            
            self.myTableView.reloadData()
        }
        
        alert.addAction(addAction)
    
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
         alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //required function - sets numeber of rows in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    
    
    //required function - sets the cells in TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //sets cell identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = myCollegeObject[indexPath.row].name
        
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].name
        cell.imageView?.image = myCollegeObject[indexPath.row].image
        
        
        return cell
    }
    
    
    
    //allows you to delete the row
    @IBAction func deleteButton(_ sender: AnyObject)
    {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            myCollegeObject.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as!
        detailViewController
        var selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.collegeDetail = myCollegeObject[selectedRow!]
    }
    

}

