create database elite_captures_db;
USE elite_captures_db;
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert some sample photography categories
INSERT INTO categories (name, description) VALUES
('Wedding Photography', 'Capturing the special moments of weddings, from ceremonies to receptions.'),
('Portrait Photography', 'Focusing on individuals or groups, often emphasizing expression, personality, and mood.'),
('Event Photography', 'Documenting various events like conferences, concerts, parties, and corporate gatherings.'),
('Landscape Photography', 'Showcasing natural scenery, including mountains, forests, oceans, and deserts.'),
('Street Photography', 'Capturing candid moments and everyday life in public places.'),
('Fashion Photography', 'Displaying clothing, accessories, and other fashion items, often for magazines or advertisements.'),
('Wildlife Photography', 'Photographing animals in their natural habitats.'),
('Product Photography', 'Creating appealing images of products for e-commerce, catalogs, or marketing materials.');

-- Create the 'photos' table if it doesn't already exist
-- This table will store all your photography images, linked to their respective categories.
CREATE TABLE IF NOT EXISTS photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL, -- Foreign key to link to the 'categories' table
    image_url VARCHAR(255) NOT NULL,
    title VARCHAR(255), -- A title for the photo
    description TEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
    ON DELETE CASCADE -- If a category is deleted, its associated photos are also deleted
);


-- Insert wedding images into the 'photos' table
-- Ensure 'Wedding Photography' exists in your 'categories' table.
-- Replace 'your-github-username' and 'your-repo-name' with your actual GitHub details.

