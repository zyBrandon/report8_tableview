//
//  ViewController.swift
//  table_view
//
//  Created by 周越 on 2018/11/26.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    class Person {
        var name:String
        var age:Int
        
        init(name:String,age:Int) {
            self.name = name
            self.age = age
        }
    }
    
    class Student:Person {
        var sno:Int
        
        
        init(name:String,age:Int,sno:Int) {
            self.sno = sno
            super.init(name: name, age: age)
            
        }
    }
    
    class Teacher:Person {
        var tno:Int
        init(name:String,age:Int,tno:Int) {
            self.tno = tno
            super.init(name: name, age: age)
            
        }
        
    }
    
    var stuArr = [Student]()
    var teaArr = [Teacher]()
    var perArr = [Person]()
    
    
    
    @IBOutlet weak var chooseLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var perTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stu1 = Student(name: "zy", age: 10, sno: 1)
        let stu2 = Student(name: "xiumei", age: 19, sno: 2)
        let stu3 = Student(name: "zyy", age: 20, sno: 3)
        stuArr.append(stu1)
        stuArr.append(stu2)
        stuArr.append(stu3)
        
        let tea1 = Teacher(name: "lxh", age: 30, tno: 1)
        let tea2 = Teacher(name: "lgy", age: 50, tno: 2)
        teaArr.append(tea1)
        teaArr.append(tea2)
        
        perArr.append(stu1)
        perArr.append(stu2)
        perArr.append(stu3)
        perArr.append(tea1)
        perArr.append(tea2)
        
    }
    
    
    @IBAction func addClicked(_ sender: Any) {
        if let name = nameTextField.text {
            var namePer = Student(name: name, age: 0, sno: 1)
            
            perArr.append(namePer)
            perTableView.reloadData()
        }
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        perTableView.isEditing = !perTableView.isEditing
    }
    
    @IBAction func editClicked(_ sender: Any) {
        if let row = perTableView.indexPathForSelectedRow?.row {
            if let name = nameTextField.text {
                perArr[row] = Student(name: name, age: 0, sno: 1)
                perTableView.reloadData()
            }
            
        }
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return perArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
        
        for i in perArr{
            if i is Student {
                stuArr.append(i as! ViewController.Student)
            } else {
                teaArr.append(i as! ViewController.Teacher)
            }
        }
        let stu = stuArr[indexPath.row]
        let tea = teaArr[indexPath.row]
        
        cell.name.text = stu.name
        cell.age.text = "\(stu.age)"
        
        cell1.name.text = tea.name
        cell1.name.sizeToFit()
        cell.name.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "you choose name:\(perArr[indexPath.row].name) age:\(perArr[indexPath.row].age)"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stuArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = stuArr.remove(at: sourceIndexPath.row)
        stuArr.insert(source, at: destinationIndexPath.row)
    }
}

