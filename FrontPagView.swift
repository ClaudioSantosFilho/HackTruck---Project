import SwiftUI


struct PontoTuristico{
    
    var id: Int
    var nome: String
    var url: String
    
}

var pontoturisticos = [

    PontoTuristico(id: 1, nome: "Acude Velho", url: "https://upload.wikimedia.org/wikipedia/commons/1/18/A%C3%A7ude_Velho_Campina_Grande_PB_-_39074177560.jpg"),
    PontoTuristico(id: 2,nome: "Parque do Povo", url: "https://www.destinoparaiba.pb.gov.br/wp-content/uploads/2019/07/ParqueDoPovo_MarcoPimentel.jpg"),
    PontoTuristico(id: 3, nome: "Os Pioneiros da Borborema", url: "https://paraibacriativa.com.br/wp-content/uploads/2015/09/pioneiros-da-borborema.jpg"),
    PontoTuristico(id: 4, nome: "Parque da Crianca", url: "https://lh5.googleusercontent.com/p/AF1QipPCsSACwz7VrAxegPxRstOpQdErQumgdI-1yhY4=w1080-h624-n-k-no"),
    PontoTuristico(id: 5, nome: "Vila do Artesao", url: "https://campinafm.com.br/wp-content/uploads/2022/05/00.jpg.webp"),
    PontoTuristico(id: 6, nome: "Maria Fumaca", url: "https://vidasemparedes.com.br/wp-content/uploads/2018/08/Vida-sem-Paredes-Campina-Grande-6.jpg"),
    PontoTuristico(id: 7, nome: "Maria Fumaca", url: "https://vidasemparedes.com.br/wp-content/uploads/2018/08/Vida-sem-Paredes-Campina-Grande-6.jpg"),
    PontoTuristico(id: 8, nome: "Maria Fumaca", url: "https://vidasemparedes.com.br/wp-content/uploads/2018/08/Vida-sem-Paredes-Campina-Grande-6.jpg"),
    PontoTuristico(id: 9, nome: "Maria Fumaca", url: "https://vidasemparedes.com.br/wp-content/uploads/2018/08/Vida-sem-Paredes-Campina-Grande-6.jpg")

]

struct FrontPag: View {
    
    let rows = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
        
    ]
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .fill(.indigo.gradient)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                AsyncImage(url: URL(string: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgko6wZUZ3wBLWrt4Xip0QY97kGYntpTpZHJFdtarmXFKfaWG8Nk4_6pkl6Ae2eE2fMpbn0c1UTnK2rJUMlpKyMO0kylQ8HMTKWtG49GivzmYwYdpkmNtXiqaitLASZi30MIYe4fvaUacY/s1600/Campina+Grande.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                    
                } placeholder: {
                    Color.gray
                }
                .frame(width: 150 ,height: 150)
                
                Text("Bem-vindo a Campina Grande")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                VStack{
                    LazyHGrid(rows: rows, alignment: .center) {
                        
                        ForEach(pontoturisticos, id: \.id){ e in
                            
                            AsyncImage(url: URL(string: e.url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 120, height: 120)
                                    .clipped()
                                
                                
                            } placeholder: {
                                Color.gray
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 120, height: 120)
                                    .clipped()
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                Spacer()
                
                VStack{
                    
                    Text("Descubra Campina")
                        .font(.largeTitle)
                    Image(systemName: "arrowshape.bounce.forward")
                        .font(.largeTitle)
                    
                }
                .padding()
            }
            
            
            
        }
    }
}

#Preview {
    FrontPag()
}
