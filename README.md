# Docker container for doorstop

With the provided files the open source requirements management system [doorstop](https://doorstop.readthedocs.io) runs in Docker

## How to build & run the doorstop container
make sure that you have a `data` directory under the directory from where you are calling this command (or you adapt the run command). The directory is then available at `/data`

# Instructions to build & run the image

To build the container image, run `$ ./dockerBuild.sh`.
To run the container image, run `$ ./dockerRun.sh`.
Feel free to tweak these scripts to suit your specific requirements

## Using the container

The intention of this container image is that you'll run it to edit `doorstop` content that may live alongside code & tests inside a repo. At least, that's how I intend to use it...

To run it, first clone your repo, then create a new directory to hold the doorstop content. Let's assume you use the `doorstop` directory at the root level of your repo. In this case you'd:
- `$ git clone ...` or `$ git pull ...` the existing repo content
- `$ cd repo-name` to get to the top directory of the repo
- `$ mkdir ./doorstop` to create the directory to hold the doorstop documents you're going to create




## Editor

The editor will default to `nano` which is probably the simplest Linux editor around. For non-techo users, this is probably the one to go with

If you'd prefer to use `vim` instead, you can type `$ export EDITOR=vim` and from then on you will be editing using `vim` till you shutdown the container.

Note that `doorstop` supports using Markdown in edited documents, so you can use Markdown when creating your document content. A good Markdown cheat sheet is at https://www.markdownguide.org/cheat-sheet/ if you're not familiar with the syntax.

## Web interface

At any time you can expose requirements using a web interface from within the container by typing `$ doorstop-server -H 0.0.0.0`. You can then access the web interface at `http://localhost:7867` from a browser. This is a handy way of navigating around any changes you've just made to ensure everything looks OK before you commit them to a shared repo.

When you're done, you can exit doorstop-server using <CTRL-C>

## Publishing

You can publish all your documents as a web page using `$ doorstop publish all ./dist/`

It's probably a good idea to do this before pushing & merging your changes to a git repo. That way, any repo uses will be able to view all the requirements using the web interface without running `doorstop`

### Viewing inside Github repo

If you've published your documents as a web page inside Github, you can view and navigate through them as follows:
- navigate to the `index.html` page (or another page) using the Github browser interface
- prepend `http://htmlpreview.github.io/?` to the URL for the page, and you'll then see the rendered view of the page
You should be able to navigate around by clicking on links in that page

---

## TO-DOs

- investigate integration with https://github.com/sevendays/doorhole which looks like a nice GUI for rapid data entry and editing