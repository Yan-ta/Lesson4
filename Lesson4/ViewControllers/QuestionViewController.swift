//
//  QuestionViewController.swift
//  Lesson4
//
//  Created by Ян Таше on 25.03.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var slider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            slider.value = answerCount
        }
    }
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangeStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    private let questions = Question.getQuestion()
    private var currentIndex = 0
    private var answerChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[currentIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func singleButtonAnswerPress(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answerChoosen.append(currentAnswer)
        newQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChoosen.append(answer)
            }
        }
        newQuestion()
    }
    
    @IBAction func rangeAnswerButtonPress() {
        let index = Int(slider.value)
        answerChoosen.append(currentAnswers[index])
    }
}



extension QuestionViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[currentIndex]
        questionLabel.text = currentQuestion.text
        let totalProgress = Float(currentIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        title = "Вопрос № \(currentIndex + 1) из \(questions.count)"
        showCurrentStackView(for: currentQuestion.type)
    }
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangeStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangeStackView(with answers: [Answer]) {
        rangeStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func newQuestion() {
        currentIndex += 1
        
        if currentIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
