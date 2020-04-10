//
//  SVGConvertController.swift
//  SVGToSwift
//
//  Created by Le Quang on 10/12/18.
//  Copyright © 2018 Le Viet Quang. All rights reserved.
//

import Foundation
import Cocoa

enum SVGType {
    case Path
    case Graph
    case File
}

class SVGConvertController: NSViewController {
    
    @IBOutlet weak var controlView: NSView!
    @IBOutlet weak var outputScrollView: NSScrollView!

    @IBOutlet weak var nameTF: NSTextField!
    @IBOutlet var inputTF: NSTextView!
    
    @IBOutlet weak var typeSelectPopup: NSPopUpButton!
    @IBOutlet weak var langSelect: NSPopUpButton!
    @IBOutlet weak var actionView: NSView!
    @IBOutlet weak var configView: NSView!

    @IBOutlet weak var cssTF: NSScrollView!
    private var outputTextView:NSTextView!
    
    var viewModel = SVGConvertViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    //MARK:--
    //MARK: Method
    private func convertPath(){
        let name = self.nameTF.stringValue
        let input = self.inputTF.string
        
        let text = String.getCode(svgPath: input, name: name)
        self.outputTextView.string = text
    
        self.outputTextView.sizeToFit()
    }
    
    private func convertGraph(){
        let name = self.nameTF.stringValue
        let input = self.inputTF.string
        
        let manager = SVGXMLManager.init(input, name: name)
        self.outputTextView.string = manager.code
        self.outputTextView.sizeToFit()
    }
    
    private func convertFile(){
        let name = self.nameTF.stringValue
        let input = self.inputTF.string
        let manager = SVGXMLManager.init(input, name: name)
        let model = manager.parseXMLFile()
        
        if manager.cssText != nil {
            //self.cssTF.string = manager.cssText
        }
    }
    
    //MARK:--
    //MARK: Action
    @IBAction func selectLanguage(_ sender: NSPopUpButton) {
        if let title = sender.selectedItem?.title {
            if let ele = LanguageName.init(rawValue: title) {
                self.viewModel.langType = ele
                return;
            }
        }
        self.viewModel.langType = LanguageName.Swift
    }
    
    
    @IBAction func selectType(_ sender: NSPopUpButton) {
        if let title = sender.selectedItem?.title {
            if let ele = SVGElementName.init(rawValue: title) {
                self.viewModel.svgType = ele
                return;
            }
        }
        self.viewModel.svgType = SVGElementName.rect
    }
    
    
    @IBAction func convertSVGAction(_ sender: NSButton) {
        self.viewModel.updateSVGData(self.inputTF.string, name: self.nameTF.stringValue)
        self.viewModel.convertSVG(self.viewModel.rootModel, 0) { [weak self](result) in
            switch result {
            case .success(let txt) :
                if let strongSelf = self {
                    strongSelf.outputTextView.string = txt
                    strongSelf.outputTextView.sizeToFit()
                }
                break
            case .failure(let err) :
                if let strongSelf = self {
                    strongSelf.outputTextView.string = err.getMessage()
                    strongSelf.outputTextView.sizeToFit()
                }
                break
            }
        }
    }
    
    @IBAction func saveCodeToFile(_ sender: NSButton) {
        let data = self.outputTextView.string
        if data != "" {
            let mySave = NSSavePanel()
            mySave.allowedFileTypes = ["txt"]
            
            mySave.begin { (result) -> Void in
                
                if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    let filename = mySave.url
                    
                    do {
                        try data.write(to: filename!, atomically: true, encoding: String.Encoding.utf8)
                    } catch {
                        // failed to write file (bad permissions, bad filename etc.)
                    }
                    
                } else {
                    __NSBeep()
                }
            }
        }
    }
    
    func setupView(){
       self.outputTextView = NSTextView.init(frame: CGRect.init(origin: CGPoint.zero, size: self.outputScrollView.frame.size))
        self.outputScrollView.documentView = self.outputTextView
        self.updateSelectType(self.typeSelectPopup)
        self.updateLangSelect(self.langSelect)
    }
    
    func updateSelectType(_ popup:NSPopUpButton, ele:SVGElementName = SVGElementName.circle) {
        for name in ele.alls() {
            popup.addItem(withTitle: name.rawValue)
        }
    }
    
    func updateLangSelect(_ popup:NSPopUpButton, ele:LanguageName = .Obj){
        for name in ele.all() {
            popup.addItem(withTitle: name.rawValue)
        }
    }
}
