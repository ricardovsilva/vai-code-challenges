# Vai Backend Challenge - Image API
This solution was written to solve the challenge to position of Backend Software Engineer at Vai. The challenge description can be found on [CHALLENGE.md](CHALLENGE.md) file.

The solution is a simple REST API Ruby with Rails API. It receives images files and extract metadata from them. Also make 
these images and metadatas available through its API.

A demo is live at Heroku, [click here to go do demo](https://vai-code-challenge.herokuapp.com/images)

## Requirements
This solution was written and tested with Ruby 2.7.0, so Ruby 2.7.0 is mandatory.
Is also possible to run this solution using docker, it is not necessary to install anything, only Docker.

## Running the tests (optional)
This step is totally optional but strongly recommended. You need to install the external dependencies:  
```sh
$ bundle
$ rake rspec
```

All tests should pass, if some test brake, feel free to open an issue.
By now it have 100% of coverage.

## Running solution
You only need to run:  
```sh
$ rails s
```

## Running tests and solution with docker
If you have docker on your computer, you can run all the tests and the solution itself with a simple command:  
```sh
$ docker build -t vai-code-challenge . && docker run -p 3000:3000 vai-code-challenge
```

## API Endpoints

### GET /images/:id
Retrieve json with data of a specific image. 
| field | description |
| ------| ------------|
| owner | owner of image |
| description | an arbitrary description setted on image upload |
| metadata | all metadata extracted from image file like `width`, `height`, `gps` and `camera information` |
| created_at | date when image was uploaded |
| url | url to download the image |

Returns `status code 200` if image is found, otherwise it returns `status code 404` without body.

### GET /images
Retrieve a collection of all images with their data. It's an array of Images and the content of each image is the same of the `GET /images/:id` endpoint.

If service is new and does not have any image stored, it endpoint can return `status code 204` with empty array as body.

## POST /images
Post a new image so it can be stored along with their metadata. To do that you need to post a form with the file with some mandatory fields:
| field | type | description |
| owner | string | name of image owner |
| description | string | some arbitrary description |
| file | File | the file of image itself |

This endpoint returns `status code 201` and image is stored. Also it returns all the image data as json, take a look on `GET /images/:id` endpoint since the return is the same.  
If any of fields below is missing, this endpoint is going to return `status code 422` without body and image is not going to be saved.
