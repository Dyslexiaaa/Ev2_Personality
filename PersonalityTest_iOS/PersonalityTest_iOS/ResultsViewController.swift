//
//  ResultsViewController.swift
//  PersonalityTest_iOS
//
//  Created by Alumno on 08/04/24.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true
        
    }
    
    func calculatePersonalityResults(){
        var frecuencyOfAnswers : [AnimalType: Int] = [:]
        let responseTypes = responses.map{
            $0.type
        }
        for response in responseTypes{
            frecuencyOfAnswers[response] = (frecuencyOfAnswers[response] ?? 0) + 1
        }
        let frecuentAnswersSorted = frecuencyOfAnswers.sorted(by: {
            (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frecuentAnswersSorted.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
