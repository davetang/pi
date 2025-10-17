# README

[Traggo](https://traggo.net/) is a tag-based time tracking tool. In Traggo there are no tasks, only tagged time spans.

With tags, Traggo tries to be as customizable as possible, f.ex. if you work on different projects you could add a project-tag. If you like to see statistics from the different things you do, you could add a type-tag with values like email, programming, meeting. You can do it just as you like.

## Setup

Create `/opt/traggo/data`.

```console
sudo mkdir /opt/traggo/data
```

Just run:

```console
docker compose up -d
```

Visit http://ip_addr:3030 and log in using admin/password.