INSERT INTO photos (category_id, image_url, title, description) VALUES
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/476445201_636591332239273_5658211438799581746_n.jpg?raw=true', 'Wedding Photo 1', 'A beautiful moment from the wedding day.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/480599602_651431967421876_2442597475910893422_n.jpg?raw=true', 'Wedding Photo 2', 'Capturing the joy of the celebration.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/480782752_651431917421881_5875084187694703420_n.jpg?raw=true', 'Wedding Photo 3', 'An intimate wedding scene.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/481053378_651432074088532_4600179643678987853_n.jpg?raw=true', 'Wedding Photo 4', 'Candid shot of the happy couple.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/481053756_651431977421875_7363351881253335958_n.jpg?raw=true', 'Wedding Photo 5', 'Details of the wedding.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/481074901_653451923886547_2226404986532225635_n.jpg?raw=true', 'Wedding Photo 6', 'Emotional moment captured.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/494645532_705111062053966_1087926887552615841_n.jpg?raw=true', 'Wedding Photo 7', 'Celebration with guests.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/495503234_705140435384362_8678972669433330749_n.jpg?raw=true', 'Wedding Photo 8', 'The joyous atmosphere.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/495575200_705111982053874_6097088827556545631_n.jpg?raw=true', 'Wedding Photo 9', 'A memorable wedding day.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496097297_705111268720612_787758223704246421_n.jpg?raw=true', 'Wedding Photo 10', 'Happy couple on their special day.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496175663_704077925490613_7508241754153473371_n.jpg?raw=true', 'Wedding Photo 11', 'The beautiful ceremony.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496226820_705111938720545_2269742191171711008_n.jpg?raw=true', 'Wedding Photo 12', 'Love in the air.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496302765_705140328717706_6282940367404186038_n.jpg?raw=true', 'Wedding Photo 13', 'A perfect wedding moment.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496582585_705140242051048_2870805492835749413_n.jpg?raw=true', 'Wedding Photo 14', 'Unforgettable wedding day.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496767700_705140782050994_1512150773098842145_n.jpg?raw=true', 'Wedding Photo 15', 'Cherished wedding memories.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496767907_705111595387246_5783824161412336002_n.jpg?raw=true', 'Wedding Photo 16', 'The beginning of forever.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/496818298_705140485384357_3309460157395334943_n.jpg?raw=true', 'Wedding Photo 17', 'Joyful wedding celebration.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/497511924_708896321675440_2514511361850174252_n.jpg?raw=true', 'Wedding Photo 18', 'A candid moment.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/497511938_708896015008804_3317866121596255058_n.jpg?raw=true', 'Wedding Photo 19', 'Beautiful wedding details.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/497525259_708894635008942_3816506684889808132_n.jpg?raw=true', 'Wedding Photo 20', 'The happy couple.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/497525772_708894155008990_2520794111427832405_n.jpg?raw=true', 'Wedding Photo 21', 'Emotional vows.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/497530668_708894501675622_3649766557743486761_n.jpg?raw=true', 'Wedding Photo 22', 'A memorable day.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/497589189_708893611675711_689718368285127018_n.jpg?raw=true', 'Wedding Photo 23', 'Celebration and joy.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/497864972_708894281675644_7721522656653801531_n.jpg?raw=true', 'Wedding Photo 24', 'The wedding party.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/498242690_708896121675460_6296303315004325453_n.jpg?raw=true', 'Wedding Photo 25', 'Love and laughter.'),
((SELECT id FROM categories WHERE name = 'Wedding Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/weddings/499160049_708896415008764_2925834047096371973_n.jpg?raw=true', 'Wedding Photo 26', 'A beautiful union.');

INSERT INTO photos (category_id, image_url, title, description) VALUES
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/488592327_678446814720391_7026634361442363114_n.jpg?raw=true', 'Portrait Photo 1', 'A captivating portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/489278975_680205621211177_1072429395483831058_n.jpg?raw=true', 'Portrait Photo 2', 'Expressive portraiture.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/488866428_679129211318818_1018627419548108932_n.jpg?raw=true', 'Portrait Photo 3', 'Personality captured.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/489338545_681620754402997_6354642833064978249_n.jpg?raw=true', 'Portrait Photo 4', 'A striking individual portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/489388219_682192224345850_6424928973431467223_n.jpg?raw=true', 'Portrait Photo 5', 'Detailed and focused.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/489591973_680909604474112_4944842414384803276_n.jpg?raw=true', 'Portrait Photo 6', 'Evocative portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/490266101_682781387620267_1305313538173024436_n.jpg?raw=true', 'Portrait Photo 7', 'Close-up portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/490270089_691648800066859_3324340518156001248_n.jpg?raw=true', 'Portrait Photo 8', 'Artistic portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/490518101_683499480881791_4315226004064757498_n.jpg?raw=true', 'Portrait Photo 9', 'Study of expression.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/490942476_687723417126064_9098509969917962138_n.jpg?raw=true', 'Portrait Photo 10', 'Thoughtful pose.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/491046208_687724900459249_7416603895863718135_n.jpg?raw=true', 'Portrait Photo 11', 'Elegant portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/491171748_685278347370571_3742793247693660388_n.jpg?raw=true', 'Portrait Photo 12', 'Vibrant portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/491241003_686244633940609_2641128741519646635_n.jpg?raw=true', 'Portrait Photo 13', 'Dynamic portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/491351201_689367793628293_3145642120913239066_n.jpg?raw=true', 'Portrait Photo 14', 'Authentic portrayal.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/491881914_688549210376818_9188768127164723086_n.jpg?raw=true', 'Portrait Photo 15', 'Classic portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/492023226_692248050006934_7645266422469377407_n.jpg?raw=true', 'Portrait Photo 16', 'Modern portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/493149856_693465336551872_8686480774870566819_n.jpg?raw=true', 'Portrait Photo 17', 'Bold portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/493199863_692789746619431_2175658725651370303_n.jpg?raw=true', 'Portrait Photo 18', 'Soft light portrait.'),
((SELECT id FROM categories WHERE name = 'Portrait Photography'), 'https://github.com/Urswin-Faro/Assets_EC/blob/main/portraits/493159736_694810433084029_4166173316392219691_n.jpg?raw=true', 'Portrait Photo 19', 'Serene portrait.');