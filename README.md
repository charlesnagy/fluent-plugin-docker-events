# Fluent::Plugin::DockerEventStreamInput, a plugin for [Fluentd](http://fluentd.org)

An input plugin for fluentd collecting Docker events

# Installation

    gem install fluent-plugin-dockerevents

# Configuration

    <source>
      @type docker_events
      tag debug.docker
      # events create,start,stop,die,kill,oom
      events die
    </source>

* `tag` : Fluentd tag
* `events` : list of events to be followed (only these will be sent forward)

# Output

    {
      "id": "3212373f0339360cbae824a05f6693693d0b9376ed07d11acdc1b7879cf6d25c",
      "action": "die",
      "status": "die",
      "type": "container",
      "container": {
        "state": {
          "Status": "exited",
          "Running": false,
          "Paused": false,
          "Restarting": false,
          "OOMKilled": false,
          "Dead": false,
          "Pid": 0,
          "ExitCode": 1,
          "Error": "",
          "StartedAt": "2016-10-31T16:05:25.236188542Z",
          "FinishedAt": "2016-10-31T16:05:30.241883914Z"
        },
        "name": "kickass_mayer",
        "image": [
          "alpine:latest"
        ]
      }
    }

# TODO

* Docker configuration
* Write tests

---

You can find me on [Twitter](https://twitter.com/charlesnagy "Charlesnagy Twitter"), [My Blog](http://charlesnagy.info/ "Charlesnagy.info") or [LinkedIn](http://www.linkedin.com/in/nkaroly "K�roly Nagy - MySQL DBA")