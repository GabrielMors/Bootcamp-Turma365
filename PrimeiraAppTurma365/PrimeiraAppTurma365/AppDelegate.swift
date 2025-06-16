//
//  AppDelegate.swift
//  PrimeiraAppTurma365
//
//  Created by Gabriel Mors  on 8/1/24.
//

//MARK: O que é?
//O AppDelegate é um dos arquivos mais importantes em um projeto UIKit, pois gerencia o ciclo de vida do aplicativo e interações de alto nível com o sistema. Ele é o ponto de entrada do app e é responsável por inicializações globais, como configurar serviços, gerenciar notificações push, persistência de dados e mudanças de estado do app.

//O AppDelegate gerencia o ciclo de vida global do app, ou seja, ele lida com eventos que afetam todo o aplicativo, não apenas uma tela específica. Qualquer alteração nele pode impactar o funcionamento geral do app.

//MARK: Pq Delegate
//O nome “Delegate” vem do padrão de design Delegate, onde um objeto (nesse caso, o sistema operacional iOS) delega certas responsabilidades a outro objeto (o AppDelegate). Isso significa que o sistema chama métodos específicos desse arquivo sempre que eventos importantes acontecem.

import UIKit
//MARK: Pq tem o @main
//O @main que aparece antes da classe AppDelegate é um atributo especial do Swift que indica o ponto de entrada do aplicativo. Ele informa ao compilador que essa é a classe principal responsável por iniciar a execução do app.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        Chamado quando o app é iniciado.
//        Usado para configurar serviços como Firebase, Core Data, frameworks de analytics e notificações push.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Chamado quando uma nova sessão de cena está sendo criada.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Chamado quando o usuário descarta uma sessão de cena.
        // Se alguma sessão foi descartada enquanto o aplicativo não estava em execução, isso será chamado logo após application:didFinishLaunchingWithOptions.
        // Use este método para liberar quaisquer recursos que eram específicos das cenas descartadas, pois eles não retornarão.
    }


}

