require 'erb'

erb = ERB.new(<<~EOS)
  <% if true %>True!!<% else %>False!!<% end %>
EOS

erb.run binding

people = %w[Alice Bob Charlie]
erb = ERB.new(<<~EOS, trim_mode: '-')
  <%- people.each do |person| -%>
  * <%= person %>
  <%- end -%>
EOS

erb.run binding
