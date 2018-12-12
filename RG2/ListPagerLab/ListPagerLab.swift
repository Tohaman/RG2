//
//  ListPagerLab.swift
//  Test1
//
//  Created by Anton on 27.11.2018.
//  Copyright © 2018 Tohaman. All rights reserved.
//

import Foundation

protocol Phases {
    func phase () -> String
    func titles () -> [String]
    func images () -> [String]
    func descs () -> [String]
    func urls () -> [String]
    func comments () -> [String]
}


class ListPagerLab {
    var listPagers : [ListPager] = []
    
    private init() {
        phaseInit(phasesStrings: MainMenu())
        phaseInit(phasesStrings: G2F())
        
        phaseInit(phasesStrings: Begin3x3())
        phaseInit(phasesStrings: Rozov3x3())
    }
    static let shared = ListPagerLab()
    
    private func phaseInit(phasesStrings : Phases) {
        let phase = phasesStrings.phase()
        let titles = phasesStrings.titles()
        let images = phasesStrings.images()
        let descrs = phasesStrings.descs()
        let urls = phasesStrings.urls()
        var comments = phasesStrings.comments()
        let count = titles.count
        
        for i in 0...count - 1 {
            if comments.count == 0 {
                listPagers.append(ListPager(phase: phase, id: i, title: titles[i], image: images[i], description: descrs[i], url: urls[i], comment: ""))
            } else {
                listPagers.append(ListPager(phase: phase, id: i, title: titles[i], image: images[i], description: descrs[i], url: urls[i], comment: comments[i]))
            }
        }
    }

    func getPhaseList (phase: String) -> [ListPager] {
        var lps : [ListPager] = []
        for item in listPagers {
            if item.phase == phase {
                lps.append(item)
            }
        }
        return lps
    }
    
    func getPhaseList4LP (phase: String) -> [ListPager] {
        var lps : [ListPager] = []
        for item in listPagers {
            if (item.phase == phase) && (item.url != "submenu") {
                lps.append(item)
            }
        }
        return lps
    }
    
    func getPhaseItem (phase: String, id: Int) -> ListPager {
        var lp = ListPager (phase: phase, id: id, title: "", image: "", description: "", url: "", comment: "")
        for item in listPagers {
            if (item.phase == phase) && (item.id == id) {
                lp = item
            }
        }
        return lp
    }
}
