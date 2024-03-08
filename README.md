# Cookbook Template

## Getting Started

Cookbooks are deployed as [Hugo](https://github.com/gohugoio/hugo) sites. They are driven by a hierarchical structure of markdown files.

This cookbook is additionally backed by a Spring Boot backend to provide search functionality and to serve the Hugo-generated static files.

### Initial Setup and run locally

* Install `hugo`
  - With homebrew (Mac): `brew update && brew install hugo`
  - Manual download and install: https://github.com/gohugoio/hugo/releases

* Clone this repo

* Run locally
  ``` 
  $ ./localserver
  ``` 

* Access your cookbook at [http://localhost:1313/](http://localhost:1313/)

### Add a new recipe

Create a new Markdown file inside the `content` folder. Use existing files for examples. 

### Create a docker image

- Ensure that you have [pack cli](https://buildpacks.io/docs/for-platform-operators/how-to/integrate-ci/pack/) installed.

- Run the below command which builds the docker image.

  ```sh
  ./publish && pack build my-cookbook --buildpack paketo-buildpacks/nginx --builder paketobuildpacks/builder-jammy-base
  ```

- Run the below command to run the cookbook. After successful run, access your cookbook at [http://localhost:8080/](http://localhost:8080/)

  ```sh
  docker run --tty --env PORT=8080 --publish 8080:8080 my-cookbook
  ```