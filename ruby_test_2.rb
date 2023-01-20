require 'pdf/reader'

result = {petitioner: "", state: "", amount: "", date: ""}

directory = "#{File.expand_path('../', __FILE__)}/pdfs/*.pdf"
Dir.glob(directory).each do |file|
    pdf = PDF::Reader.new(file)
    text = pdf.pages[0].text

    result[:petitioner] = text.split(")")[0].split("\n").last.delete(",") rescue ""
    result[:state] = text.split(")")[7].split.join(" ").delete(",") rescue ""
    result[:amount] = text.split(")")[9].split("\n")[0].split(":").last.delete(' ') rescue ""
    result[:date] = text.split("$").last.split(" ")[0] rescue ""

    puts result
end


