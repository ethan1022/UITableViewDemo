//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by Ethan on 2016/10/31.
//  Copyright © 2016年 Ethan. All rights reserved.
//

import UIKit

// 2.將UITableViewDelegate和UITableViewDataSource的protocol寫在此，讓viewController可以取用UITableView相關的function
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 1. 先將storyboard上新增的tableView與viewController做連結
    @IBOutlet weak var tableViewDemo:UITableView!
    
    // 3. 簡單設定好要demo的變數
    var arr = ["one", "two", "three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. 相當重要的一個步驟，就是委託viewController來執行UITableView所要執行的內容，也就是設定viewController為UITableView的委託人(一個比喻)，同時也設定tableView的dataSource是從viewController來的
        self.tableViewDemo.delegate = self
        self.tableViewDemo.dataSource = self
        
    }

    // 5. 3個必須定義好，有關tableView的function
    // numberOfSectionde為設定這個tableview有幾個section，return 1代表有1個section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // numberOfRowInSection 是指這個1個section有幾個row，這邊arr.count是指有arr這個array的內容數量一樣的row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    // 這邊則是進一步設定cell的內容，因為我們已經在之前storyboard那邊設定了cell的風格(style)以及identifier，所以我們可以直接設定cell的textLabel為arr的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeueReusableCell是當tableView中的cell超過螢幕範圍時，往下滑動後所產生的cell，是重複利用之前已經滑出畫面的cell的方法
        let cell = tableViewDemo.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

