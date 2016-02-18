# puppet-fastd

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with fastd](#setup)
    * [Beginning with fastd](#beginning-with-fastd)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Installs and manages fastd tunnels for the Freifunk Nordwest network.

## Setup

### Beginning with fastd

```puppet
fastd::instance { 'ol-nord': }
```

## Usage

```puppet
fastd::instance { 'ol-nord':
  port             => 10000,
  peer_limit       => 100,
  batman_interface => 'bat0',
}
```

## Reference

* define fastd::instance
  * $interface (optional, default 'fastd-_title_')
  * $port (optional, default 10000)
  * $peer\_limit (optional, default 150)
  * $batman\_interface (optional, default 'bat0')

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.

