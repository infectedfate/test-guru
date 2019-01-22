categories = Category.create(
  [{ title: 'Frontend' },
   { title: 'Backend' }]
)

users = User.create(
  [{ mail: 'first@mail.com', name: :firstuser },
   { mail: 'second@mail.com', name: :seconduser }]
)

tests = Test.create(
  [{ title: 'CSS', level: 1, category_id: categories[0].id },
   { title: 'HTML', level: 1, category_id: categories[0].id },
   { title: 'Ruby', level: 2, category_id: categories[1].id },
   { title: 'Python', level: 3, category_id: categories[1].id }]
)

questions = Question.create(
  [{ body: 'HTML question #1', test_id: tests[0].id },
   { body: 'CSS question #1', test_id: tests[1].id },
   { body: 'Ruby question #1', test_id: tests[2].id },
   { body: 'Python question #1', test_id: tests[3].id }]
)

TestsUser.create(
  [{ user_id: users[0], test_id: tests[0] },
   { user_id: users[1], test_id: tests[1] }]
)
