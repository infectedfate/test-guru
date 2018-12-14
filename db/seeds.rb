categories = Category.create([{ title: :frontend }, { title: :backend }])

users = User.create(
  [{ email: 'first@mail.com', username: :firstuser },
   { email: 'second@mail.com', username: :seconduser }]
)


tests = Test.create(
  [{ title: 'CSS', level: 1, category_id: categories[1].id,},
  { title: 'HTML', level: 1, category_id: categories[1].id },
  { title: 'Ruby', level: 2, category_id: categories[2].id },
  { title: 'Python', level: 3, category_id: categories[2].id,}]
)

questions = Question.create(
  [{ body: 'HTML question #1', test_id: tests[0].id },
   { body: 'CSS question #1', test_id: tests[1].id },
   { body: 'Ruby question #1', test_id: tests[2].id },
   { body: 'Python question #1', test_id: tests[3].id }]
)
