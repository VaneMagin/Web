CREATE DATABASE Documents;

USE Documents;

CREATE TABLE Ref_Document_Types
(
	document_type_code CHAR(15) NOT NULL,
	document_type_description VARCHAR(80) NOT NULL,
	
	CONSTRAINT pkRef_Document_Types
	PRIMARY KEY (document_type_code)
);

CREATE TABLE Roles
(
	role_code CHAR(15) NOT NULL,
	role_description VARCHAR(255) NOT NULL,
	
	CONSTRAINT pkRoles
	PRIMARY KEY (role_code)
);

CREATE TABLE Images
(
	image_id INTEGER NOT NULL,
	image_alt_text VARCHAR(255) NOT NULL,
	image_name VARCHAR(255) NOT NULL,
	image_url VARCHAR(255) NOT NULL,
	
	CONSTRAINT pkImages
	PRIMARY KEY (image_id)
);

CREATE TABLE Functional_Areas
(
	functional_area_code CHAR(15) NOT NULL,
	parent_functional_area_code CHAR(15) NOT NULL,
	functional_area_description VARCHAR(80) NOT NULL,
	
	CONSTRAINT pkFunctional_Areas
	PRIMARY KEY (functional_area_code),
	
	CONSTRAINT fkFunctional_AreasFunctional_Areas
	FOREIGN KEY (parent_functional_area_code)
	REFERENCES Functional_Areas(functional_area_code)
	--ON DELETE RESTRICT
	--ON UPDATE RESTRICT
);

CREATE TABLE Document_Structures
(
	document_structure_code CHAR(15) NOT NULL,
	parent_document_structure_code CHAR(15) NOT NULL,
	document_structure_description VARCHAR(255) NOT NULL,
	
	CONSTRAINT pkDocument_Structures
	PRIMARY KEY (document_structure_code),
	
	CONSTRAINT fkDocument_StructuresDocument_Structures
	FOREIGN KEY (parent_document_structure_code)
	REFERENCES Document_Structures(document_structure_code)
	--ON DELETE RESTRICT
	--ON UPDATE RESTRICT
);

CREATE TABLE Users
(
	user_id INTEGER NOT NULL,
	role_code CHAR(15) NOT NULL,
	user_name VARCHAR(255) NOT NULL,
	user_login VARCHAR(255) NOT NULL,
	password VARCHAR(40) NOT NULL,
	other_details VARCHAR(255) NOT NULL,
	
	CONSTRAINT pkUsers
	PRIMARY KEY (user_id),
	CONSTRAINT fkUsersRoles
	FOREIGN KEY (role_code)
	REFERENCES Roles(role_code)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Documents
(
	document_code CHAR(15) NOT NULL,
	document_structure_code CHAR(15) NOT NULL,
	document_type_code CHAR(15) NOT NULL,
	access_count INTEGER NOT NULL,
	document_name VARCHAR(255) NOT NULL,
	document_description VARCHAR(40) NOT NULL,
	other_details VARCHAR(255) NOT NULL,
	
	CONSTRAINT pkDocuments
	PRIMARY KEY (document_code),
	
	CONSTRAINT fkDocumentsDocument_Structures
	FOREIGN KEY (document_structure_code)
	REFERENCES Document_Structures(document_structure_code)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE,
	
	CONSTRAINT fkDocumentsRef_Document_Types
	FOREIGN KEY(document_type_code)
	REFERENCES Ref_Document_Types(document_type_code)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Document_Sections
(
	section_id INTEGER NOT NULL,
	document_code CHAR(15) NOT NULL,
	section_sequence INTEGER NOT NULL,
	section_code CHAR(20) NOT NULL,
	section_title VARCHAR(80) NOT NULL,
	section_text TEXT NOT NULL,
	
	CONSTRAINT pkDocument_Sections
	PRIMARY KEY(section_id),
	
	CONSTRAINT fkDocument_SectionsDocuments
	FOREIGN KEY(document_code)
	REFERENCES Documents(document_code)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Document_Functional_Areas
(
	document_code CHAR(15) NOT NULL,
	functional_area_code CHAR(15) NOT NULL,
	
	CONSTRAINT pkDocument_Functional_Areas
	PRIMARY KEY(document_code, functional_area_code),
	
	CONSTRAINT fkDocument_Functional_AreasDocuments
	FOREIGN KEY(document_code)
	REFERENCES Documents(document_code)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE,
	
	CONSTRAINT fkDocument_Functional_AreasFunctional_Areas
	FOREIGN KEY (functional_area_code)
	REFERENCES Functional_Areas(functional_area_code)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Role_Documents_Access_Rights
(
	role_code CHAR(15) NOT NULL,
	document_code CHAR(15) NOT NULL,
	CRUD_Value CHAR(8) NOT NULL,
	
	CONSTRAINT pkRole_Documents_Access_Rights
	PRIMARY KEY (role_code, document_code),
	
	CONSTRAINT fkRole_Documents_Acces_RightsRoles
	FOREIGN KEY (role_code)
	REFERENCES Roles(role_code)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE,
	
	CONSTRAINT fkRole_Documents_Acces_RightsDocuments
	FOREIGN KEY (document_code)
	REFERENCES Documents(document_code)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Document_Sections_Images
(
	section_id INTEGER NOT NULL,
	image_id INTEGER NOT NULL,
	
	CONSTRAINT pkDocument_Sections_Images
	PRIMARY KEY (section_id, image_id),
	
	CONSTRAINT pkDocument_Sections_ImagesDocument_Sections
	FOREIGN KEY (section_id)
	REFERENCES Document_Sections(section_id)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE,
	
	CONSTRAINT Document_Sections_ImagesImages
	FOREIGN KEY (image_id)
	REFERENCES Images (image_id)
	--ON DELETE RESTRICT
	ON UPDATE CASCADE
);


sp_help