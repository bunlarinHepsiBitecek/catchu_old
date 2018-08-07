//
//  SectionBasedGroup.swift
//  catchu
//
//  Created by Erkut Baş on 8/7/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class SectionBasedGroup {
    
    public static var shared = SectionBasedGroup()
    
    private var _user : User
    private var _userGroupList : [Group] = []
    private var _userGroupSortedList : [Group] = []
    private var _userGroupSortedDictionary : [String : Group] = [:]
    private var _keyData : Array<String>
    
    private var _sectionDictionaryForGroups = NSDictionary() as! [String : [Group]]
    private var _groupNameInitialBasedDictionary : Dictionary<String, [Group]>!
    private var _groupSectionKeyData : Array<String>!
    
    
    var user : User {
        get {
            return _user
        }
        set {
            _user = newValue
        }
    }
    
    var userGroupList : [Group] {
        get {
            return _userGroupList
        }
        set {
            _userGroupList = newValue
        }
    }
    
    var userGroupSortedList : [Group] {
        get {
            return _userGroupSortedList
        }
        set {
            _userGroupSortedList = newValue
        }
    }
    
    var userGroupSortedDictionary : [String : Group] {
        get {
            return _userGroupSortedDictionary
        }
        set {
            _userGroupSortedDictionary = newValue
        }
    }
    
    var keyData : Array<String> {
        get {
            return _keyData
        }
        set {
            _keyData = newValue
        }
    }
    
    var sectionDictionaryForGroups : [String : [Group]] {
        get {
            return _sectionDictionaryForGroups
        }
        set {
            _sectionDictionaryForGroups = newValue
        }
    }
    
    var groupNameInitialBasedDictionary : Dictionary<String, [Group]> {
        get {
            return _groupNameInitialBasedDictionary
        }
        set {
            _groupNameInitialBasedDictionary = newValue
        }
    }
    
    var groupSectionKeyData: Array<String> {
        get {
            return _groupSectionKeyData
        }
        set {
            _groupSectionKeyData = newValue
        }
    }
    
    init() {
        
        _user = User()
        _keyData = []
        
        _groupNameInitialBasedDictionary = Dictionary<String, [Group]>()
        _groupSectionKeyData = Array<String>()
        
    }
    
    
    func sortUserGroupList() {
        
        _userGroupSortedList = _userGroupList.sorted(by: { $0.groupName < $1.groupName })
        
    }
    
    func loadSortedDictionary() {
        
        for item in _userGroupSortedList {
            
            _userGroupSortedDictionary[item.groupID] = item
            
        }
        
    }
    
    func emptySectionBasedGroupData() {
        _groupNameInitialBasedDictionary.removeAll()
    }
    
    func createInitialLetterBasedGroupDictionary() {
        
        Group.shared.createSortedGroupList()
        
        for item in Group.shared.groupSortedList {
            
            if item.groupName.hasPrefix(Constants.LetterConstants.A) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.A] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.A] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.A]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.A]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.B){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.B] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.B] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.B]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.B]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.C) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.C] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.C] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.C]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.C]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.D){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.D] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.D] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.D]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.D]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.E) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.E] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.E] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.E]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.E]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.F){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.F] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.F] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.F]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.F]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.G) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.G] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.G] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.G]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.G]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.H){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.H] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.H] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.H]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.H]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.I) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.I] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.I] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.I]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.I]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.J){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.J] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.J] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.J]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.J]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.K) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.K] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.K] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.K]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.K]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.L){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.L] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.L] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.L]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.L]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.M) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.M] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.M] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.M]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.M]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.N){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.N] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.N] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.N]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.N]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.O) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.O] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.O] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.O]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.O]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.P){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.P] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.P] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.P]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.P]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.Q) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Q] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Q] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Q]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Q]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.R) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.R] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.R] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.R]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.R]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.S){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.S] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.S] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.S]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.S]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.T) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.T] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.T] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.T]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.T]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.U){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.U] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.U] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.U]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.U]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.V) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.V] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.V] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.V]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.V]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.W){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.W] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.W] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.W]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.W]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.X) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.X] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.X] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.X]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.X]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.Y){
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Y] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Y] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Y]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Y]?.append(item)
                }
                
            } else if item.groupName.hasPrefix(Constants.LetterConstants.Z) {
                
                if SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Z] == nil {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Z] = [Group]()
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Z]?.append(item)
                } else {
                    SectionBasedGroup.shared._groupNameInitialBasedDictionary[Constants.LetterConstants.Z]?.append(item)
                }
            }
            
        }
        
        _groupSectionKeyData = Array(groupNameInitialBasedDictionary.keys).sorted()
        
    }

    func returnSectionNumber(index : Int) -> Int {
        
        if groupSectionKeyData[index] == Constants.LetterConstants.A {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.A]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.B {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.B]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.C {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.C]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.D {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.D]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.E {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.E]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.F {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.F]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.G {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.G]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.H {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.H]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.I {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.I]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.J {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.J]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.K {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.K]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.L {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.L]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.M {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.M]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.N {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.N]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.O {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.O]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.P {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.P]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.Q {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.Q]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.R {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.R]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.S {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.S]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.T {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.T]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.U {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.U]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.V {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.V]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.W {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.W]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.X {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.X]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.Y {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.Y]?.count)!
            
        } else if groupSectionKeyData[index] == Constants.LetterConstants.Z {
            
            return (groupNameInitialBasedDictionary[Constants.LetterConstants.Z]?.count)!
            
        } else {
            
            return 0
            
        }
        
    }
    
    func returnGroupFromSectionBasedDictionary(indexPath : IndexPath) -> Group {
        
        if indexPath.section == Constants.NumberOrSections.section0 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section1 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section2 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section3 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section4 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section5 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section6 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section7 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section8 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section9 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section10 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section11 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section12 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section13 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section14 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section15 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section16 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section17 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section18 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section19 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section20 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section21 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section22 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section23 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section24 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section25 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section26 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section27 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section28 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section29 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else if indexPath.section == Constants.NumberOrSections.section30 {
            
            if let groupArray : [Group] = groupNameInitialBasedDictionary[groupSectionKeyData[indexPath.section]] {
                return groupArray[indexPath.row]
            } else {
                return Group()
            }
            
        } else {
            
            return Group()
        }
    }
    
    
    
}
