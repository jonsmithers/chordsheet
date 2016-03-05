#!/usr/bin/env ruby

def printFile(filename, lines)
  puts filename
  lines.each do |line|
    puts "----"
    puts line
    regex = %r{([ABCDEFG][#b]?(?:maj|[mM])?(?:[#b]?[2345679])?(?:(?:add|sus)?[#b]?[2345679])?(?:/[ABCDEFG][#b]?)?)}
    puts line.scan(regex)
  end
end


lastFilename = ""
indentedLines = Array.new
ARGF.each_line do |line|
  if (ARGF.filename != lastFilename)
    if (lastFilename != "")
      printFile(lastFilename, indentedLines)
      indentedLines = Array.new
    end

    lastFilename = ARGF.filename
  end
  indentedLines.push(line);
end
printFile(lastFilename, indentedLines)
