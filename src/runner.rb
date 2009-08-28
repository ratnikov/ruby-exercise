module Runner
  extend self

  def run options
    people = []

    Array(options[:pipe]).each do |pipe_file|
      people += Parser.parse_pipe File.open(pipe_file).read
    end

    Array(options[:comma]).each do |comma_file|
      people += Parser.parse_comma File.open(comma_file).read
    end

    Array(options[:space]).each do |space_file|
      people += Parser.parse_space File.open(space_file).read
    end

    output = <<-OUTPUT
    Output 1:
    #{concat people.sort_by { |p| [ p.gender, p.last ] }}

    Output 2:
    #{concat people.sort_by { |p| [ p.date_of_birth, p.last ] }}

    Output 3:
    #{concat people.sort_by { |p| p.last }.reverse}

    OUTPUT

    # remove any leading spaces
    output.gsub /^ */, ''
  end

  private

  def concat people
    people.map(&:to_s).join "\n"
  end
end
