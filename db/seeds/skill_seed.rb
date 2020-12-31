puts "### SKILL SEED ###"

sac = SearchableAttributeCategory.new(name: "Skill")
sac.save

skills = ["Bilans",
    "Déclarations fiscales",
    "Gestion de la paie",
    "Déclarations sociales",
    "Gestion du personnel",
    "Tenue et révision comptable",
    "Comptabilité analytique",
    "Secrétariat Juridique",
    "Conseil en gestion de patrimoine",
    "Accompagnement à la création d'entreprise",
    "Accompagnement au rachat d'entreprise",
    "Conseils en import/export",
    "Commissaire aux apports",
    "Commissaire aux comptes",
    "Consolidation des comptes",
    "Audit d'acquisition et cession ",
    "Déclaration d'impôt sur le revenu",
    "Audit Comptable et financier",
    "Commissaire à la Fusion",
    "Commissaire à la transformation",
    "Formation a la creation d'entreprise",
    "Comptabilité client / fournisseur",
    "Pilotage de trésorerie",
    "International",
    "Comité d'entreprise",
    "Expert judiciaire",
    "Filiale étrangère / export",
    "Dématérialisation ",
    "Conseil en investissement immobilier",
    "Optimisation fiscale",
    "Service RH",
    "Prestation globale d'accompagnement",
    "Accompagnement des associations foncières/ASA",
    "Conseil fiscal",
    "Mise en place des tableaux de bords",
    "Reporting & consolidation",
    "Élaboration budgétaire",
    "Accélération de la production des comptes",
    "Optimisation des fonctions supports",
    "Contrôle fiscal des comptabilités informatisés",
    "Conseil",
    "Dématérialisation digital",
    "Conseil en gestion d'entreprise",
    "Contrôle de gestion",
    "Restructuration "
]

skills.each do |s|
  SearchableAttribute.create(name: s, searchable_attribute_category: sac)
end
