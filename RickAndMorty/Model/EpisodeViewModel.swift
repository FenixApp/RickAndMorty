//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 10.11.2023.
//

import Foundation
import UIKit

final class EpisodeViewModel {
    
    private let episodeViewController: EpisodeViewController
    private var episodeModel = [EpisodeModel]()
    
    init(viewController: EpisodeViewController) {
        self.episodeViewController = viewController
    }
    
    func getEpisode() {
        DataFetchService.shared.fetchEpisode { [weak self] response, error in
            guard let self, let response else { return }
            response.results.forEach {
                let idRandom = self.getRandomCharacter($0.characters)
                let currentEpisode = EpisodeModel(id: idRandom,
                                                      nameEpisode: $0.name,
                                                      codeEpisode: $0.episode,
                                                  namePerson: "",
                                                  speciesPerson: "",
                                                  imagePerson: nil)
                self.episodeModel.append(currentEpisode)
            }
            self.getCharacter()
            self.getImage()
        }
    }
    
    private func getCharacter() {
        for i in 0..<episodeModel.count {
            DataFetchService.shared.fetchCharacter(id: episodeModel[i].id) { [weak self] response, error in
                guard let self else { return }
                if let model = response {
                    self.episodeModel[i].namePerson = model.name
                    self.episodeModel[i].speciesPerson = model.species
                }
                self.episodeViewController.setEpisode(self.episodeModel)
            }
        }
    }
    
    private func getImage() {
        for i in 0..<episodeModel.count {
            ApiService.shared.getImageData(id: episodeModel[i].id) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self.episodeModel[i].imagePerson = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            episodeViewController.setEpisode(episodeModel)
        }
    }
    
    private func getRandomCharacter(_ characters: [String]) -> String {
        var charactersId = [String]()
        characters.forEach { char in
            let currentId = char.components(separatedBy: "/").last
            charactersId.append(currentId ?? "")
        }
        return charactersId.randomElement() ?? ""
    }
}
