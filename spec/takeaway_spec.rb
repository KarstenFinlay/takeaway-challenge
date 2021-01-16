require 'takeaway'

describe Takeaway do
  let (:menu) { double('menu') }
  let (:printer) { printer('printer') }
  subject { Takeaway.new(menu, printer) }

  describe '#show_menu' do
    
    it 'should present menu to user' do
      menu_dishes = 'dish'
      allow(menu).to receive(:pretty_dishes).and_return(menu_dishes)
      allow(printer).to receive(:print)
      expect(printer).to receive(:print).with(menu_dishes)

      subject.show_menu
    end
  end
end