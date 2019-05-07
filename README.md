# Circum Caetera - Documentation
The goal of the project is to build a free software solution with WAF (Web Application Firewall) capabilities and SSL/TLS acceleration.
This repository is focuses on documenting the analysis of similar current solutions and the design of Circum Caetera.


## Getting Started
So far it has been analized and evaluated current solutions.

### Prerequisites
Documentation is generated using LaTeX

### Installing
You can test the current solution executing the following commands:
First, you would need to download a copy of the code. Typically:
```
git clone git@github.com:bpk667/CircumCaetera.git

```

Build the image and run a container
```
./docker_build_and_run.sh circumcaetera
```

*docker_build_and_run.sh*: is a script that will take care of building a Docker image and run a container.
Basically it just execute *docket build* and *docker run*

*docker_rm.sh*: Is a script that removes the image and all its associated containers. If you run it without params it lists images and containers.

Be advise I have created these scripts because I'm lazy and I don't want to execute a bunch of commands over and over. These scripts don't have the proper guardrails to keep you from breaking something.

## Running the tests
TODO

## Deployment
Not there yet

## Built With
* Docker
* Debian GNU/Linux
* ModSecurity
* Nginx

## Contributing
TODO

## Authors
* **Pedro Pozuelo**

## License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
TODO
