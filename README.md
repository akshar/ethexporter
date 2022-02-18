# ETHexporter [![Docker Build Status](https://img.shields.io/docker/build/hunterlong/ethexporter.svg)](https://hub.docker.com/r/hunterlong/ethexporter/)

A lightweight Prometheus exporter and [Grafana Dashboard](https://grafana.com/dashboards/6970) that will output Ethereum wallet balances from a list of addresses you specify. ETHexporter attaches to a geth server to fetch ethereum wallet balances for your Grafana dashboards. Many of you probably want to chart your ERC20 token balances, feel free to use [TOKENexporter](https://github.com/hunterlong/tokenexporter). If you also want a Bitcoin prometheus exporter, you can use [BTCexporter](https://github.com/hunterlong/btcexporter) which uses blockchain.info API.

## Watch Addresses

The `addresses.txt` file holds all the addresses to fetch balances for. Use the format `name:address` on each new line.

```
etherdelta:0x8d12A197cB00D4747a1fe03395095ce2A5CC6819
bittrex:0xFBb1b73C4f0BDa4f67dcA266ce6Ef42f520fBB98
```

## Grafana Dashboard

ETHexporter includes a [Grafana Dashboard](https://grafana.com/dashboards/6970) so you visualize Ethereum wallet balances with ease. Import Grafana Dashboard ID: `6970` once you've started your
Docker container.

<p align="center"><img width="70%" src="https://img.cjx.io/ethexportergrafana.png"></p>

## Build Docker Image

Clone this repo and then follow the simple steps below!

##### Build Docker Image

`docker build -t ethexporter:latest .`

## Running the Exporter

You can easily run this Ethereum balance prometheus exporter with the docker command:

```
docker run -it -d -p 9015:9015 \
  -e "GETH=https://mainnet.infura.io/****KEYHERE" \
  -e "PORT=9015" \
  ethexporter:latest

```

## Prometheus Response

```
eth_balance{name="etherdelta",address="0x8d12A197cB00D4747a1fe03395095ce2A5CC6819"} 24919.37437
eth_balance{name="bittrex",address="0xFBb1b73C4f0BDa4f67dcA266ce6Ef42f520fBB98"} 687509.5097
eth_balance{name="poloniex",address="0x32Be343B94f860124dC4fEe278FDCBD38C102D88"} 72284.47401
eth_balance{name="kraken",address="0x267be1c1d684f78cb4f6a176c4911b741e4ffdc0"} 159592.0022
eth_balance_total 944305.360280000022612512
eth_load_seconds 1.15
eth_loaded_addresses 4
eth_total_addresses 4
```
