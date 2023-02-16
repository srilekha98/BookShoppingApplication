# Book Shopping Application



### Home Page

|HTTP Method|URL|Description|
|---|---|---|
|`GET`|http://152.7.177.32:3000/ | Home page |

### Credentials for the preconfigured admin
Username: admin  
Password: admin

#### Books

|HTTP Method|URL|Description|
|---|---|---|
|`GET`|http://152.7.177.32:3000/books | View all books |
|![image](https://media.github.ncsu.edu/user/26500/files/c107b2dc-3c2e-4837-a82d-944673ced175)| | |
|`GET`|http://152.7.177.32:3000/books?author=Mr.+Anonymous&commit=Filter | Filter books by Author |
![image](https://media.github.ncsu.edu/user/26500/files/25b0de26-9729-4402-b2c8-34868f4fc9d4)
|`GET`|http://152.7.177.32:3000/books?rating=3&commit=Filter | Filter books on rating |  
![image](https://media.github.ncsu.edu/user/26500/files/2a76b99b-188a-4491-823f-4fc025f97e03)
|`GET`|http://152.7.177.32:3000/transactions/new?book_id=1 | Buy the particular book by clicking this link|
![image](https://media.github.ncsu.edu/user/26500/files/c3b7e730-8512-44c4-818d-80f6bf870a99)


#### Reviews

|HTTP Method|URL|Description|
|---|---|---|
|`GET`|http://152.7.177.32:3000/reviews?book_id=1 | View Reviews of the specific book |
|![image](https://media.github.ncsu.edu/user/26500/files/716bd048-109e-4644-aaee-73349b182996)|||
|`GET`|http://152.7.177.32:3000/reviews?user_id=1 | View your reviews |
|![image](https://media.github.ncsu.edu/user/26500/files/db4c8144-3c68-4845-bf1b-c77935786344)
|`GET`|http://152.7.177.32:3000/reviews/1/edit| Edit your review |
|![image](https://media.github.ncsu.edu/user/26500/files/971c7abe-8dd7-4645-9f63-2ebcdaee8658)|||

#### Admin

|HTTP Method|URL|Description|
|---|---|---|
|`GET`|[http://152.7.177.32:3000/reviews?book_id=1](http://152.7.177.32:3000/users) | View All Users |
|![image](https://media.github.ncsu.edu/user/26500/files/e05f5d83-c78e-4431-9344-e5d642fc51d9)|||
|`DELETE`|http://152.7.177.32:3000/reviews?user_id=1 | Delete this user account |
|![image](https://media.github.ncsu.edu/user/26500/files/6306df2d-a554-4f51-a042-82d30fdff482)|||
|`GET`|http://152.7.177.32:3000/reviews?user=ameya&commit=Filter| List Reviews written by a specific user |
|![image](https://media.github.ncsu.edu/user/26500/files/e14ce381-3690-462a-9192-367945941b94)|||
|`DELETE`|http://152.7.177.32:3000/books/5| Delete the book |
|![image](https://media.github.ncsu.edu/user/26500/files/58283631-708b-4a32-857c-e35d10e2e588)|||
|`DELETE`|[http://152.7.177.32:3000/books/5](http://152.7.177.32:3000/reviews)| Delete reviews by clicking on the delete link |
|![image](https://media.github.ncsu.edu/user/26500/files/14e9665a-f0b1-4192-b19c-6a374ef6d14f)|||

## Class Diagram

<img src="https://media.github.ncsu.edu/user/26315/files/7aaae76f-1839-4dd3-ab8b-a792daf4b4a8" width="900" height="800">



## Team Members
[Ameya Vaichalkar](https://github.com/ameyagv)

[Sanket Tangade](https://github.ncsu.edu/sstangad)

[Srilekha Gudipati](https://github.ncsu.edu/sngudipa)
