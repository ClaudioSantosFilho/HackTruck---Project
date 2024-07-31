import SwiftUI

// Modelo de dados para um ponto turístico, conformando o protocolo Identifiable
struct PontoTuristico: Identifiable {
    var id: Int
    var nome: String
    var url: String
}

// Dados de exemplo para pontos turísticos
var pontoturisticos = [
    PontoTuristico(id: 1, nome: "Açude Velho", url: "https://upload.wikimedia.org/wikipedia/commons/1/18/A%C3%A7ude_Velho_Campina_Grande_PB_-_39074177560.jpg"),
    PontoTuristico(id: 2, nome: "Parque do Povo", url: "https://www.destinoparaiba.pb.gov.br/wp-content/uploads/2019/07/ParqueDoPovo_MarcoPimentel.jpg"),
    PontoTuristico(id: 3, nome: "Os Pioneiros da Borborema", url: "https://paraibacriativa.com.br/wp-content/uploads/2015/09/pioneiros-da-borborema.jpg"),
    PontoTuristico(id: 4, nome: "Parque da Criança", url: "https://lh5.googleusercontent.com/p/AF1QipPCsSACwz7VrAxegPxRstOpQdErQumgdI-1yhY4=w1080-h624-n-k-no"),
    PontoTuristico(id: 5, nome: "Vila do Artesao", url: "https://campinafm.com.br/wp-content/uploads/2022/05/00.jpg.webp"),
    PontoTuristico(id: 6, nome: "Maria Fumaca", url: "https://vidasemparedes.com.br/wp-content/uploads/2018/08/Vida-sem-Paredes-Campina-Grande-6.jpg")
]

// Visão inicial que apresenta os pontos turísticos
struct InicioView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ScrollView(.vertical) {
                        VStack(spacing: 0) {
                            // Card de introdução com link para mapa
                            ZStack {
                                Rectangle()
                                    .fill(Color.gold)
                                    .frame(width: 355, height: 185)
                                    .cornerRadius(10)
                                
                                Rectangle()
                                    .fill(Color.darkGree) //Cor padrão do app
                                    .frame(width: 350, height: 180)
                                    .cornerRadius(10)
                                
                                VStack {
                                    HStack {
                                        Image("svgviewer-png-output")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80)
                                        
                                        Text("Descubra mais sobre Campina Grande")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                    }
                                    
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 131, height: 42)
                                            .cornerRadius(10)
                                        
                                        NavigationLink(destination: MapaView()) {
                                            Text("Ir para o mapa")
                                                .padding(10)
                                                .foregroundColor(.white)
                                                .background(Color.darkGree) //Cor padrão do app
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                .padding()
                            }
                            .padding()
                            
                            // Seções de conteúdo com scroll horizontal
                            SectionView(title: "Hotéis")
                            SectionScrollView(pontosTuristicos: pontoturisticos)
                            
                            SectionView(title: "Pontos Turísticos")
                            SectionScrollView(pontosTuristicos: pontoturisticos)
                            
                            SectionView(title: "Bares")
                            SectionScrollView(pontosTuristicos: pontoturisticos)
                            
                            SectionView(title: "Eventos")
                            SectionScrollView(pontosTuristicos: pontoturisticos)
                        }
                    }
                }
            }
        }
    }
}

// Visão de cabeçalho de seção
struct SectionView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .padding(.horizontal)
            Spacer()
        }
    }
}

// Visão com scroll horizontal para exibir os cards
struct SectionScrollView: View {
    let pontosTuristicos: [PontoTuristico]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(pontosTuristicos) { ponto in
                    CardView(ponto: ponto)
                }
                .padding()
            }
        }
    }
}

// Visão de card para cada ponto turístico
struct CardView: View {
    let ponto: PontoTuristico
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
            VStack {
                AsyncImage(url: URL(string: ponto.url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .cornerRadius(10)
                        .padding(10)
                        .clipped()
                } placeholder: {
                    Color.gray
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .cornerRadius(10)
                        .padding(10)
                        .clipped()
                }
                
                HStack {
                    
                    Text(ponto.nome)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                            .padding(10)
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SheetView(ponto: ponto)
                    }
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(width: 220, height: 210)
        .padding()
    }
}

struct SheetView: View {
    let ponto: PontoTuristico
    
    var body: some View {
        VStack {
            Text(ponto.nome)
                .font(.largeTitle)
                .padding()
            
            AsyncImage(url: URL(string: ponto.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
                    .clipped()
            } placeholder: {
                Color.gray
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
                    .clipped()
            }
            
            Spacer()
        }
    }
}

#Preview {
    InicioView()
}
