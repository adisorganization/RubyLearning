require_relative "../../engine/robot"

RSpec.describe Robot do

  after do
    $stdin = STDIN
  end
  context :choose_tool do
    before do

    end
    it "when the user inputs yes" do
      robot = Robot.new
      $stdin = StringIO.new("yes\n")
      expects(robot.choose_tool).to eql("")
    end
    it "when the user inputs no"
    it "when the user inputs machineGun"
    it "when the user provides an invalid input"
  end
end
