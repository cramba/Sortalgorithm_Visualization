//
//  ViewController.swift
//  SortalgorithmAbi
//
//  Created by Marc Bachmann on 01.07.18.
//  Copyright © 2018 Marc Bachmann. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    // var cityvar: Cityclass = Cityclass() swift
    // Cityclass cityvar = new Cityclass() java
    // -> Rückgabewert
    // Referenzen auf Steuerelemente
    @IBOutlet weak var lblInsertTime: NSTextField!
    @IBOutlet weak var lblBubbleTime: NSTextField!
    @IBOutlet weak var lblMergeTime: NSTextField!
    @IBOutlet weak var popUpSelection: NSPopUpButton!
    
    @IBOutlet weak var graphView: Sortgraph!
    
    //Instanz der SortingAlgorithm Klasse zur Performancemessung
    var sort: SortingAlgorithm = SortingAlgorithm([])
    //Instanz der InsertSortStepByStep Klasse zur Visualisierung der Sortierung
    var insertSortSbs: InsertSortStepByStep = InsertSortStepByStep([])
    //Instanz der BubbleSortStepByStep Klasse zur Visualisierung der Sortierung
    var bubbleSortSbs: BubbleSortStepByStep = BubbleSortStepByStep([])
    
    var numberOfValues = 10
    let maxValue = 320
    
    //Deklaration der Variablen für die RandomArray Instanz zum Erstellen von Arrays mit Zufallszahlen
    var randomArray: RandomArray?
    
    //Wird ausgeführt wenn View fertig geladen ist
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Anzahl der Zufallszahlen (Arraygröße) wird berechnet auf Grund der verfügbaren Zeichenfläche ...
        self.numberOfValues =  Int((Int(graphView.visibleRect.width) - graphView.leftOffset * 2) / graphView.lineSpace)
        //RandomArray Instanz wird erstellt
        self.randomArray = RandomArray(count: self.numberOfValues, max: self.maxValue)
        //Erzeuge Zufallszahlen und speichere Sie in den verschiedenen Sortierklassen
        createArray()
        
        popUpSelection.removeAllItems()
        popUpSelection.addItem(withTitle: String(self.numberOfValues))
        popUpSelection.addItem(withTitle: "100")
        popUpSelection.addItem(withTitle: "1000")
        popUpSelection.addItem(withTitle: "10000")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func btnUnsortedData(_ sender: NSButton) {
        graphView.values = self.sort.values
    }
    
    //eine neue unsortierte Grafik wird erzeugt
    @IBAction func btnReset(_ sender: NSButton) {
        createArray()
    }
    
    //Die Grafik wird mit dem Insertsort Verfahren sortiert
    @IBAction func btnInsertSort(_ sender: NSButton) {
        createArrayForVisualizing()
        self.insertSortSbs.stepAhead(graphView)
        //graphView.values = sort.insertSort()
       ////// sort.insertSort(graphView)
    }
    
    //Die Grafik wird mit dem Bubblesort Verfahren sortiert
    @IBAction func btnBubbleSort(_ sender: NSButton) {
        createArrayForVisualizing()
        self.bubbleSortSbs.stepAhead(graphView)
        //graphView.values = sort.bubbleSort()
    }
   
    //Die Grafik wird mit dem Mergesort Verfahren sortiert
    @IBAction func btnMergeSort(_ sender: NSButton) {
        createArrayForVisualizing()
        graphView.values = sort.mergeSort()
    }
    
    //Zeitmessung der Sortiermethoden
    @IBAction func btnRunAll(_ sender: NSButton) {
        createArrayForTimeMeasure()

        var start = DispatchTime.now()
        var sortedArray = self.sort.bubbleSort()
        var end = DispatchTime.now()
        var nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        var timeInterval = Double(nanoTime) / 1_000_000_000
        lblBubbleTime.stringValue = String(format: "%.4f sec", timeInterval)
        
        start = DispatchTime.now()
        sortedArray = self.sort.insertSort()
        end = DispatchTime.now()
        nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        timeInterval = Double(nanoTime) / 1_000_000_000
        lblInsertTime.stringValue = String(format: "%.4f sec", timeInterval)
        
        start = DispatchTime.now()
        sortedArray = self.sort.mergeSort()
        end = DispatchTime.now()
        nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        timeInterval = Double(nanoTime) / 1_000_000_000
        //graphView.values = sortedArray
        lblMergeTime.stringValue = String(format: "%.4f sec", timeInterval)
    }
    
    //Erzeuge Zufallszahlen und speichere Sie in den verschiedenen Sortierklassen und triggere auch die Grafik
    func createArray () {
        self.sort.values = (self.randomArray?.createRandomArray())!
        //zeige die Werte auch grafisch im GraphView an
        graphView.values = self.sort.values
        self.insertSortSbs.values = self.sort.values
        self.bubbleSortSbs.values = self.sort.values
    }
    
    //Erzeuge Zufallszahlen für Zeitmessung und speichere Sie in SortAlgorithm Instanz (self.sort)
    func createArrayForTimeMeasure() {
        self.randomArray?.count = Int(popUpSelection.titleOfSelectedItem!)!
        self.sort.values = (self.randomArray?.createRandomArray())!
    }
    
    //Erzeuge Zufallszahlen für Visualisierung und speichere Sie in den verschiedenen Sortierklassen
    func createArrayForVisualizing() {
        if (self.sort.values.count != numberOfValues) {
            self.randomArray?.count = self.numberOfValues // wert auf 89 setzen
            self.sort.values = (self.randomArray?.createRandomArray())!
            self.insertSortSbs.values = self.sort.values
            self.bubbleSortSbs.values = self.sort.values
            popUpSelection.selectItem(withTitle: String(self.numberOfValues)) //titel wird auf 89 gesetzt
        }
    }
//    self. = zugriff auf Klassenvariable
    
}

