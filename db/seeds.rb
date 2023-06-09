# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
               { id: 1001, email: 'test1@example.com', password: 'aaaaaa', nickname: '太郎', uid: SecureRandom.uuid,
                 confirmed_at: Time.zone.now, birthday: '1999-04-15', place: '東京都', link: 'https://tweetcloneabc.herokuapp.com/',
                 profile: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは' },
               { id: 1002, email: 'test2@example.com', password: 'bbbbbb', nickname: '一郎', uid: SecureRandom.uuid,
                 confirmed_at: Time.zone.now, birthday: '1999-04-15' },
               { id: 1003, email: 'test3@example.com', password: 'cccccc', nickname: '二郎', uid: SecureRandom.uuid,
                 confirmed_at: Time.zone.now, place: '東京都' },
               { id: 1004, email: 'test4@example.com', password: 'dddddd', nickname: '三郎', uid: SecureRandom.uuid,
                 confirmed_at: Time.zone.now, place: '東京都', link: 'https://tweetcloneabc.herokuapp.com/' },
               { id: 1005, email: 'test5@example.com', password: 'eeeeee', nickname: '四郎', uid: SecureRandom.uuid,
                 confirmed_at: Time.zone.now, place: '東京都', link: 'https://tweetcloneabc.herokuapp.com/',
                 profile: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは' },
               { id: 1006, email: 'test6@example.com', password: 'ffffff', nickname: '五郎', uid: SecureRandom.uuid,
                 confirmed_at: Time.zone.now, profile: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは' },
               { id: 1007, email: 'test7@example.com', password: 'gggggg', nickname: '六郎', uid: SecureRandom.uuid,
                 confirmed_at: Time.zone.now }
             ])
Tweet.create!([
                { body: 'おはようございます', user_id: 1001 },
                { body: 'おはようございます', user_id: 1001 },
                { body: 'こんにちは', user_id: 1002 },
                { body: 'おはようございます', user_id: 1001 },
                { body: 'こんにちは', user_id: 1002 },
                { body: 'こんにちは', user_id: 1002 },
                { body: '初めまして', user_id: 1003 },
                { body: '初めまして', user_id: 1003 },
                { body: '初めまして', user_id: 1003 },
                { body: 'こんばんは', user_id: 1004 },
                { body: 'こんばんは', user_id: 1004 },
                { body: 'こんばんは', user_id: 1004 },
                { body: 'よろしくお願いします', user_id: 1005 },
                { body: 'よろしくお願いします', user_id: 1005 },
                { body: 'よろしくお願いします', user_id: 1005 },
                { body: 'いただきます', user_id: 1006 },
                { body: 'いただきます', user_id: 1006 },
                { body: 'いただきます', user_id: 1006 },
                { body: 'ごちそうさまです', user_id: 1007 },
                { body: 'ごちそうさまです', user_id: 1007 },
                { body: 'ごちそうさまです', user_id: 1007 }
              ])
Relationship.create!([
                       { follower_id: 1001, followed_id: 1002 },
                       { follower_id: 1001, followed_id: 1005 },
                       { follower_id: 1002, followed_id: 1003 },
                       { follower_id: 1002, followed_id: 1004 },
                       { follower_id: 1003, followed_id: 1001 },
                       { follower_id: 1003, followed_id: 1006 },
                       { follower_id: 1003, followed_id: 1007 }
                     ])
Comment.create!([
                  { user_id: 1001, tweet_id: 2, comment: 'よろしく' },
                  { user_id: 1002, tweet_id: 3, comment: 'よろしく' },
                  { user_id: 1003, tweet_id: 4, comment: 'よろしく' },
                  { user_id: 1004, tweet_id: 5, comment: 'よろしく' },
                  { user_id: 1005, tweet_id: 6, comment: 'よろしく' },
                  { user_id: 1006, tweet_id: 7, comment: 'よろしく' },
                  { user_id: 1007, tweet_id: 8, comment: 'よろしく' }
                ])
Favorite.create!([
                   { user_id: 1001, tweet_id: 9 },
                   { user_id: 1002, tweet_id: 3 },
                   { user_id: 1003, tweet_id: 4 },
                   { user_id: 1004, tweet_id: 5 },
                   { user_id: 1005, tweet_id: 6 },
                   { user_id: 1006, tweet_id: 7 },
                   { user_id: 1007, tweet_id: 8 }
                 ])
Retweet.create!([
                  { user_id: 1001, tweet_id: 9 },
                  { user_id: 1002, tweet_id: 3 },
                  { user_id: 1003, tweet_id: 4 },
                  { user_id: 1004, tweet_id: 5 },
                  { user_id: 1005, tweet_id: 6 },
                  { user_id: 1006, tweet_id: 7 },
                  { user_id: 1007, tweet_id: 8 }
                ])
Bookmark.create!([
                   { user_id: 1001, tweet_id: 9 },
                   { user_id: 1001, tweet_id: 12 },
                   { user_id: 1002, tweet_id: 3 },
                   { user_id: 1003, tweet_id: 4 },
                   { user_id: 1004, tweet_id: 5 },
                   { user_id: 1005, tweet_id: 6 },
                   { user_id: 1006, tweet_id: 7 },
                   { user_id: 1007, tweet_id: 8 }
                 ])
