# Circum Caetera
The goal of the project is to build a free software solution with WAF (Web Application Firewall) capabilities and SSL/TLS acceleration.

## Getting Started
As of right now the project **is not** ready for a production environment.
The goal is to have an autonomous solution running in its own container or server, which will be platform independent.

### Prerequisites
The solution is based on Docker containers.
It is likely we are going to use Kubernetes, but it hasn't been evaluated yet.

### Installing
You can test the current solution executing the following commands:
First, you would need to download a copy of the code. Typically:
```
git clone git@github.com:bpk667/aDjR7V1D6N.git

```

Go to the Dockerfile directory and build and image:
```
cd aDjR7V1D6N/environments/CircumCaetera/
./docker_build.sh circumcaetera
```

*docker_build.sh* is a script that will take care of building a Docker image and spin it up.
Basically it just execute *docket build* and *docker run*

If you want to remove the image and all its associated containers you can execute the scripted named *docker_rm.sh*

Be advise I have created these scripts because I'm lazy and I don't want to execute a bunch of commands over and over. This scripts don't have the proper guardrails to keep you from breaking something.

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
