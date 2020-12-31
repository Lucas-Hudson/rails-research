puts "### SECTOR SEED ###"

sac = SearchableAttributeCategory.new(name: "Sector")
sac.save

sectors = [
    "Electronique - Informatique",
    "Restauration",
    "Hôtellerie",
    "Commerce ",
    "Santé",
    "Industrie - Matériaux",
    "Auto-entrepreneur",
    "Startup",
    "Transport - Logistique",
    "Droit",
    "Enseignement - Formation",
    "Secrétariat - Accueil",
    "Immobilier",
    "Nouvelles technologies",
    "Banque - Finance - Assurance",
    "Entreposage - Stockage",
    "Services à la personne",
    "Grande distribution ",
    "Secteur automobile",
    "Agriculture",
    "Biologie - Chimie",
    "Agroalimentaire - Alimentation",
    "Opticien",
    "Architecture - Aménagement intérieur",
    "Artisanat - Métiers d'art",
    "Bâtiment - Travaux publics",
    "Communication - Information",
    "Culture - Spectacle",
    "Défense - Sécurité - Secours",
    "Edition - Imprimerie - Livre",
    "Environnement - Nature - Nettoyage",
    "Gestion - Audit - Ressources humaines",
    "Humanitaire",
    "Casinos",
    "Mécanique - Maintenance",
    "Numérique - Multimédia - Audiovisuel",
    "Soins - Esthétique - Coiffure",
    "Sport - Animation",
    "Profession libérale",
    "Particuliers",
    "Transport maritime",
    "Associations",
    "Comités d'entreprises",
    "Médical",
    "TPE - PME - ETI",
    "Sociétés Civiles",
    "Événementiel",
    "Notaire",
    "Commissaire Priseur",
    "Tourisme",
    "Tabac - Presse",
    "Franchisé",
    "E-commerce",
    "Artiste",
    "Coopérative",
    "Pharmacie",
    "Secteur public",
    "Agence d'intérim",
    "Agriculture/Viticulture",
    "Freelance",
    "Sanitaire",
    "Médico-social",
    "LMNP",
    "SCI",
    "Paramédical",
    "Agricole"
]
sectors.each do |s|
  SearchableAttribute.create(name: s, searchable_attribute_category: sac)
end
