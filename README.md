# Docker container for doorstop

With the provided files the open source requirements management system [doorstop](https://doorstop.readthedocs.io) runs in Docker

## How to build & run the doorstop container

To build the container image, just run `$ ./dockerBuild.sh`. Assuming you have a Docker server running, this will create a Docker image `doorstop_image:latest` that you can use. You can optionally store this image to a Docker registry if you want to maintain the integrity of your software supply chain.

To get this to work in the out-of-the-box config, make sure that you have a `data` directory under the directory from where you are calling this command (or you adapt the run command). The directory is then available at `/data`. You can then run `$ ./dockerRun.sh` to start the container and drop you into a bash shell inside the container. You can then run `doorstop` from the bash shell inside the container.

You may wish to run this container to create &/or maintain requirements that are maintained inside another repo. In this case, edit `./dockerRun.sh` so that it mounts the directory holding those requirements into `/data` for the container. You can then run the container, use it to maintain the requirements in your mounted directory, then push & merge those requirements to the repo once you've finished. This is probably the logical way to use this container

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

## Setting up your hierarchy

Let's assume you want to set up and track the following dependencies:
- solution requirements documents `REQ` will be the root of your hierarchy; every other type of document will tie back to the solution requirements documents
  - you want to support >1000 distinct requirements 
- solution design documents `SDD` will link to the `REQ` documents to allow the design to be tracked against requirements
- high level testing documents `TSC` will also link to the `REQ` documents to allow test scenarios to be tracked against requirements
- source control documents `SC` will link to the `SDD` documents to allow implementation to be traced against the solution design
- test case documents `TC` will link to the `TSC` documents to allow individual test cases to be tracked against test scenarios

To set this up, execute the following commands:
- `$ git init`
- `$ doorstop create -d 4 -s - REQ ./req`
- `$ doorstop create -d 5 -s - SDD ./req/sdd --parent REQ`
- `$ doorstop create -d 5 -s - TSC ./req/tsc --parent REQ`
- `$ doorstop create -d 5 -s - TC ./req/tsc/tc --parent TSC`

Before you go any further and start creating requirements & test cases, you might want to stop at this point and add any extra attributes to the various YAML templates you've just created. 

To add categories and requirements source to the requirements template, you could edit `./req/.doorstop.yml` to look like this:
```
settings:
  digits: "4"
  prefix: REQ
  sep: "-"
attributes:
  defaults:
    categories:
      - functional
      - usability
      - reliability
      - performance
      - security
      - constraint
    source:
      - customer
      - regulator
      - internal dependency
      - 3rd-party dependency
      - other
```

To add an execution approach & a JIRA URL to the test case template, you could edit `./req/tsc/tc/.doorstop.yml` to look like this:
```
settings:
  digits: "5"
  parent: REQ
  prefix: TC
  sep: "-"
attributes:
  defaults:
    execution-approach:
      - automated
      - manual
      - architecture-review
      - design-review
      - code-review
      - unknown
    jira-url:
```

Now you've got your templates set up, it's time to add your first requirement and edit the text description
- `$ doorstop add REQ`
- `$ doorstop edit REQ1`

Now you can create a test case, edit the description and link it to the requirement you just created
- `$ doorstop add TC`
- `$ doorstop edit TC1`
- `$ doorstop link TC1 REQ1`

You can add more requirements using `$ doorstop add REQ` as many times as you like. Each requirement will be numbered sequentially going up from 1. You can edit e.g. requirement 8 using `$ doorstop edit REQ8` (no need to worry about leading zeroes)

Similarly you can add more testcases using `$doorstop add TC` as many times as you like. You can also edit e.g. test case 13 using `$ doorstop edit TC13`.

Finally you can link TC13 to REQ8 using `$doorstop link TC13 REQ8`. You can link each test case to any number of requirements by typing e.g. `$ doorstop link TC9 REQ3`, `$ doorstop link TC9 REQ7`.


- `$ doorstop create -d 5 -s - HLT ./req/high-level-tests --parent REQ`
- `$ doorstop add HLT`
- `$ doorstop link HLT1 REQ1`
- `$ doorstop create -d 5 -s - SC ./req/source-control --parent REQ`


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
- add functions to delete, add, edit custom fields in Doorstop YAMLs
- add tool to report on any compliance gaps
- add tool to create custom reports using modifiable templates