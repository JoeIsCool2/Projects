import UIKit

struct Song {
    var title: String = ""
    var artist: String = ""
    var duration: Double = 0.00
}

class Playlist {
    var playlistMaker: String
    var playlist: [Song]
    var song = Song()
    
    // MARK: - Init
    init(song: Song, playlist: [Song], playlistMaker: String) {
        self.song = song
        self.playlist = playlist
        self.playlistMaker = playlistMaker
    }
    
    //MARK: - Core mutation
    func add(_ song: Song) {
        playlist.append(song)
    }
    
    func remove(at index: Int){
        playlist.remove(at: index)
    }
    func clear() {
        playlist.removeAll()
    }
    //
    //MARK: - Querying / reading
    var count: Int { return playlist.count }
    
    func allSongs() -> [Song] {
        return playlist
    }
    func totalDuration() -> Double {
        var duration: Double = 0
        for song in playlist {
            duration += song.duration
        }
        return duration
    }
    func currentSong() -> Song {
        return Song()
    }
    //
    //MARK: - Playback navigation
    func play(at index: Int) -> Song {
        return playlist[index]
    }
    func indexOfSong(withTitle title: String) -> Int? {
        return playlist.firstIndex { $0.title == title }
    }
    func playNext(afterTitle title: String) -> Song? {
        guard let index = indexOfSong(withTitle: title),
              index + 1 < playlist.count else {
            return nil
        }
        return playlist[index + 1]
    }
    func playPrevious() -> Song? {
        guard let index = indexOfSong(withTitle: song.title),
              index + 1 < playlist.count else {
            return nil
        }
        return playlist[index - 1]
    }
    //MARK: - Shuffle
    func shuffle() -> Song? {
        playlist.shuffle()
        let songThatWillBePlayed = playlist.first
        if let songThatWillBePlayed {
            return songThatWillBePlayed
        } else {
            return nil
        }
    }
    
    func indexOfSong(bySong song: Song) -> Int? {
        return playlist.firstIndex { currentSong in
            currentSong.title == song.title && currentSong.artist == song.artist
        }
    }
    
    func move(song: Song, to index: Int) -> String? {
        if let currentIndex = indexOfSong(bySong: song) {
            playlist.remove(at: currentIndex)
            playlist.insert(song, at: index)
            return "Song has been moved"
        } else {
            return nil
        }
    }
    
    func sortByName() {
        var newSortedPlaylist = [song]
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        for letter in alphabet {
            for song in playlist {
                if song.title.lowercased().first == letter {
                    newSortedPlaylist.append(song)
                }
            }
        }
        playlist = newSortedPlaylist
    }
    
    func sortByDuration() {
        playlist.sort { (firstSong, secondSong) in
            return firstSong.duration < secondSong.duration
        }
    }
    
    func sortByArtist() {
        var newSortedPlaylist = [song]
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        for letter in alphabet {
            for song in playlist {
                if song.artist.lowercased().first == letter {
                    newSortedPlaylist.append(song)
                }
            }
        }
        playlist = newSortedPlaylist
    }
}


