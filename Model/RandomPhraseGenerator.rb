#Generates a random phrase
class RandomPhraseGenerator

	def generate

		@phrase = ["Poesia es la union de dos palabras que uno nunca supuso que pudieran juntarse, y que forman algo asi como un misterio.",
					"La poesia huye, a veces, de los libros para anidar extramuros, en la calle, en el silencio, en los suenos, en la piel, en los escombros, incluso en la basura. Donde no suele cobijarse nunca es en el verbo de los subsecretarios, de los comerciantes o de los lechuginos de television.",
					"Al contacto del amor todo el mundo se vuelve poeta.",
					"La poesia es el sentimiento que le sobra al corazon y te sale por la mano.",
					"Los poetas inmaduros imitan; los poetas maduros roban; los malos estropean lo que roban, y los buenos lo convierten en algo mejor.",
					"Digamos que existen dos tipos de mentes poeticas: una apta para inventar fabulas y otra dispuesta a creerlas.",
					"No digais que, agotado su tesoro, de asuntos falta, enmudecio la lira: podra no haber poetas pero siempre habra poesia.",
					"Cada poema es unico. En cada obra late, con mayor o menor grado, toda la poesia. Cada lector busca algo en el poema. Y no es insolito que lo encuentre: Ya lo llevaba dentro.",
					"La poesia es el eco de la melodia del universo en el corazon de los humanos.",
					"Hacer versos malos depara mas felicidad que leer los versos mas bellos.",
					"En el fondo, un poema no es algo que se ve, sino la luz que nos permite ver. Y lo que vemos es la vida.",
					"El mes que es abundante de poesia, suele serlo de hambre.",
					"La poesia se escribe cuando ella quiere.",
					"Los poetas son hombres que han conservado sus ojos de nino.",
					"La poesia no tiene tiempo, el que la lee la rescata, la hace presente y luego la regresa a su eternidad.",
					"Hay que saber que no existe pais sobre la tierra donde el amor no haya convertido a los amantes en poetas.",
					"El vino siembra poesia en los corazones.",
					"El poeta es un mentiroso que siempre dice la verdad.",
					"Ante la poesia, tanto da temblar como comprender.",
					"Cuando un poeta canta estamos en sus manos: el es el que sabe despertar en nosotros aquellas fuerzas secretas; sus palabras nos descubren un mundo maravilloso que antes no conociamos.",
					"En mi propia casa como en la ajena, he creido sentir que la poesia, al penetrar en la palabra, la descompone, la abre como un capullo a todos los matices de significacion."]

	return @phrase.shuffle.first

	end


end