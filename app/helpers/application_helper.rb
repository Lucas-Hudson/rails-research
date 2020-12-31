module ApplicationHelper
  def link_to_org(org)
    professions = SearchableAttributeCategory.find_by(name: "Profession").searchable_attributes.pluck(:id)
    attributes = org.searchable_attributes.where(id: professions).map { |a| a.name.parameterize }.join("/")
    address = org.place&.address&.parameterize

    link_to org.name, "/fiche/#{attributes}/#{address}/#{org.slug}"
  end
end
