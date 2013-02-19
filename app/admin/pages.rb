ActiveAdmin.register Page do
  form do |f|
    f.inputs "Page:" do
      content_tag :li, (f.input :title)
      content_tag :li, (f.input :body, as: :html_editor)

    end

    f.buttons
  end
end
