module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создать #{question.test.title} вопрос"
    else
      "Редактировать #{question.test.title} вопрос"
    end
  end
end
