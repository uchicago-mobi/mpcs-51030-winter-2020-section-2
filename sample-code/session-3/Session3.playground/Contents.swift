import Foundation

struct Release: Decodable {
    let name: String
    let createdAt: String
    let author: Author
}

struct Author: Decodable {
    let login: String
}

class GitHubClient {

    static func fetchReleases(completion: @escaping ([Release]?, Error?) -> Void) {
        let url = URL(string: "https://api.github.com/repos/Ranchero-Software/NetNewsWire/releases")!

        let task = URLSession.shared.dataTask(with: url) { data, _, error in

            guard let data = data, error == nil else {
                DispatchQueue.main.async { completion(nil, error) }
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let releases = try decoder.decode([Release].self, from: data)
                DispatchQueue.main.async { completion(releases, nil) }
            } catch (let parsingError) {
                DispatchQueue.main.async { completion(nil, parsingError) }
            }
        }

        task.resume()
    }
}

GitHubClient.fetchReleases { (releases, error) in
    guard let releases = releases, error == nil else {
        print(error!)
        return
    }

    for release in releases {
        print("""
              ✔️ \(release.name)
              Author: \(release.author.login)
              Date: \(release.createdAt)

              """)
    }
}
