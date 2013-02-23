module Admin::AdminHelper
  def create_table_for model, data_grid, attributes=""
    join_attributes = model.attribute_names
    unless attributes.blank?
      join_attributes = model.attribute_names & attributes
    end

    grid data_grid do  |g|
      join_attributes.each do |p|
        g.column :name => p.capitalize do |item|
          item.send(p)
        end
      end
      g.column :name => "Actions" do |item|
        content_tag :div, nil, class: "actions span" do
          link_to( content_tag(:i, "", class: "halflings-icon zoom-in halflings-icon"), url_for([:admin, item]),  class: "btn btn-success" ) +
          link_to( content_tag(:i, "",class: "halflings-icon edit halflings-icon"), url_for([:edit, :admin, item]),  class: "btn btn-info" ) +
          link_to( content_tag(:i, "",class: "halflings-icon trash halflings-icon"), item, method: :delete,   class: "btn btn-danger" )
        end
      end
    end
  end
end
