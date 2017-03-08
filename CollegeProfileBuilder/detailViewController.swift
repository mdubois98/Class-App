//
//  detailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Student on 2/10/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit
import SafariServices

class detailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var collegeDetail: CollegeClass!
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var popluationTextField: UITextField!
    @IBOutlet weak var typeDetail: UITextField!
    
    let imagePicker = UIImagePickerController()
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        imagePicker.delegate = self
        myImageView.image = collegeDetail.image
        titleTextField.text = collegeDetail.name
        popluationTextField.text = collegeDetail.population
        typeDetail.text = collegeDetail.type
    }
    
    @IBAction func saveButton(_ sender: AnyObject)
    {
        
        collegeDetail.name = titleTextField.text!
        collegeDetail.population = popluationTextField.text!
        collegeDetail.type = typeDetail.text!
    }
    
    
    @IBAction func open(_ sender: AnyObject)
    {
        let urlString = URL(string: collegeDetail.url)
//
//        //UIApplication.shared.openURL(urlString)
//        //allows user to switch to safari permanently
//        let svc = SFSafariViewController(url: urlString!)
//        // let svc = SFSafariViewController(url: urlString)
//        present(svc, animated: true, completion: nil)
        
        UIApplication.shared.openURL(urlString!)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //info p list; add p list camera usage description; photo library usage
    
    @IBAction func changeImage(_ sender: AnyObject)
    {
        getPhotoLibrary()
    }
    func getPhotoLibrary()
    {
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true)
            
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            self.myImageView.image = selectedImage
            
        }
    }
    @IBAction func mapSearchBar(_ sender: AnyObject) {
    }
    
}

