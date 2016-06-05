a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! {|x| x.split(' ')}
a.flatten!
p a
