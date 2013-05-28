blog_original
===================

Jekyll powered blog

Update - Push out your changes to master
Publish - Run deploy.sh

Using Ruby 1.8.7

To fork
=======
1) create a new project on GitHub called ‘blog_new'’.
2) git clone git@github.com:asolidum/blog_original.git blog_new
3) Edit your Git config file and replace the origin URL with your new URL:
   emacs.git/config

   [remote "origin"]
           fetch = +refs/heads/*:refs/remotes/origin/*
           url = git@github.com:asolidum/blog_new.git #replace original with new
4) git remote add upstream git@github.com:asolidum/blog_original.git
5) git push -u origin master

To pull from original: git fetch upstream
To merge from original: git merge upstream/master

For foundation - http://foundation.zurb.com/download.php#customizeFoundation
=======
* The Grid
  * Num of Columns:  12
  * Gutter: 1.875 em
  * Max-Width: 62.5 em
* Colors
  * Primary Color: #2ba6cb
  * Secondary Color: #e9e9e9
  * Alert Color: #c60f13
  * Success Color: #5da423
  * Body Font Color: #999999
  * Header Font Color: #999999
* Global Radius
  * Radius: 3 px
  * Top Bar Breakpoint: 58.75 em
* Text Direction
  * Left-to-right
