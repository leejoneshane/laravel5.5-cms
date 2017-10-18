# laravel5.5-cms

This is a docker image contained Laravel 5-5 tutorial application, which is a cms come from github project: [bestmomo/laravel5-5-example](https://github.com/bestmomo/laravel5-5-example).


### Include ###

* [Styleshout](https://www.styleshout.com/) for front template
* [CKEditor](http://ckeditor.com) the great editor
* [Elfinder](https://github.com/Studio-42/elFinder) the nice file manager
* [Sweat Alert](http://t4t5.github.io/sweetalert/) for the cool alerts
* [AdminLTE](https://adminlte.io/themes/AdminLTE/index2.html) the great admin template
* [Gravatar](https://github.com/creativeorange/gravatar) the Gravatar package
* [Intervention Image](http://image.intervention.io/) for image manipulation
* [Email confirmation](https://github.com/bestmomo/laravel-email-confirmation) the package for email confirmation
* [Artisan language](https://github.com/bestmomo/laravel-artisan-language) the package for language strings management
* [Laravel debugbar](https://github.com/barryvdh/laravel-debugbar)
* [Etrepat baum](https://github.com/etrepat/baum) for comments management

### Features ###

* Home page
* Custom error pages 403, 404 and 503
* Authentication (registration, login, logout, password reset, mail confirmation, throttle)
* Users roles : administrator (all access), redactor (create and edit post, upload and use medias in personnal directory), and user (create comment in blog)
* Blog with nested comments
* Search in posts
* Tags on posts
* Contact us page
* Admin dashboard with users, posts, articles, medias, settings, notifications and comments
* Multi users medias gestion
* Localization
* Application tests
* Thumbs creation for images
* Notifications to send emails and notify redactors for new comments

### Tricks ###

To use application the database is seeding with users :

* Administrator : email = admin@la.fr, password = admin
* Redactor : email = redac@la.fr, password = redac
* User : email = walker@la.fr, password = walker
* User : email = slacker@la.fr, password = slacker

# How to use
This image not include database and redis. You should run mysql first, like below:
```
docker run -e __MYSQL_ROOT_PASSWORD__=your.password -e __MYSQL_DATABASE__=laravel -d mysql
```
If this is the first container on your computer, then it's ip will be 172.17.0.2.

Then you should run redis secondary, like below:
```
docker run -d redis
```
If this is the second container on your computer, then it's ip will be 172.17.0.3.

Now, you can lunch laravel like below:
```
docker run --name=laravel -p 80:80 -p 443:443 -d leejoneshane/laravel5.5-cms
```
# First time running

You should use __Kitematic__ or use -e parameter in docker command to defind the environment variable list below to tell laravel container how to start:

*__MAIL=admin@admin.com__ This will be your admin account.
*__WEB_PASSWORD=your.password__ You need to change it.
*__DB_HOST=172.17.0.2__ Link to mysql container.
*__DB_PORT=3306__ If you use another port change this, or you can bypass it.
*__DB_DATABASE=laravel__ If you use another name change this, or you can bypass it.
*__DB_USERNAME=root__ If you use another account change this, or you can bypass it.
*__DB_PASSWORD=should.match.MYSQL_ROOT_PASSWORD__ You must change it.
*__REDIS_HOST=172.17.0.3__ Link to redis container.
*__REDIS_PORT=6379__ If you use another port change this, or you can bypass it.
*__REDIS_PASSWORD=null__ If you setup password for redis change it, or you can bypass it.
*__CACHE_DRIVER=redis__ If you don't want to use redis, change it to __file__.
*__SESSION_DRIVER=redis__ If you don't want to use redis, change it to __file__.

<div align="center">
<img src="https://github.com/leejoneshane/laravel/blob/master/kitematic.png?raw=true">
</div>

# Work with SSL

This image can use letsencrypt SSL certificate, but before send request to letsencrypt, you should registered a FQDN and complete DNS configuration. use the environment variable below to tell the container:

__DOMAIN=the.site.fqdn__

Then you should lunch the container's console, And run the script named gencerts.sh to get SSL certificate::
```
docker exec laravel bash
\#>gencerts.sh
```
Wait a second you should get your certificate.

# Login to admin panel

Use browser to connect the url below, login whith your MAIL/WEB_PASSWORD to management your site.

http://the.site.fqdn/admin
