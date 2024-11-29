-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2024 at 06:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `price` float NOT NULL,
  `ratings` float NOT NULL,
  `stock` int(11) NOT NULL,
  `colors` varchar(100) NOT NULL,
  `category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `ratings`, `stock`, `colors`, `category`) VALUES
(1, 'iPhone 16', 'The iPhone 16 is the latest release from Apple, featuring cutting-edge 5G technology for ultra-fast internet speeds. With an A17 Bionic chip, the phone ensures smooth performance even with heavy apps. The camera system boasts impressive advancements, including improved low-light photography and cinematic mode for video recording. The display is vibrant with OLED technology, making every image and video pop with detail. Additionally, the iPhone 16 offers enhanced battery life, allowing you to stay connected throughout the day. Available in a variety of sleek colors like Black, Green, and Blue, this model is the perfect blend of style and functionality.', 999.99, 4.8, 50, 'Black, Green, Blue', 'phone'),
(2, 'Samsung Galaxy S22', 'Samsung Galaxy S22 offers a premium flagship experience with an excellent camera setup that includes a 50MP main sensor and an ultra-wide lens. Perfect for both photography enthusiasts and casual users, this phone captures stunning photos and videos in any light. The Galaxy S22 is powered by the latest Exynos chipset, delivering smooth multitasking and gaming performance. Its 6.1-inch AMOLED display provides vibrant colors, and the 120Hz refresh rate ensures buttery smooth scrolling. With an IP68 rating for water resistance and a sleek design, it is available in Black, White, and Green, making it as stylish as it is functional.', 899.99, 4.6, 60, 'Black, White, Green', 'phone'),
(3, 'OnePlus 10 Pro', 'The OnePlus 10 Pro is designed for speed and power, featuring an impressive 120Hz Fluid AMOLED display, perfect for gaming, streaming, and multitasking. Powered by the Snapdragon 8 Gen 1 processor, it offers blazing-fast performance and energy efficiency. The phone includes an advanced 50MP triple-camera system, designed to deliver crisp and clear shots in various lighting conditions. Fast charging is a standout feature, offering a full charge in just under 30 minutes. Whether you’re gaming, browsing, or watching videos, the OnePlus 10 Pro offers an exceptional experience with a premium look and feel, available in Black and Gray.', 749.99, 4.5, 70, 'Black, Gray', 'phone'),
(4, 'Google Pixel 7', 'Google Pixel 7 is packed with AI-driven features, making it the perfect smartphone for tech enthusiasts. Powered by the Google Tensor processor, it offers fast performance and intelligent features such as real-time language translation and enhanced Google Assistant capabilities. The 50MP camera captures detailed photos, while the 12MP ultrawide lens lets you get more in every shot. It also offers improved battery life and an OLED display for vibrant colors and sharp contrast. Running on the latest Android updates, the Pixel 7 is available in Black and White, combining innovative features with a clean, modern design.', 799.99, 4.7, 40, 'Black, White', 'phone'),
(5, 'Sony Ps5', 'The Sony PlayStation 5 revolutionizes gaming with its ultra-fast SSD that reduces load times dramatically and its powerful hardware, capable of 4K gaming at 60fps. With a custom-designed GPU and CPU, the PS5 supports ray tracing, offering stunning visual effects and lifelike graphics. The console is backwards compatible with PS4 games, allowing you to enjoy a vast library of titles while experiencing new games in the best possible quality. The included DualSense controller provides haptic feedback and adaptive triggers for a truly immersive gaming experience. Available in sleek white and slim designs, this is the ultimate gaming console.', 999.99, 5, 80, 'White, Slim', 'phone'),
(6, 'MacBook Air M2', 'The MacBook Air M2 combines performance with portability, featuring the revolutionary Apple M2 chip. With impressive power and efficiency, it handles everything from everyday tasks to more demanding creative applications with ease. Its 13.6-inch Liquid Retina display offers vibrant colors and sharp details, while the 1080p FaceTime HD camera ensures crystal-clear video calls. At just 2.7 pounds, the MacBook Air is ultra-lightweight and boasts an impressive 18 hours of battery life, making it perfect for on-the-go professionals. Available in Silver, Space Gray, and Gold, this laptop blends style with unmatched performance for a variety of needs.', 1299.99, 4.9, 30, 'Silver, Space Gray, Gold', 'laptop'),
(7, 'Dell XPS 13', 'The Dell XPS 13 is a powerful, compact laptop that delivers exceptional performance in a sleek design. Featuring Intel’s latest processors, it ensures fast and efficient multitasking, making it ideal for both professionals and creatives. The 13.4-inch InfinityEdge display offers a virtually borderless experience with stunning color accuracy and clarity. With a long-lasting battery, the XPS 13 ensures that you can work or stream for hours without interruption. The premium build quality and options in Black and White make this laptop a sophisticated choice for any user looking for power and elegance in a portable form factor.', 1099.99, 4.7, 25, 'Black, White', 'laptop'),
(8, 'HP Spectre x360', 'The HP Spectre x360 is a versatile convertible laptop with a 360-degree hinge, allowing you to seamlessly switch between laptop and tablet modes. The 13.5-inch OLED touchscreen display delivers vibrant visuals, with deep blacks and rich colors that bring your content to life. Powered by Intel Core i7 processors, this laptop delivers fast performance for all your tasks. It also boasts long battery life and a sleek, premium design, making it ideal for those who want a high-performance laptop that is both functional and stylish. Available in Blue and Silver, it’s perfect for creatives and professionals alike.', 1249.99, 4.6, 20, 'Blue, Silver', 'laptop'),
(9, 'Lenovo ThinkPad X1', 'The Lenovo ThinkPad X1 is built for business with its robust construction and impressive performance. With a 14-inch display, it offers vibrant visuals and options for Full HD or 4K resolution. Powered by Intel Core processors, it ensures smooth multitasking and high productivity. The ThinkPad X1 is known for its strong build quality, military-grade durability, and security features like a fingerprint scanner and IR camera for facial recognition. Whether you’re working on the go or in the office, this laptop offers the reliability and performance that professionals demand. Available in classic Black, this device is a true business companion.', 1399.99, 4.8, 15, 'Black', 'laptop'),
(10, 'Asus ZenBook 14', 'The Asus ZenBook 14 is an ultra-thin laptop that delivers exceptional performance and portability. Powered by Intel Core processors and featuring a 14-inch Full HD display, it offers great color accuracy and sharp visuals for both work and entertainment. At just 2.6 pounds, the ZenBook 14 is lightweight enough to carry anywhere, making it perfect for busy professionals. It offers fast charging, ensuring that you can get hours of use in just a short amount of time. Available in Gray and Blue, the ZenBook 14 is an elegant, high-performance laptop for those who want reliability and style in a compact package.', 999.99, 4.5, 40, 'Gray, Blue', 'laptop'),
(11, 'Polo T-Shirt', 'The Polo T-Shirt is a classic piece that combines comfort with style, making it perfect for everyday wear. Made from a soft cotton blend, this shirt is breathable and easy to maintain, ideal for casual outings or a laid-back office day. Featuring a classic polo collar and a button placket, it adds a touch of sophistication to your casual look. Available in vibrant colors like Red, Blue, and Green, this shirt can easily be paired with jeans or shorts for a relaxed yet stylish appearance. Whether for the weekend or a casual meeting, this versatile piece is a wardrobe essential.', 19.99, 4.3, 100, 'Red, Blue, Green', 'shirts'),
(12, 'Formal Shirt', 'The Formal Shirt is the perfect addition to any professional wardrobe, designed for the office or formal events. Crafted from high-quality cotton, it offers a crisp, neat look that exudes confidence. With a sharp collar, button-down front, and a tailored fit, this shirt provides both comfort and style. Available in classic White and Blue, it pairs effortlessly with suits, blazers, or ties, ensuring you look your best in any business setting. Whether you’re attending a meeting or a formal dinner, this shirt delivers timeless sophistication.', 29.99, 4.4, 80, 'White, Blue', 'shirts'),
(13, 'Graphic Tee', 'The Graphic Tee is a trendy and expressive T-shirt that lets you show off your personal style. Featuring bold graphic prints, this shirt stands out with its unique designs and vibrant colors. Made from soft cotton, it offers a comfortable fit that’s perfect for casual wear, whether you’re out with friends, running errands, or lounging at home. Available in Black and White, this versatile tee pairs easily with jeans, shorts, or even skirts for a cool, laid-back vibe. Express your creativity and add a pop of personality to your wardrobe with this eye-catching graphic tee.', 15.99, 4.2, 120, 'Black, White', 'shirts'),
(14, 'Oversized T-Shirt', 'The Oversized T-Shirt offers ultimate comfort with a relaxed fit and stylish graphic prints. Perfect for those who love the oversized trend, this T-shirt provides a laid-back, streetwear-inspired look. Made from soft, breathable cotton, it’s designed to keep you cool while offering a fashion-forward vibe. Available in a variety of colors including Blue, Red, Black, and Green, this T-shirt pairs well with everything from leggings to distressed jeans, making it a versatile choice for casual outings, lounging, or urban exploration. Embrace comfort and style with this must-have oversized T-shirt.', 25.99, 4.3, 90, 'Blue, Red, Black, Green', 'shirts'),
(15, 'Flannel Shirt', 'The Flannel Shirt is a cozy and stylish piece designed for colder weather, perfect for layering or wearing on its own. Made from soft, brushed cotton, it provides warmth without sacrificing breathability. The classic plaid design in Red and Black adds a touch of timeless style, while the relaxed fit ensures comfort throughout the day. This shirt can be worn as an outer layer over a T-shirt or buttoned up for a more structured look. Ideal for winter outings or casual weekend wear, the flannel shirt is a versatile addition to any wardrobe that pairs well with jeans, chinos, or boots.', 27.99, 4.5, 60, 'Red, Black', 'shirts'),
(16, 'Levi\'s 501 Jeans', 'The Levi’s 501 Jeans are the iconic straight-fit jeans that have become a staple in every wardrobe. Known for their classic, timeless design, these jeans are made from durable denim that only gets better with age. The button fly and signature red tab add authenticity, while the straight-leg fit offers a comfortable and versatile silhouette. Available in Blue and Black, they can be paired with almost anything, from casual T-shirts to formal shirts, making them perfect for both relaxed and more polished looks. Whether dressing up or down, Levi’s 501 Jeans provide a perfect balance of style and durability.', 59.99, 4.5, 90, 'Blue, Black', 'jeans'),
(17, 'Wrangler Slim Fit', 'The Wrangler Slim Fit Jeans are the perfect combination of style and comfort, offering a sleek, tailored look that’s ideal for modern casual wear. Made from high-quality denim, these jeans are soft yet durable, with just the right amount of stretch to keep you comfortable all day long. The slim-fit cut provides a more tailored look without feeling too tight, making them perfect for those who prefer a more contemporary, streamlined style. Available in Blue and Gray, these jeans pair well with a variety of tops and shoes, making them versatile for everyday wear or nights out.', 49.99, 4.4, 70, 'Blue, Gray', 'jeans'),
(18, 'Diesel Oversized Jeans', 'The Diesel Oversized Jeans are designed for a bold, fashion-forward look, featuring a relaxed, oversized fit for ultimate comfort and style. Made from premium-quality denim, these jeans are perfect for those who love a more casual, streetwear-inspired style. The loose fit ensures freedom of movement while maintaining a trendy, laid-back silhouette. Available in Black, these jeans can be styled with oversized T-shirts or hoodies for an effortless, cool look. Whether for weekend wear or a day out, Diesel Oversized Jeans make a statement with both their fit and design.', 79.99, 4.6, 40, 'Black', 'jeans'),
(19, 'Lee Regular Fit', 'The Lee Regular Fit Jeans are the perfect choice for those who prioritize comfort without sacrificing style. With a traditional fit that sits comfortably on the waist and straight legs, these jeans offer a classic, timeless silhouette. Made from soft yet durable denim, they provide flexibility and comfort throughout the day. Available in Dark Blue and Light Blue, these jeans can be dressed up or down, pairing well with everything from casual T-shirts to more formal shirts. Whether for work or weekend, the Lee Regular Fit Jeans offer a reliable, comfortable option for every occasion.', 54.99, 4.3, 100, 'Dark Blue, Light Blue', 'jeans'),
(20, 'GAP Stretch Jeans', 'The GAP Stretch Jeans combine flexibility and comfort, making them perfect for those who need jeans that move with them. Crafted from a high-stretch denim fabric, these jeans offer a slim, flattering fit that adapts to your body for all-day comfort. The stretchability allows for easy movement, whether you’re sitting, standing, or walking. Available in Black and Blue, these jeans provide a sleek, modern look that pairs well with a variety of outfits. Ideal for everyday wear or casual evenings out, the GAP Stretch Jeans are versatile and perfect for those who value both style and comfort.', 69.99, 4.4, 85, 'Black, Blue', 'jeans'),
(21, 'Nike Air Max', 'The Nike Air Max running shoes are engineered for ultimate comfort and performance. Featuring a signature Air Max sole, these shoes provide superior cushioning and support, making them ideal for running or everyday wear. The lightweight upper ensures breathability and flexibility, while the durable rubber outsole offers traction and stability. Available in Black, White, and Red, these stylish shoes can complement any active or casual outfit, whether you’re hitting the track or running errands. With their iconic design and innovative comfort features, Nike Air Max shoes are a must-have for any sports enthusiast or casual sneaker lover.', 99.99, 4.7, 100, 'Black, White, Red', 'shoes'),
(22, 'Adidas Ultraboost', 'Adidas Ultraboost shoes are known for their high-performance features and exceptional comfort. The Boost cushioning technology offers a responsive, cushioned feel with every step, making them perfect for running, training, or long hours on your feet. The Primeknit upper provides a snug, sock-like fit, ensuring breathability and flexibility. Available in Black and Blue, these shoes offer a sleek, modern design that pairs well with activewear or casual outfits. Whether you’re sprinting on the track or out for a walk, Adidas Ultraboost shoes deliver unmatched comfort and support.', 119.99, 4.8, 80, 'Black, Blue', 'shoes'),
(23, 'Puma Sneakers', 'The Puma Sneakers are perfect for casual wear, offering a blend of style and comfort that makes them suitable for both daily activities and relaxed outings. Featuring a sleek design and a cushioned insole, these sneakers provide long-lasting comfort throughout the day. The lightweight construction ensures breathability, while the rubber outsole offers reliable grip and durability. Available in White and Gray, these versatile sneakers pair effortlessly with jeans, shorts, or athleisure wear, providing a laid-back look with modern appeal. Whether running errands or hanging out with friends, Puma Sneakers are a stylish and comfortable choice.', 79.99, 4.4, 120, 'White, Gray', 'shoes'),
(24, 'Converse All Star', 'The Converse All Star is a true classic in the world of casual footwear. These iconic canvas shoes feature the signature rubber toe cap and a flexible, durable canvas upper, providing both comfort and a timeless style. The cushioned insole ensures a comfortable fit, while the rubber outsole offers traction and grip for all-day wear. Available in Black and White, Converse All Star shoes are versatile enough to pair with almost any casual outfit, from jeans to skirts, and are perfect for both men and women. With their easygoing, retro design, these shoes are a staple in any wardrobe.', 59.99, 4.6, 90, 'Black, White', 'shoes'),
(25, 'Reebok Training Shoes', 'Reebok Training Shoes are designed to keep you comfortable and supported during high-intensity workouts and training sessions. With a lightweight and breathable mesh upper, these shoes ensure excellent ventilation, while the cushioned midsole offers responsive support for every movement. The durable rubber outsole provides excellent grip, making them perfect for activities like weightlifting, running, or circuit training. Available in Blue and Black, these shoes combine function with style, providing the ideal balance of comfort and performance. Whether you’re hitting the gym or going for a run, Reebok Training Shoes are built to keep you at your best.', 89.99, 4.5, 70, 'Blue, Black', 'shoes'),
(26, 'Harry Potter', 'The Harry Potter series by J.K. Rowling follows the journey of a young wizard as he navigates a magical world filled with wonder, danger, and adventure. From his first encounter with the magical realm to the final battle against the dark wizard Voldemort, Harry Potter’s story is one of friendship, bravery, and self-discovery. With captivating characters and a richly detailed world, this series has become a global phenomenon, enchanting readers of all ages. Available in Paperback, this book is a perfect choice for those seeking an imaginative escape into a world of magic and mystery.', 15.99, 4.9, 200, 'Paperback', 'fiction'),
(27, 'Pride and Prejudice', 'Pride and Prejudice by Jane Austen is a timeless classic that explores themes of love, marriage, and social expectations in 19th-century England. The story follows Elizabeth Bennet as she navigates the complex relationships with her family, suitors, and the proud Mr. Darcy. Austen’s sharp wit and keen observations of society make this novel a beloved masterpiece. Available in both Paperback and Hardcover, it is perfect for readers who enjoy romance, social commentary, and the complexities of human nature.', 12.99, 4.8, 150, 'Paperback, Hardcover', 'fiction'),
(28, 'To Kill a Mockingbird', 'Harper Lee’s Pulitzer Prize-winning novel To Kill a Mockingbird is a poignant exploration of racism, morality, and justice in the American South. Told through the perspective of Scout Finch, a young girl, the story centers on her father, Atticus Finch, who defends a black man accused of raping a white woman. The novel addresses themes of prejudice, empathy, and the loss of innocence, making it an essential read for anyone interested in social issues and human rights. Available in Paperback, this book is both heart-wrenching and inspiring.', 10.99, 4.9, 180, 'Paperback', 'fiction'),
(29, 'The Great Gatsby', 'The Great Gatsby by F. Scott Fitzgerald is a quintessential American novel that explores the themes of wealth, love, and the pursuit of the American Dream in the Jazz Age. The story follows Nick Carraway as he becomes entangled in the life of his mysterious neighbor, Jay Gatsby, a man known for his lavish parties and obsession with the beautiful Daisy Buchanan. Through lush prose and vivid imagery, Fitzgerald paints a picture of a society caught up in excess and illusion. Available in both Paperback and Hardcover, this book remains a powerful commentary on the fragility of dreams and the dark side of success.', 9.99, 4.7, 120, 'Paperback, Hardcover', 'fiction'),
(30, 'Moby Dick', 'Moby Dick by Herman Melville is an epic novel about obsession, fate, and the sea. The story follows Captain Ahab, whose relentless pursuit of the great white whale, Moby Dick, leads him and his crew on a perilous journey across the oceans. Rich with symbolism and philosophical musings, this novel explores the limits of human knowledge, the dangers of obsession, and the mysteries of the natural world. Available in Paperback, Moby Dick is a must-read for anyone interested in classic literature, adventure, and the human spirit’s confrontation with the unknown.', 11.99, 4.6, 130, 'Paperback', 'fiction'),
(31, 'Dune', 'Dune by Frank Herbert is an epic science fiction novel set in a distant future where noble families vie for control of the desert planet Arrakis. Known for its intricate world-building, political intrigue, and exploration of ecological and religious themes, Dune is widely regarded as one of the greatest sci-fi novels of all time. The story follows Paul Atreides, a young man whose family is thrust into a deadly power struggle over the precious spice melange. Available in both Paperback and Hardcover, Dune is a must-read for fans of expansive, thought-provoking science fiction.', 14.99, 4.7, 90, 'Paperback, Hardcover', 'sci fi'),
(32, 'Neuromancer', 'Neuromancer by William Gibson is a groundbreaking cyberpunk classic that helped define the genre. The novel introduces Case, a washed-up computer hacker who is hired for a high-stakes job that takes him into the digital world of cyberspace. With its neon-lit, dystopian future, cyberspace, and artificial intelligence, Neuromancer explores themes of technology, consciousness, and the boundaries between reality and virtual worlds. Available in Paperback, this novel is essential for fans of fast-paced, mind-bending science fiction and cyberpunk.', 13.99, 4.5, 70, 'Paperback', 'sci fi'),
(33, 'Foundation', 'Foundation by Isaac Asimov is a sci-fi classic that explores the rise and fall of galactic civilizations. Set in a future where humanity has spread across the galaxy, the story follows Hari Seldon, a scientist who predicts the imminent collapse of the Galactic Empire. To preserve knowledge and shorten the period of chaos, he creates the Foundation, an organization dedicated to preserving and expanding human knowledge. Available in both Paperback and Hardcover, Foundation is an intellectual, sweeping tale of science, society, and the future, making it a must-read for fans of hard science fiction.', 11.99, 4.6, 60, 'Paperback, Hardcover', 'sci fi'),
(34, 'Ender\'s Game', 'Ender’s Game by Orson Scott Card is a gripping military science fiction novel about a young boy named Ender Wiggin who is recruited into a military academy to train for a war against an alien species. The novel explores themes of leadership, strategy, morality, and the consequences of war. As Ender rises through the ranks, he faces difficult decisions that challenge his notions of right and wrong. Available in Paperback, Ender’s Game is a thought-provoking, fast-paced story that appeals to readers of all ages who enjoy military sci-fi with emotional depth.', 10.99, 4.4, 100, 'Paperback', 'sci fi'),
(35, 'Snow Crash', 'Snow Crash by Neal Stephenson is a fast-paced cyberpunk novel set in a fragmented future America where a powerful drug called Snow Crash threatens both the virtual and physical worlds. The story follows Hiro Protagonist, a hacker and swordsman, as he uncovers a conspiracy involving the virtual reality Metaverse, ancient Sumerian language, and corporate greed. With its sharp wit, action-packed scenes, and philosophical undertones, Snow Crash is a thrilling ride for fans of cyberpunk and dystopian futures. Available in Paperback, this novel is a staple for readers who love innovative, genre-defining sci-fi.', 12.99, 4.3, 75, 'Paperback', 'sci fi'),
(36, 'The Shining', 'The Shining by Stephen King is a horror classic that takes readers on a terrifying journey into the haunted Overlook Hotel. The story follows Jack Torrance, an aspiring writer and recovering alcoholic, who accepts a job as the winter caretaker of the remote hotel. As winter storms isolate him and his family, Jack’s mental state deteriorates, influenced by supernatural forces. With chilling suspense, psychological horror, and unforgettable characters, The Shining is one of King’s most renowned works. Available in Paperback, this novel is perfect for fans of atmospheric, psychological horror.', 12.99, 4.8, 80, 'Paperback', 'horror'),
(37, 'Dracula', 'Dracula by Bram Stoker is the quintessential Gothic horror novel that introduced the iconic character of Count Dracula. Set in Victorian England, the story follows Jonathan Harker as he becomes entangled in the sinister plans of Dracula, a vampire lord who seeks to move from Transylvania to England to spread the undead curse. The novel explores themes of fear, desire, and the clash between the old world and modernity. Available in both Paperback and Hardcover, Dracula remains a timeless, haunting tale that has inspired countless adaptations and remains a staple of horror literature.', 9.99, 4.6, 100, 'Paperback, Hardcover', 'horror'),
(38, 'Frankenstein', 'Frankenstein by Mary Shelley is a groundbreaking Gothic horror novel that explores the consequences of scientific ambition and the quest for knowledge. The story follows Victor Frankenstein, a scientist who creates a living being from dead tissue, only to abandon his creation, which leads to tragedy and destruction. As the creature seeks revenge, Frankenstein grapples with the horrors of his own actions. Available in Paperback, Frankenstein is a timeless exploration of morality, the dangers of unchecked ambition, and the consequences of playing god, making it a cornerstone of horror literature.', 8.99, 4.5, 90, 'Paperback', 'horror'),
(39, 'Pet Sematary', 'Pet Sematary by Stephen King is a chilling horror novel that delves into themes of grief, death, and the unnatural consequences of tampering with the natural order. The story follows Louis Creed, a family man who moves to a rural town and discovers a cemetery where pets buried there mysteriously come back to life. When tragedy strikes his own family, Louis is faced with an impossible decision that leads to horrific consequences. Available in Paperback, Pet Sematary is a disturbing exploration of the lengths people will go to reverse death and the terrifying aftermath of their choices.', 10.99, 4.7, 85, 'Paperback', 'horror'),
(40, 'It', 'It by Stephen King is a terrifying novel that revolves around a malevolent entity that takes the form of a clown, terrorizing the small town of Derry, Maine. The story alternates between two timelines, following a group of childhood friends who face their worst fears when the entity resurfaces years later. With its gripping narrative and deeply unsettling atmosphere, It explores themes of childhood trauma, friendship, and the horrors that lurk in the dark corners of the mind. Available in both Paperback and Hardcover, this epic novel is a must-read for fans of supernatural horror and psychological terror.', 14.99, 4.8, 70, 'Paperback, Hardcover', 'horror'),
(41, 'Herbal Essences Shampoo', 'Herbal Essences Shampoo is a nourishing formula designed for daily use, providing your hair with the gentle care it needs. Infused with natural ingredients, it helps to cleanse and revitalize hair, leaving it feeling soft, silky, and refreshed. The shampoo works effectively to remove buildup and impurities while maintaining your hair’s natural moisture balance. Available in a convenient Bottle, Herbal Essences Shampoo is perfect for those looking for a hair care solution that promotes healthy and shiny hair every day.', 6.99, 4.3, 150, 'Bottle', 'shampoo'),
(42, 'Head & Shoulders', 'Head & Shoulders is an anti-dandruff shampoo that helps to eliminate flakes while maintaining the health of your scalp and hair. Formulated with active ingredients to fight dandruff, this shampoo also nourishes the hair, making it feel soft and smooth. Whether you have a dry, itchy scalp or are looking for a reliable solution to dandruff, Head & Shoulders offers long-lasting protection and comfort. Available in a Bottle, it’s a go-to choice for people seeking a scalp-care shampoo that provides both dandruff control and hair nourishment.', 7.99, 4.4, 140, 'Bottle', 'shampoo'),
(43, 'Pantene Pro-V', 'Pantene Pro-V Strengthening Shampoo is formulated to provide deep nourishment and help strengthen hair from root to tip. With its Pro-V formula, it works to improve hair’s resilience against damage while boosting shine and softness. Ideal for all hair types, this shampoo helps keep hair looking healthy and vibrant by replenishing moisture and maintaining strength. Available in a Bottle, Pantene Pro-V is a great choice for anyone seeking a shampoo that combines hair care with strength and shine.', 8.49, 4.5, 130, 'Bottle', 'shampoo'),
(44, 'Dove Shampoo', 'Dove Moisturizing Shampoo is designed to provide your hair with essential moisture, leaving it smooth, soft, and beautifully nourished. This shampoo gently cleanses while deeply moisturizing, helping to restore the natural moisture balance of your hair. Perfect for dry or damaged hair, Dove Moisturizing Shampoo gives you healthier-looking hair with a silky finish. Available in a Bottle, it’s the ideal shampoo for anyone wanting to add moisture and smoothness to their hair care routine.', 7.49, 4.6, 160, 'Bottle', 'shampoo'),
(45, 'Garnier Fructis', 'Garnier Fructis Shampoo is formulated to add volume and shine to your hair while nourishing it with fruit-derived ingredients. This shampoo gently cleanses hair while enhancing its natural body and radiance, leaving it looking healthy and full of life. With a refreshing scent, it revitalizes both your hair and senses, providing a boost of vitality. Available in a Bottle, Garnier Fructis is a great option for those looking to add volume and shine to their hair with a naturally inspired shampoo.', 6.99, 4.4, 145, 'Bottle', 'shampoo'),
(46, 'Philips Trimmer', 'The Philips Trimmer is a versatile grooming tool designed for men who want precision and convenience. With multiple length settings, it allows you to achieve the perfect trim for your beard, mustache, or hair. The trimmer features a powerful motor and sharp blades that provide a smooth cutting experience. Its ergonomic design ensures a comfortable grip and easy handling during use. Available in Black, this trimmer is a great choice for men seeking a reliable, easy-to-use grooming tool for all their trimming needs.', 24.99, 4.6, 60, 'Black', 'trimmer'),
(47, 'Braun Beard Trimmer', 'The Braun Beard Trimmer offers high-precision trimming with multiple length settings for a customizable grooming experience. It is equipped with a sharp, durable blade system that delivers accurate cuts, whether you want a clean shave or a well-groomed beard. The trimmer’s ergonomic design ensures comfort and control, and its long battery life makes it ideal for regular use. Available in Black, the Braun Beard Trimmer is perfect for men who want a premium, efficient trimmer for their beard care.', 29.99, 4.7, 50, 'Black', 'trimmer'),
(48, 'Mi Cordless Trimmer', 'The Mi Cordless Trimmer is an affordable yet highly functional grooming tool designed to provide a precise trim with ease. Featuring USB charging, it offers convenience and portability, making it perfect for travel or use at home. The trimmer comes with multiple comb attachments for different lengths and styles, ensuring you can achieve the desired look. Available in Black and Blue, the Mi Cordless Trimmer is a budget-friendly option for those looking for quality and practicality in a grooming tool.', 19.99, 4.4, 70, 'Black, Blue', 'trimmer'),
(49, 'Panasonic Grooming Kit', 'The Panasonic Grooming Kit is a multi-functional grooming tool that includes everything you need for a professional-level grooming experience. With various attachments for trimming your hair, beard, and even body hair, it provides versatility for all your grooming needs. The sharp, durable blades ensure precise cuts, while the ergonomic design makes it easy to handle. Available in Black, this grooming kit is a great all-in-one solution for men who want a comprehensive, high-quality trimmer for all occasions.', 34.99, 4.6, 45, 'Black', 'trimmer'),
(50, 'Wahl Clipper', 'The Wahl Clipper is a professional-grade hair and beard clipper designed for precision and durability. Equipped with high-performance blades and multiple adjustable settings, it allows for an easy and smooth trimming experience. Whether you’re trimming hair, shaping a beard, or cutting hair at home, the Wahl Clipper offers exceptional quality and control. Available in Black and Silver, this clipper is perfect for men looking for a powerful, reliable tool to achieve salon-quality results at home.', 39.99, 4.8, 35, 'Black, Silver', 'trimmer');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `record_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `author_name` varchar(30) NOT NULL,
  `review_content` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`record_id`, `product_id`, `author_name`, `review_content`) VALUES
