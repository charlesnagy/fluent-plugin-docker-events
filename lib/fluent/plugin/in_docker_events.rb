module Fluent
    class DockerEventStreamInput < Input 
        Fluent::Plugin.register_input('docker_events', self)

        config_param :tag, :string, :default => "docker"
        config_param :events, :string, :default => []

        # Define `router` method of v0.12 to support v0.10 or earlier
        unless method_defined?(:router)
          define_method("router") { Fluent::Engine }
        end

        def initialize
          super
          require 'docker'
        end

        def configure(conf)
          super
          @events = @events.split(',').map {|event| event.strip }
        end

        def start
          super

          @running = true
          @thread = Thread.new(&method(:run))
        end

        def shutdown
          @running = false
          @thread.join
        end

        def run     
            while @running
                Docker::Event.stream do |event|
                    if @events.include?(event.action)
                        emit(event)
                    end
                end
            end
        end

        def emit(r)
            record = {
                "id" => r.id,
                "action" => r.action,
                "status" => r.status,
                "type" => r.type,
            }
            _container = Docker::Container.get(r.id)
            if _container
                record["container"] = {
                    "state" => _container.info["State"],
                    "name" => _container.info["Name"].gsub(/^\//, ''),
                }
                _image = Docker::Image.get(_container.info["Image"])
                if _image
                    record["container"]["image"] = _image.info["RepoTags"]
                end
            end
            router.emit(@tag, Time.now.to_i, record)
        end
    end
end
