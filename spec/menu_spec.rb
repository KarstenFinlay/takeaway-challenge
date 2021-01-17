require 'menu'

describe Menu do
  let(:file_reader) { double("mock file reader") }
  let(:json_parser) { double("mock json parser") }
  let(:path_to_config) { "CONFIG_PATH" }
  subject { Menu.new(path_to_config, file_reader, json_parser) }

  before :each do
    menu_json_data = "MENU_DATA"
    @menu_hash_data = [{ "id" => 1, "name" => "dish1", "price" => 5 }, { "id" => 2, "name" => "cool_dish", "price" => 4 }]

    allow(file_reader).to receive(:read).with(path_to_config).and_return(menu_json_data)
    allow(json_parser).to receive(:parse).with(menu_json_data).and_return(@menu_hash_data)
  end

  describe '#initialize' do

    it 'should load menu from config file and store as array of hashes' do
      expect(subject.dishes).to eq(@menu_hash_data)
    end
  end

  describe '#pretty_dishes' do

    it 'should return dishes as formatted string' do
      expected_menu = "1.\tdish1\t£5.00\n2.\tcool_dish\t£4.00"
      expect(subject.pretty_dishes).to eq expected_menu
    end
  end

end
