# README

#### 一些乱记的笔记：

1. 删除Gemfile.lock文件

2. 修改gemfile文件，在chromedriver-helper后面添加, '~> 3.11'

3. 重新bundle install(应该不用了)

4. rails t

   ```ruby
   
     test "should get about" do
       get static_pages_about_url
       assert_response :success
     end
     test "should get root" do 
       get root_url
       assert_response :success
       assert_select "title", "Home | #{@base_title}"
     end
   ```

use 

> git checkout -b static-pages

to init a new branch

then merge it at github














