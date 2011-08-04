#!/usr/bin/env ruby

src = ARGF.read
l_max = r_max = 0

src.scan(/^\s*(.+?)\s*=\s*([^#]+?)\s*(#.*)?$/) do
  l_max = [l_max, $1.length].max
  r_max = [r_max, $2.length].max
end

src.gsub!(/^(\s*)(.+?)\s*=\s*([^#]+?)\s*(#.*)?$/) do
  if $4.nil?
    "%s%-#{l_max}s = %s" % [$1, $2, $3]
  else
    "%s%-#{l_max}s = %-#{r_max}s %s" % [$1, $2, $3, $4]
  end
end

print src
