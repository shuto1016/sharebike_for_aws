User.create!(
  [
    {
      email: 'test@test.com',
      password: '111111',
      nickname: 'テスト太郎',
    },
    {
      email: 'test2@test.com',
      password: '111111',
      nickname: 'テスト太郎2',
    }
  ]

)

Article.create!(
  [
    {
      user_id: '1',
      title: 'アイウエオ',
      text: '今日は暑い'
    },
    {
      user_id: '2',
      title: 'かくけこ',
      text: '今日は寒い'
    }
  ]

)