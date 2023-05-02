# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
               { id: 1, email: 'test1@example.com', password: 'bbbbbb', nickname: '太郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now, birthday: '1999-04-15', header_image: 'baroon.jpg', place: '東京都', link: 'https://tweetcloneabc.herokuapp.com/',
                 profile: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは' },
               { id: 2, email: 'test2@example.com', password: 'cccccc', nickname: '一郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now, birthday: '1999-04-15', header_image: 'baroon.jpg' },
               { id: 3, email: 'test3@example.com', password: 'dddddd', nickname: '二郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now, header_image: 'baroon.jpg', place: '東京都' },
               { id: 4, email: 'test4@example.com', password: 'eeeeee', nickname: '三郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now, header_image: 'baroon.jpg', place: '東京都', link: 'https://tweetcloneabc.herokuapp.com/' },
               { id: 5, email: 'test5@example.com', password: 'ffffff', nickname: '四郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now, header_image: 'baroon.jpg', place: '東京都', link: 'https://tweetcloneabc.herokuapp.com/',
                 profile: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは' },
               { id: 6, email: 'test6@example.com', password: 'gggggg', nickname: '五郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now, profile: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは' },
               { id: 7, email: 'test7@example.com', password: 'hhhhhh', nickname: '六郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now }
             ])
Tweet.create!([
                { body: 'おはようございます', user_id: 1 },
                { body: 'おはようございます', user_id: 1 },
                { body: 'こんにちは', user_id: 2 },
                { body: 'おはようございます', user_id: 1 },
                { body: 'こんにちは', user_id: 2 },
                { body: 'こんにちは', user_id: 2 },
                { body: '初めまして', user_id: 3 },
                { body: '初めまして', user_id: 3 },
                { body: '初めまして', user_id: 3 },
                { body: 'こんばんは', user_id: 4 },
                { body: 'こんばんは', user_id: 4 },
                { body: 'こんばんは', user_id: 4 },
                { body: 'よろしくお願いします', user_id: 5 },
                { body: 'よろしくお願いします', user_id: 5 },
                { body: 'よろしくお願いします', user_id: 5 },
                { body: 'いただきます', user_id: 6 },
                { body: 'いただきます', user_id: 6 },
                { body: 'いただきます', user_id: 6 },
                { body: 'ごちそうさまです', user_id: 7 },
                { body: 'ごちそうさまです', user_id: 7 },
                { body: 'ごちそうさまです', user_id: 7 }
              ])
Relationship.create!([
                       { follower_id: 1, followed_id: 2 },
                       { follower_id: 1, followed_id: 5 },
                       { follower_id: 2, followed_id: 3 },
                       { follower_id: 2, followed_id: 4 },
                       { follower_id: 3, followed_id: 1 },
                       { follower_id: 3, followed_id: 6 },
                       { follower_id: 3, followed_id: 7 }
                     ])
Comment.create!([
                  { user_id: 1, tweet_id: 2, comment: 'よろしく' },
                  { user_id: 2, tweet_id: 3, comment: 'よろしく' },
                  { user_id: 3, tweet_id: 4, comment: 'よろしく' },
                  { user_id: 4, tweet_id: 5, comment: 'よろしく' },
                  { user_id: 5, tweet_id: 6, comment: 'よろしく' },
                  { user_id: 6, tweet_id: 7, comment: 'よろしく' },
                  { user_id: 7, tweet_id: 8, comment: 'よろしく' }
                ])
Favorite.create!([
                   { user_id: 1, tweet_id: 9 },
                   { user_id: 2, tweet_id: 3 },
                   { user_id: 3, tweet_id: 4 },
                   { user_id: 4, tweet_id: 5 },
                   { user_id: 5, tweet_id: 6 },
                   { user_id: 6, tweet_id: 7 },
                   { user_id: 7, tweet_id: 8 }
                 ])
Retweet.create!([
                  { user_id: 1, tweet_id: 9 },
                  { user_id: 2, tweet_id: 3 },
                  { user_id: 3, tweet_id: 4 },
                  { user_id: 4, tweet_id: 5 },
                  { user_id: 5, tweet_id: 6 },
                  { user_id: 6, tweet_id: 7 },
                  { user_id: 7, tweet_id: 8 }
                ])
