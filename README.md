# nudehub-validator

This repository contains the executable portions of the nudehub sidechain framework, necessary to run a validator on a network implementing the nudehub protocol. The nudehub stack is a stateful sidechain system that is parent chain agnostic, verifiable on any host network supporting arbitrary computation, which is specialized to emit events into a query layer powered by a graph database. The result is a peer to peer network supporting a social application with content ownership guarantees.

The nudehub-validator docker image launches the complete peer node stack and provides service to light clients who are consuming the web application, communicating entirely over the libp2p powered channels. Operating the node marks the peer to receive staking rewards for his provision of security and service to the network, which are distributed on scheduled ticks of the block producer lifecycle.

## Install / Upgrade

Install docker for your platform of choice.

Follow guide [here](https://gist.github.com/rstacruz/297fc799f094f55d062b982f7dac9e41)

## Run

The docker image provides two environment variables necessary to operate the node, STAKING_ADDRESS and BOOTNODE, which must be set to an Ethereum compatible address associated with the operator of the validator node to receive rewards, and also the network it should peer with. For BOOTNODE, currently it is only of interest to supply `BOOTNODE=mainnet`

## Example Operation

Install and start

```shell
docker run -d --name nudehub-validator --restart=always --env BOOTNODE=mainnet --env STAKING_ADDRESS=0x0011223344556677889900112233445566778899 nudehub/nudehub-validator
```

Attach and view output

```shell
docker attach nudehub-validator
```

Detach: Ctrl-P, Ctrl-Q
Stop validator and detach: Ctrl-C

Start a stopped validator:

```shell
docker start nudehub-validator
```

Update to latest version and restart:

```shell
docker stop nudehub-validator
docker rm nudehub-validator
docker pull nudehub/nudehub-validator
docker run -d --name nudehub-validator --restart=always --env BOOTNODE=mainnet --env STAKING_ADDRESS=0x0011223344556677889900112233445566778899 nudehub/nudehub-validator
```
