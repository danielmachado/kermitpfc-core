# @author Daniel Machado Fernandez
# @version 1.0
#
# Self implementation from a Data Stream
class RandomPhraseGenerator

	# Generates a random phrase
	#
	# @return phrase [String] a random phrase
	def generate

		@phrase = ["12453243@juanito@Poesia es la union de dos palabras que uno nunca supuso que pudieran juntarse, y que forman algo asi como un misterio.",
					"1243654@francisco@La poesia huye, a veces, de los libros para anidar extramuros, en la calle, en el silencio, en los suenos, en la piel, en los escombros, incluso en la basura. Donde no suele cobijarse nunca es en el verbo de los subsecretarios, de los comerciantes o de los lechuginos de television.",
					"1288803@david@Al contacto del amor todo el mundo se vuelve poeta.",
					"12388943@lucas@La poesia es el sentimiento que le sobra al corazon y te sale por la mano.",
					"1987343@maria@Los poetas inmaduros imitan; los poetas maduros roban; los malos estropean lo que roban, y los buenos lo convierten en algo mejor.",
					"12243@ana@Digamos que existen dos tipos de mentes poeticas: una apta para inventar fabulas y otra dispuesta a creerlas.",
					"1232453243@lucia@No digais que, agotado su tesoro, de asuntos falta, enmudecio la lira: podra no haber poetas pero siempre habra poesia.",
					"16853243@luisa@Cada poema es unico. En cada obra late, con mayor o menor grado, toda la poesia. Cada lector busca algo en el poema. Y no es insolito que lo encuentre: Ya lo llevaba dentro.",
					"1288653243@mariana@La poesia es el eco de la melodia del universo en el corazon de los humanos.",
					"12445543@kermit@Hacer versos malos depara mas felicidad que leer los versos mas bellos.",
					"12488843@juanjose@En el fondo, un poema no es algo que se ve, sino la luz que nos permite ver. Y lo que vemos es la vida.",
					"1245676543@aaron@El mes que es abundante de poesia, suele serlo de hambre.",
					"12453675673@leticia@La poesia se escribe cuando ella quiere.",
					"124532457673@beatriz@Los poetas son hombres que han conservado sus ojos de nino.",
					"124532435@angel@La poesia no tiene tiempo, el que la lee la rescata, la hace presente y luego la regresa a su eternidad.",
					"124537333@laura@Hay que saber que no existe pais sobre la tierra donde el amor no haya convertido a los amantes en poetas.",
					"1245456093@rita@El vino siembra poesia en los corazones.",
					"1245377993@juanluis@El poeta es un mentiroso que siempre dice la verdad.",
					"1245567533@lorena@Ante la poesia, tanto da temblar como comprender.",
					"124532969@jesus@Cuando un poeta canta estamos en sus manos: el es el que sabe despertar en nosotros aquellas fuerzas secretas; sus palabras nos descubren un mundo maravilloso que antes no conociamos.",
					"124575673223@agustin@En mi propia casa como en la ajena, he creido sentir que la poesia, al penetrar en la palabra, la descompone, la abre como un capullo a todos los matices de significacion."]

		return @phrase.shuffle.first

	end


end