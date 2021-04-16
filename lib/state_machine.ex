defmodule StateMachine do
  # called when someone uses includes this module
  defmacro __using__(_) do  #1
    quote do
      import StateMachine
      @states []
      @before_compile StateMachine
    end
  end

  defmacro state(name, events) do  #2
    quote do
      @states [{unquote(name), unquote(events)} | @states]
    end
  end

  defmacro __before_compile__(env) do #3
    states = Module.get_attribute(env.module, :states)
    events = states
             |> Keyword.values
             |> List.flatten
             |> Keyword.keys
             |> Enum.uniq

    quote do #4
      def state_machine do
        unquote(states)
      end

      unquote event_callbacks(events) #5
    end
  end

  def event_callback(name) do #6
    callback = name
    quote do
      def unquote(name)(context) do
        StateMachine.Behavior.fire(state_machine, context, unquote(callback))
      end
    end
  end

  def event_callbacks(names) do
    Enum.map names, &event_callback/1
  end
end
