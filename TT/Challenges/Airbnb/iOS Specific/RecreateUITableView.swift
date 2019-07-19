//
//  RecreateUITableView.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import UIKit



protocol HorizontalTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfColumnsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForColumnAt indexPath: IndexPath) -> UITableViewCell
    
}

class HorizontalTableViewCell: UIView {
    
}

class HorizontalTableView: UIScrollView {
    
    var dataSource: HorizontalTableViewDataSource!
    
    
    
}

/*
 前两轮是behavioral, 比较放松。
 
 【第三轮 iOS】: Implement a UIImage Category that supports LRU Image Cache with cache size of 10 images [only memory level cache]
 要理解Category，其次是LRU Caching。这个问题应该会用到:
 
 - download an image from an URL without blocking the main thread，因为这道题给你的只有一个url，然后面试官说了不能block main thread.
 - dispatch to another queue for async image fetching, then return to main thread for the rest of the execution.
 - NSMutableDictionary for caching, NSMutableArray for LRU (也可以用别的实现)
 - Singleton pattern，像[YouCacheManager sharedManager]，这样整个project只需要initialize一个manager object就行，当时我这么写了之后面试官马上反应:here you go!
 - custom block, 因为code已经在async block里了，所以我当时写了一个completion block来传回下载好的或是从cache里找出来的image
 
 写完了之后面试官说可以过了，我们来聊天 :)
 如果对这题还有疑问的话，可以谷歌一下SDWebImage，这道题其实就是写一个屌丝版SDWebImage的Caching功能. From 1point 3acres bbs
 . From 1point 3acres bbs
 【第四轮 iOS】Imagine UITableView and UICollectionView haven't been invented yet, implement a Horizontal Table View that recycles memories.
 之前我在别的面经上看到过这题，但那个面经没说不能直接subclass UITableView :( 我原本以为horizontal table view不就是把正常的UITableView旋转90度，然后每个cell再转负90度，就能达到理想的效果了... 面试官说this is not the prefered way, you should start by subclassing UIScrollView 好吧，那这题突然一下子复杂了好多，可以分为这几布
 
 - create your own dataSource protocals: 就像UITableView 一样，你需要numberOfRows(这里变成了columns)和cellForRowAtIndexPath(cellforColumn)等等功能让你的dataSource去完成
 - initialization: 先别管怎么recycle memory, 首先要把屏幕里能装下的cells显示出来
 - get call back when user scroll your view: 为recycle memory做准备。因为我们subclass的已经是一个UIScrollView了，所以可以直接delegate给自己，然后得到scrollViewDidScroll的call back
 - recycle memory: 当有cells被滑动到屏幕外边了之后(通过上一步来判断)，把这些cells装到一个queue上，然后新的cells来重复使用这个queue里的memory, 原理和UITableView一模一样。不过当时面试官说不用queue这么复杂了，这里用一个set就行。
 
 当时写到第四步时，时间就到了，面试官问我如果还有时间多的话，接下来你会怎么写，我说了说。
 
 【第五轮 算法】考过无数遍的Text Justification, 一遍过
 
 这里还需要说明的一点是：Airbnb包括很多其他公司，他们的iOS Team很小，Airbnb只有15人，所以他们对你的expectation会很高。虽然iOS申请的人相对少，但同时bar也会很高。. c
 */