(1, 1, 'Alice Johnson', 'This product exceeded my expectations. Very satisfied with the quality and would definitely recommend it to others.'),
(2, 1, 'Bob Smith', 'A solid choice for anyone looking for good quality at a reasonable price. It has performed well so far.'),
(3, 1, 'Charlie Brown', 'Works as advertised and seems quite durable. No complaints so far, and I’m pleased with the purchase.'),
(4, 2, 'David Williams', 'Great product for everyday use! It has proven to be reliable, and I am glad I made the purchase.'),
(5, 2, 'Evelyn Thompson', 'Exactly as described and works perfectly. Could not ask for more at this price point.'),
(6, 2, 'Frank Miller', 'Good value overall, though there is room for minor improvements. Still, a worthy buy.'),
(7, 3, 'Grace Davis', 'Very happy with this product! It serves my needs well, and I would recommend it to friends and family.'),
(8, 3, 'Henry Martinez', 'Does the job just fine. Reliable and well-made, though nothing extraordinary.'),
(9, 3, 'Isabella Garcia', 'Nice product, meets all my needs without any issues. Quality is as expected and consistent.'),
(10, 4, 'John Rodriguez', 'Impressed with the build and functionality. It’s been a good investment so far.'),
(11, 4, 'Linda Martinez', 'Solid performance for the price. Would consider buying again in the future if needed.'),
(12, 4, 'Michael Hernandez', 'Good quality and performs as advertised. Highly recommended for anyone looking for a dependable option.'),
(13, 5, 'Natalie Clark', 'Satisfied with the product. It’s everything I needed and has been a reliable choice.'),
(14, 5, 'Oliver Lewis', 'Happy with the purchase; it’s reliable and performs as described. Great for everyday use.'),
(15, 5, 'Paula Walker', 'Really pleased with this item. It has worked well and is exactly as I had hoped.'),
(16, 6, 'Quinn Hall', 'This product is fantastic! High quality and very dependable in every way.'),
(17, 6, 'Rachel Young', 'The quality is impressive and it serves its purpose well. Great choice!'),
(18, 6, 'Steve King', 'Glad I bought this. It works reliably and meets my standards.'),
(19, 7, 'Tina Wright', 'Highly recommend it. The quality and usability are top-notch, making this a great find.'),
(20, 7, 'Ulysses Green', 'Performs perfectly, exactly as described. It’s been a great addition to my collection.'),
(21, 8, 'Victoria Adams', 'Satisfied with how well this product performs. It’s just what I was looking for.'),
(22, 8, 'William Perez', 'Works as expected, with a nice design and reliable quality.'),
(23, 9, 'Xavier Lee', 'Very reliable product with no issues so far. A good investment overall.'),
(24, 9, 'Yolanda Scott', 'Quality and durability are excellent. A very practical choice for everyday use.'),
(25, 10, 'Zachary Hill', 'Really pleased with the purchase. It has held up well with frequent use.'),
(26, 11, 'Amy Nelson', 'This product is exactly what I needed. Very happy with the quality and durability.'),
(27, 11, 'Brian Cook', 'Works well, and the build quality is excellent. Highly recommend for anyone considering it.'),
(28, 11, 'Catherine Evans', 'So far, it has exceeded my expectations. Great value for the money.'),
(29, 12, 'Daniel Edwards', 'Impressive product, sturdy and reliable. I would buy it again.'),
(30, 12, 'Emma Stewart', 'Very happy with this purchase, as it works just as described. No issues at all.'),
(31, 13, 'Franklin Hughes', 'Satisfied with the performance. Great for everyday use.'),
(32, 13, 'Grace Phillips', 'This product is well made and does exactly what it promises. No complaints.'),
(33, 14, 'Hannah Foster', 'Excellent choice. I am pleased with how well this product performs.'),
(34, 14, 'Isaac Russell', 'Good quality, very durable. Would recommend it to others.'),
(35, 15, 'James Powell', 'Solid product that meets all my expectations. Worth the price.'),
(36, 15, 'Karen Cooper', 'I’m impressed with this item. Reliable and performs as advertised.'),
(37, 15, 'Louis Howard', 'Works well and holds up under regular use. Would purchase again.'),
(38, 16, 'Mia Ward', 'Fantastic quality and reliable performance. Couldn’t be happier.'),
(39, 16, 'Noah Turner', 'The product is as described, and I’m quite pleased with it.'),
(40, 17, 'Olivia Morgan', 'Overall, a great buy. Works well and seems durable.'),
(41, 17, 'Peter Torres', 'I am satisfied with this product’s performance. Reliable and affordable.'),
(42, 18, 'Quinn Peterson', 'Impressed with how well this product works. It’s been a good purchase.'),
(43, 18, 'Rebecca Gray', 'Excellent value, and I’m very pleased with the quality.'),
(44, 19, 'Samuel Ramirez', 'Just what I was looking for. This product meets my expectations.'),
(45, 19, 'Tina Flores', 'Good quality and affordable. I’d recommend it to others.'),
(46, 20, 'Uma Morales', 'Very pleased with this product. It has worked well so far.'),
(47, 20, 'Victor Price', 'Exactly as described and functions perfectly. Highly recommended.'),
(48, 21, 'Wendy Hughes', 'The quality is better than I expected. Very happy with it.'),
(49, 21, 'Xander Fisher', 'Good choice for the price. Works well and has held up nicely.'),
(50, 22, 'Yara Brooks', 'High quality and reliable. Would definitely recommend.'),
(51, 22, 'Zane Powell', 'Very satisfied with this purchase. It performs as expected.'),
(52, 23, 'Amy Nelson', 'Great product and exactly what I needed. The quality is excellent.'),
(53, 23, 'Brian Cook', 'Works as advertised and has been very reliable so far.'),
(54, 24, 'Catherine Evans', 'Happy with this product. It’s dependable and well-made.'),
(55, 24, 'Daniel Edwards', 'Good for everyday use and works as expected. No complaints.'),
(56, 25, 'Emma Stewart', 'Solid performance and well worth the price.'),
(57, 25, 'Franklin Hughes', 'I’m pleased with this product. It does what it’s supposed to do.'),
(58, 26, 'Grace Phillips', 'A quality product at a great price. Would buy again.'),
(59, 26, 'Hannah Foster', 'Very happy with this purchase. It has exceeded my expectations.'),
(60, 27, 'Isaac Russell', 'The product has been great. Reliable and high quality.'),
(61, 27, 'James Powell', 'Very impressed with how well it works. A good investment.'),
(62, 28, 'Karen Cooper', 'Works perfectly and meets my needs. Highly recommend.'),
(63, 28, 'Louis Howard', 'Good choice for the price. Does everything I need it to do.'),
(64, 29, 'Mia Ward', 'Happy with the quality and durability. It’s a solid product.'),
(65, 29, 'Noah Turner', 'A great product that performs as expected. Would buy again.'),
(66, 30, 'Olivia Morgan', 'Fantastic product, really pleased with the quality.'),
(67, 30, 'Peter Torres', 'Does a great job and has held up well with regular use.'),
(68, 31, 'Quinn Peterson', 'Good product and reliable performance. Very satisfied.'),
(69, 31, 'Rebecca Gray', 'Quality is excellent and it works just as advertised.'),
(70, 32, 'Samuel Ramirez', 'Pleased with this purchase. Reliable and well-made.'),
(71, 32, 'Tina Flores', 'Excellent choice for the price. Works great.'),
(72, 33, 'Uma Morales', 'Very happy with the quality. Exactly what I was looking for.'),
(73, 33, 'Victor Price', 'Performs well and is made to last. Highly recommend.'),
(74, 34, 'Wendy Hughes', 'A solid product that meets all my expectations.'),
(75, 34, 'Xander Fisher', 'Good quality and works as described. Satisfied with it.'),
(76, 35, 'Yara Brooks', 'Very pleased with this item. Good for the price.'),
(77, 35, 'Zane Powell', 'Great product and value. Would definitely recommend.'),
(78, 36, 'Amy Nelson', 'Good performance and reliability. Very satisfied with it.'),
(79, 36, 'Brian Cook', 'Quality is top-notch and it works well for my needs.'),
(80, 37, 'Catherine Evans', 'Met my expectations and seems durable. Good purchase.'),
(81, 37, 'Daniel Edwards', 'Good quality, and has been very reliable so far.'),
(82, 38, 'Emma Stewart', 'Impressed with the product. Solid and dependable.'),
(83, 38, 'Franklin Hughes', 'Well-made and works as expected. Great purchase.'),
(84, 39, 'Grace Phillips', 'Excellent choice, and I would buy it again.'),
(85, 39, 'Hannah Foster', 'Very pleased with this product. Quality is great.'),
(86, 40, 'Isaac Russell', 'Highly recommend! A good choice for the price.'),
(87, 40, 'James Powell', 'A solid product that does the job well. Would buy again.'),
(88, 41, 'Karen Cooper', 'Very happy with the purchase. It’s reliable and well-made.'),
(89, 41, 'Louis Howard', 'Good quality and works as advertised. No complaints.'),
(90, 42, 'Mia Ward', 'This product has been reliable and is of good quality.'),
(91, 42, 'Noah Turner', 'Well worth the price, very pleased with it.'),
(92, 43, 'Olivia Morgan', 'Happy with the quality and performance.'),
(93, 43, 'Peter Torres', 'Solid product, dependable and well-priced.'),
(94, 44, 'Quinn Peterson', 'Very happy with this product. It’s exactly what I needed.'),
(95, 44, 'Rebecca Gray', 'Great product for the price. Works perfectly.'),
(96, 45, 'Samuel Ramirez', 'Reliable and performs well. Highly recommend.'),
(97, 45, 'Tina Flores', 'Good quality and exactly as described.'),
(98, 46, 'Uma Morales', 'Happy with this product. It has met all my expectations.'),
(99, 46, 'Victor Price', 'A dependable choice. Well worth the purchase price.'),
(100, 47, 'Wendy Hughes', 'Exactly as expected. Great value and performance.'),
(101, 47, 'Xander Fisher', 'Good quality, and has held up well with regular use.'),
(102, 48, 'Yara Brooks', 'This product works perfectly and is very reliable.'),
(103, 48, 'Zane Powell', 'Very satisfied. Does exactly what I need it to do.'),
(104, 49, 'Amy Nelson', 'Pleased with the quality and functionality. Good choice.'),
(105, 49, 'Brian Cook', 'A reliable product that’s worth the price.'),
(106, 50, 'Catherine Evans', 'Happy with this product. Solid quality and reliable.'),
(107, 50, 'Daniel Edwards', 'Very dependable, and works as described.');


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