//MARK: -songs
let song1 = Song(title: "Billie Jean", artist: "Michael Jackson", duration: 4.54)
let song2 = Song(title: "Bohemian Rhapsody", artist: "Queen", duration: 5.55)
let song3 = Song(title: "Shape of You", artist: "Ed Sheeran", duration: 3.53)
let song4 = Song(title: "Uptown Funk", artist: "Mark Ronson ft. Bruno Mars", duration: 4.30)
let song5 = Song(title: "Hey Jude", artist: "The Beatles", duration: 7.11)
let song6 = Song(title: "Smells Like Teen Spirit", artist: "Nirvana", duration: 5.01)
let song7 = Song(title: "I Gotta Feeling", artist: "Black Eyed Peas", duration: 4.49)
let song8 = Song(title: "Rolling in the Deep", artist: "Adele", duration: 3.48)
let song9 = Song(title: "Lose Yourself", artist: "Eminem", duration: 5.26)
let song10 = Song(title: "Closer", artist: "The Chainsmokers ft. Halsey", duration: 4.04)
let song11 = Song(title: "Stairway to Heaven", artist: "Led Zeppelin", duration: 8.02)
let song12 = Song(title: "Levitating", artist: "Dua Lipa", duration: 3.23)
let song13 = Song(title: "Blinding Lights", artist: "The Weeknd", duration: 3.20)
let song14 = Song(title: "Hotel California", artist: "Eagles", duration: 6.30)
let song15 = Song(title: "Someone Like You", artist: "Adele", duration: 4.45)
let song16 = Song(title: "Imagine", artist: "John Lennon", duration: 3.03)
let song17 = Song(title: "Let It Be", artist: "The Beatles", duration: 4.03)
let song18 = Song(title: "Thinking Out Loud", artist: "Ed Sheeran", duration: 4.41)
let song19 = Song(title: "Shake It Off", artist: "Taylor Swift", duration: 3.39)
let song20 = Song(title: "Happy", artist: "Pharrell Williams", duration: 3.53)
let song21 = Song(title: "Can't Stop the Feeling!", artist: "Justin Timberlake", duration: 3.56)
let song22 = Song(title: "Old Town Road", artist: "Lil Nas X", duration: 2.37)
let song23 = Song(title: "Bad Guy", artist: "Billie Eilish", duration: 3.14)
let song24 = Song(title: "Sunflower", artist: "Post Malone", duration: 2.38)
let song25 = Song(title: "Believer", artist: "Imagine Dragons", duration: 3.24)
let song26 = Song(title: "Radioactive", artist: "Imagine Dragons", duration: 3.06)
let song27 = Song(title: "Counting Stars", artist: "OneRepublic", duration: 4.17)
let song28 = Song(title: "Demons", artist: "Imagine Dragons", duration: 2.57)
let song29 = Song(title: "Royals", artist: "Lorde", duration: 3.10)
let song30 = Song(title: "Titanium", artist: "David Guetta ft. Sia", duration: 4.05)
let song31 = Song(title: "Chandelier", artist: "Sia", duration: 3.36)
let song32 = Song(title: "Cheap Thrills", artist: "Sia", duration: 3.44)
let song33 = Song(title: "Rockstar", artist: "Post Malone", duration: 3.38)
let song34 = Song(title: "Circles", artist: "Post Malone", duration: 3.35)
let song35 = Song(title: "Havana", artist: "Camila Cabello", duration: 3.36)
let song36 = Song(title: "Senorita", artist: "Shawn Mendes & Camila Cabello", duration: 3.11)
let song37 = Song(title: "Perfect", artist: "Ed Sheeran", duration: 4.23)
let song38 = Song(title: "Photograph", artist: "Ed Sheeran", duration: 4.19)
let song39 = Song(title: "Love Yourself", artist: "Justin Bieber", duration: 3.53)
let song40 = Song(title: "Sorry", artist: "Justin Bieber", duration: 3.20)
let song41 = Song(title: "Peaches", artist: "Justin Bieber", duration: 3.18)
let song42 = Song(title: "Stay", artist: "The Kid LAROI & Justin Bieber", duration: 2.21)
let song43 = Song(title: "Ghost", artist: "Justin Bieber", duration: 2.33)
let song44 = Song(title: "Watermelon Sugar", artist: "Harry Styles", duration: 2.54)
let song45 = Song(title: "Adore You", artist: "Harry Styles", duration: 3.27)
let song46 = Song(title: "As It Was", artist: "Harry Styles", duration: 2.47)
let song47 = Song(title: "Golden", artist: "Harry Styles", duration: 3.28)
let song48 = Song(title: "Shivers", artist: "Ed Sheeran", duration: 3.27)
let song49 = Song(title: "Bad Habits", artist: "Ed Sheeran", duration: 3.50)
let song50 = Song(title: "Anti-Hero", artist: "Taylor Swift", duration: 3.20)

//MARK: -playlists
let playlistJoe = Playlist(song: song1, playlist: [song1, song2, song3, song4, song5], playlistMaker: "Joe")
let playlistMaya = Playlist(song: song19, playlist: [song19, song50, song46, song44, song45], playlistMaker: "Maya")
let playlistLeo = Playlist(song: song25, playlist: [song25, song26, song27, song28, song29], playlistMaker: "Leo")
let playlistZara = Playlist(song: song30, playlist: [song30, song31, song32, song33, song34], playlistMaker: "Zara")
let playlistNina = Playlist(song: song37, playlist: [song37, song38, song48, song49, song18], playlistMaker: "Nina")

// MARK: - Tests
print("\n🎧 Joe's Playlist:")
for song in playlistJoe.allSongs() {
    print("\(song.title) by \(song.artist) — \(song.duration) mins")
}
print("Total songs: \(playlistJoe.count)")
print("Total duration: \(playlistJoe.totalDuration()) mins")
print("Playlist made by: \(playlistJoe.playlistMaker)")

print("\n⏭️ Playing next after '\(song3.title)' in Joe's Playlist:")
if let nextSong = playlistJoe.playNext(afterTitle: song3.title) {
    print("Next song: \(nextSong.title) by \(nextSong.artist)")
} else {
    print("No next song found.")
}

print("\n📦 Moving '\(song2.title)' to index 0 in Joe's Playlist:")
if let result = playlistJoe.move(song: song2, to: 0) {
    print("✅ \(result)")
    print("New first song: \(playlistJoe.play(at: 0).title)")
}

print("\n🔤 Sorting Maya's Playlist by Title:")
playlistMaya.sortByName()
for song in playlistMaya.allSongs() {
    print(song.title)
}

print("\n⏱️ Sorting Leo's Playlist by Duration:")
playlistLeo.sortByDuration()
for song in playlistLeo.allSongs() {
    print("\(song.title) — \(song.duration) mins")
}

print("\n👤 Sorting Zara's Playlist by Artist:")
playlistZara.sortByArtist()
for song in playlistZara.allSongs() {
    print("\(song.artist) — \(song.title)")
}

print("\n🎲 Shuffling Nina's Playlist:")
if let shuffledSong = playlistNina.shuffle() {
    print("Shuffled to: \(shuffledSong.title) by \(shuffledSong.artist)")
}

print("\n➕ Adding '\(song50.title)' to Nina's Playlist:")
playlistNina.add(song50)
print("✅ Added. New count: \(playlistNina.count)")

print("\n🗑️ Removing song at index 2 from Zara's Playlist:")
let removedSong = playlistZara.play(at: 2)
playlistZara.remove(at: 2)
print("✅ Removed: \(removedSong.title) by \(removedSong.artist)")
print("New count: \(playlistZara.count)")

print("\n🧹 Clearing Leo's Playlist:")
playlistLeo.clear()
print("✅ Cleared. Song count: \(playlistLeo.count)")
