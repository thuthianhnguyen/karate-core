Feature: Articles

  Background: Define URL
    Given url 'https://api.realworld.io/api/'
    Given path 'users/login'
    And request {"user": {"email": "thuthudia123@gmail.com", "password": "Aa123123@."}}
    When method Post
    Then status 200
    * def token = response.user.token

  Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": "thutest","description": "this is a article","body": "test 123","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'thutest'
