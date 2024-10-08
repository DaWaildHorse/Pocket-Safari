import SwiftUI

struct Achievement: Identifiable {
    let id = UUID()
    let description: String
    var progress: Double = 0.0 // 0.0 to 1.0
}

struct AchievementView: View {
    let colorP = ColorPalette()
    @State private var achievements: [Achievement] = []
    
    var body: some View {
        ZStack {
            colorP.pocketBlack.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(achievements) { achievement in
                        AchievementCard(achievement: achievement, colorP: colorP)
                    }
                }
                .padding()
            }
        }
        .onAppear(perform: loadAchievements)
    }
    
    private func loadAchievements() {
        guard let url = Bundle.main.url(forResource: "achievements", withExtension: "txt"),
              let content = try? String(contentsOf: url) else {
            print("Failed to load achievements.txt")
            return
        }
        
        let achievementDescriptions = content.components(separatedBy: "\n\n")
        achievements = achievementDescriptions.map { Achievement(description: $0, progress: Double.random(in: 0...1)) }
    }
}

struct AchievementCard: View {
    let achievement: Achievement
    let colorP: ColorPalette
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(colorP.pocketDarkGreen)
            
            VStack {
                Text(achievement.description)
                    .foregroundColor(.white)
                    .padding()
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 20)
                        
                        Rectangle()
                            .fill(colorP.pocketShadeGreen)
                            .frame(width: geometry.size.width * CGFloat(achievement.progress), height: 20)
                    }
                    .cornerRadius(10)
                }
                .frame(height: 20)
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    AchievementView()
}
