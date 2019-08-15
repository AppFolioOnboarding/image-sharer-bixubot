# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rubocop:disable Metrics/LineLength
image_list = [
  { url: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bernese-mountain-dog-royalty-free-image-487880819-1565106514.jpg' },
  { url: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1094874726.png' },
  { url: 'https://nevadahumanesociety.org/wp-content/uploads/2018/08/NHS-Slider-03-1024x731.jpg' },
  { url: 'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half/public/field_blog_entry_images/2018-02/vicious_dog_0.png' },
  { url: 'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2019/06/19125928/Boxer-puppy-dog-eyes.jpg' },
  { url: 'https://www.jta.org/wp-content/uploads/2019/07/dog-dogs-2160x1200.jpg' },
  { url: 'https://cdn.science101.com/wp-content/uploads/2018/08/smart-beagle-810x608-1535480926636.jpg' },
  { url: 'https://dynaimage.cdn.cnn.com/cnn/w_768,h_1024,c_scale/https%3A%2F%2Fdynaimage.cdn.cnn.com%2Fcnn%2Fx_1229%2Cy_0%2Cw_2712%2Ch_3616%2Cc_crop%2Fhttps%253A%252F%252Fstamp.static.cnn.io%252F5b7ac48b4db3d70020c01c13%252Fshutterstock_1081879181.jpg' },
  { url: 'https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg' },
  { url: 'https://i.chzbgr.com/full/9336628480/hCCD922A4/' },
  { url: 'https://images-na.ssl-images-amazon.com/images/I/61KjxEenJmL._SX425_.jpg' },
  { url: 'https://i5.walmartimages.com/asr/c91e5e37-9591-447c-b99c-c5bf8bf7ef0e_1.95cdae7f000beb36e3eb7430b9a9e6ec.jpeg' },
  { url: 'https://i.ytimg.com/vi/d4IUQDD6lcY/0.jpg' },
  { url: 'https://amp.insider.com/images/5b50bd5351dfbe1f008b45c5-750-562.jpg' },
  { url: 'https://i.imgur.com/M18NkL5.jpg' },
  { url: 'https://www.popsci.com/resizer/n3H8h-tHwdoWONX8eSKBmY__0zs=/1008x672/arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/HNMBZXJOCZ7B7YOMWMXUVXMP3M.jpg' },
  { url: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/funny-dog-captions-1563456605.jpg' },
  { url: 'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fforbes-finds%2Ffiles%2F2019%2F02%2FPet-Tech-Feature_StockSnap-1200x800.jpg' },
  { url: 'https://www.thesprucepets.com/thmb/6C6Li90WJBrPGGyUHHVPaGCa38Y=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/29417882_162477504458741_2768493729537851392_n-5b87f20546e0fb00254aeb6c.jpg' },
  { url: 'https://www.rd.com/wp-content/uploads/2018/04/shutterstock_778330930-760x506.jpg' }
]
# rubocop:enable Metrics/LineLength

Image.create!(image_list)
