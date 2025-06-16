//
//  SceneDelegate.swift
//  PrimeiraAppTurma365
//
//  Created by Gabriel Mors  on 8/1/24.
//

import UIKit

//O SceneDelegate foi introduzido no iOS 13 para gerenciar múltiplas cenas (scenes) dentro de um aplicativo. Ele complementa o AppDelegate e é responsável por eventos relacionados a cada scene (tela do aplicativo), permitindo que o iOS gerencie várias janelas de um mesmo app, especialmente útil para iPadOS.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

//    Antes do iOS 13, o AppDelegate gerenciava tudo, incluindo a UIWindow. Com a introdução do suporte a múltiplas scenes no iOS 13, a Apple separou essa responsabilidade:
    
//    •    AppDelegate → cuida do ciclo de vida do app inteiro.
//    •    SceneDelegate → gerencia cada scene (ou janela) separadamente.
    
    var window: UIWindow?
//    Cada UIWindowScene gerencia uma UIWindow, e cada UIWindow contém um rootViewController (a primeira tela da hierarquia dessa janela).

//   No iPhone, normalmente existe apenas uma UIWindow. No iPad, o usuário pode abrir várias.

//    ✅ Cada UIWindow representa uma cena independente.
//    ✅ No iPhone, normalmente só há uma.
//    ✅ No iPad, o usuário pode abrir várias janelas do mesmo app.

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
//        Chamado quando uma nova scene está sendo criada.
//        Responsável por configurar a UIWindow e definir o rootViewController se necessário.
//        configuração manual da UIWindow (caso não esteja usando Storyboard)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
//            •    Chamado quando o usuário fecha a scene ou o sistema a descarta.
//            •    Aqui você pode liberar recursos relacionados à scene.
//            •    Se o usuário reabrir a mesma scene, o app pode recriá-la.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("A scene está ativa novamente")
//            •    Disparado quando a scene entra em estado ativo.
//            •    Aqui você pode retomar tarefas que foram pausadas, como animações ou atualizações de UI.
    }

    func sceneWillResignActive(_ scene: UIScene) {
//          • Chamado quando a scene vai sair do estado ativo (exemplo: o usuário recebe uma chamada ou abre outra janela).
//          • Bom para pausar animações ou salvar estados temporários.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
//        • Chamado quando a scene está saindo do estado de fundo (background) para voltar ao primeiro plano.
//        • Útil para reverter mudanças feitas ao entrar no background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
//        •    Disparado quando a scene vai para o background.
//        •    Ideal para salvar dados e liberar recursos.
    }


}

