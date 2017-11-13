require 'timeout'
class InputFile
  attr_accessor :name,:content,:extension

  @@lang = {
    "ruby" => "rb",
    "javascript" => "js",
    "python" => "py"
  }
  def initialize(name,content,language)
    self.name = name
    self.content = content
    self.extension = @@lang[language]
  end

  def createFile
    somefile = File.open("temporary/#{self.name}.#{self.extension}","w")
    case self.extension
    when "js"
      somefile.puts "var fs = require('fs'); var access = fs.createWriteStream('temporary/#{self.name}.txt'); access.truncate; process.stdout.write = process.stderr.write = access.write.bind(access); process.on('uncaughtException', function(err) { console.error((err && err.stack) ? err.stack : err); });"
      somefile.puts self.content
    when "py"
      somefile.puts "import sys"
      somefile.puts "sys.stdout = sys.stderr = open(\"temporary/#{self.name}.txt\",\"w\")"
      somefile.puts self.content
    else
      somefile.puts "fname = File.open(\"temporary/#{self.name}.txt\",\"w\")"
      somefile.puts "$stderr = fname"
      somefile.puts "$stdout = fname"
      somefile.puts self.content
      somefile.puts "fname.close"
    end
    somefile.close
  end

  def execute
    begin
      Timeout::timeout(5) do
      case self.extension
      when "js"
        cmd = "node temporary/#{self.name}.js & echo $! > temporary/#{self.name}_new.txt"
        `#{cmd}`
      when "py"
        cmd = "python3 temporary/#{self.name}.py & echo $! > temporary/#{self.name}_new.txt"
        `#{cmd}`
      else
      cmd = "ruby temporary/#{self.name}.rb & echo $! > temporary/#{self.name}_new.txt"
      `#{cmd}`
      end
    end
  rescue Timeout::Error
    f = File.open("temporary/#{self.name}.txt","w")
    s = File.read("temporary/#{self.name}_new.txt")
    id = s.to_i
    com = "kill #{id}"
    `#{com}`
    f.puts "Your Program did not yield any output or ran for too long (>5000ms). Process Killed."
    f.close
  end
  end

  def respond
    val = File.read("temporary/#{self.name}.txt")
    case self.extension
      when "py"
        if val.split("line ").size > 1
          leftpar = val.split("line ")[0]
          ex = val.split("line ")[1].split("")[0].to_i - 2
          val = val.split("line ")[1].split("")
          val.shift
          rightpar = val.unshift(ex).join("")
          val = leftpar + "line " + rightpar
        end
      else
        if val.split("rb:").size > 1
          leftpar = val.split("rb:")[0]
          ex = val.split("rb:")[1].split("")[0].to_i - 3
          val = val.split("rb:")[1].split("")
          val.shift
          rightpar = val.unshift(ex).join("")
          val = leftpar + "rb:" + rightpar
      end
    end
    return val
  end
end
