# [
#    available: [
#        rent: [ to: :rented, calls: [ &VideoStore.renting/1 ]]
#    ],
#    rented: [
#        return: [ to: :available, calls: [ &VideoStore.returning/1 ]],
#        lose: [ to: :lost, calls: [ &VideoStore.losing/1 ]]
#    ],
#    lost: []
# ]
#

defmodule StateMachine.Behavior do
  # video store context: {title: "", state: :available, times_rented: 0, log: []}
  def fire(context, event) do
    %{context | state: event[:to]}
    |> activate(event)
  end

  # overload for convenience. does not require lookup
  def fire(states, context, event_name) do
    event = states[context.state][event_name]
    fire(context, event)
  end

  def activate(context, event) do
    # Enum.reduce(enumerable, accumulator, function
    Enum.reduce(event[:calls] || [], context, &(&1.(&2)))
  end
end
