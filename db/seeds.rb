categories = Category.create([{ title: 'Frontend' }, { title: 'Backend' }])

users = User.create(
  [{ email: 'first@mail.com', username: :firstuser },
   { email: 'second@mail.com', username: :seconduser }]
)

tests = Test.create(
  [{ title: 'CSS', level: 1 },
   { title: 'HTML', level: 1 },
   { title: 'Ruby', level: 2 },
   { title: 'Python', level: 3 }]
)

questions = Question.create(
  [{ body: 'HTML question #1', test_id: tests[0].id },
   { body: 'CSS question #1', test_id: tests[1].id },
   { body: 'Ruby question #1', test_id: tests[2].id },
   { body: 'Python question #1', test_id: tests[3].id }]
)
