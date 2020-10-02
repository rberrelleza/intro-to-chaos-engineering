# Intro to Chaos Engineering

Let's learn about Chaos Engineering!

## Recommended reading

I recommend you take a look at one (or all) of the talks [listed here](docs/resources.md) to learn more about the history, theory and reasons behind Chaos Engineering.

## Useful links

Articles, blog posts, getting started guides [listed here](docs/links.md).

Slides from [the talk are available here](docs/intro-to-chaos-testing.pdf).


## Tutorial

### Prerequisites
1. python 3
1. [toxiproxy](https://github.com/Shopify/toxiproxy)
1. openssl
1. pkill

### Develop in a Container
You can also use https://github.com/okteto/okteto to run the samples on a pre-configured container.

1. [Install okteto CLI](https://okteto.com/docs/getting-started/installation/index.html)
1. `okteto namespace`: This will create a free account on [Okteto Cloud](https://cloud.okteto.com) to run your dev container, and download the necessary credentials.
1. `okteto utoxiproxy toxic addp`: This will start the remote development environment from you, and give you a remote terminal. 

Once your remote environment is running, you can connect to with:
1. `okteto exec bash`
1. ssh intro-to-chaos-engineering.okteto
1. VSCode Remote SSH plugin


### Run Experiments

Experiments are meant to be run from the root of this repo.

1. `chaos run experiments/call-service.json`
1. `chaos run experiments/expired-certificate.json`
1. `chaos run experiments/kubernetes.json`