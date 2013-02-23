module Admin::AdminHelper
  def create_table_for model, data_grid, &block
    grid data_grid do  |g|
      model.attribute_names.each do |p|
        g.column :name => p.capitalize do |item|
          item.send(p)
        end
      end
      if block_given?
        capture(&block)
      end
      g.column :name => "Actions" do |item|
        link_to content_tag(:i, "", class: "halflings-icon zoom-in halflings-icon"), "",  class: "btn btn-success"
      end
      g.column :name => "Actions" do |item|
        link_to content_tag(:i, "",class: "halflings-icon edit halflings-icon"), "",  class: "btn btn-info"
      end
      g.column :name => "Actions" do |item|
        link_to content_tag(:i, "",class: "halflings-icon trash halflings-icon"), "",  class: "btn btn-danger"
      end
    end
  end
end
