//
//  DataOfSources.swift
//  WallPaper
//
//  Created by User on 7/4/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation
let categories = ["Abstracts","Animals","Cities","Science","Flowers","Sports","Mountains","Underwater","Nature","Other"]


var json_imageHome:[String] = []

var json_idImageHome:[String] = []

var json_LiveImageHome:[String] = []

var json_categoriesicon:[String] = []

var json_idCategoriesIcon:[String] = []

var json_categories_SeeAll:[String] = []

var json_idCategories_SeeAll:[String] = []


var ClickCategories = [[String : AnyObject]]()

var dictionary_cate:String = ""

var photosListBuffer:Array<UserInfo> = [UserInfo]()

var downloadedData = ""