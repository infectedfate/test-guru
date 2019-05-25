class TestPassage < ApplicationRecord

  SUCCESS_PERSENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    if correct_answer(answer_ids)
      self.correct_questions += 1
    end
  end

  def completed?
    current_question.nil?
  end

  def correct_answers_percent
    (correct_answers.to_f / test.questions.count.to_f) * 100
  end

  def successfully_completed?
    correct_answers_percent >= SUCCESS_PERSENT
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end
  
  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_questions.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def next_question
    test.questions
        .order(:id)
        .where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end
end
