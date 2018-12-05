//
//  ListPagerViewController.swift
//  RG2
//
//  Created by Anton on 01.12.2018.
//  Copyright © 2018 RubicsGuide. All rights reserved.
//

import UIKit
//import YoutubePlayer_in_WKWebView
import youtube_ios_player_helper_swift

class ListPagerViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet var ytPlayer: YTPlayerView! //WKYTPlayerView!
    @IBOutlet weak var loadingMovieIndicator: UIActivityIndicatorView!
    
    var phase = ""
    var id = 0
    var videoId: String!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    
    override var shouldAutorotate: Bool{
        return false
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        ytPlayer.delegate = self
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Показываем навигейшенБар
        //navigationController?.hidesBarsOnSwipe = false
        //navigationController?.setNavigationBarHidden(false, animated: true)
        
        let lp = ListPagerLab.shared.getPhaseItem(phase: phase, id: id)
        titleImage.image = lp.getImage()
        titleText.text = lp.title
        
        let htmlString = "<html><head>" +
            "<style>" +
            "body {color: rgb(242, 173, 33); font-family: 'Arial'; text-decoration:none; font-size: 15px}" +
            "</style>" +
            "</head>" +
            "</body>" +
            "\(lp.description)" +
        "</head></html>"
        
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        let attributedString = try! NSAttributedString(data: htmlData!, options: options, documentAttributes: nil)
        descriptionText.attributedText = attributedString
        
        // назначаем делегата, чтобы текствью мог следить за собой
        descriptionText.delegate = self
        
        // Load video from YouTube ID
        //ytPlayer.loadVideoID(lp.url)
        
        // Load video from YouTube URL
        //let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=GNp6Xe5_tXU")
        //ytPlayer.backgroundColor = .black
        videoId = lp.url
        ytPlayer.delegate = self
        ytPlayer.loadVideo(videoId: videoId)
        //ytPlayer.loadVideoURL(myVideoURL!)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        //Если URL вида rg2://ytplay?time=2:12&link=0TvO_rpG_aM, то обрабатываем его тут, иначе открываем ссылку в браузере
        //let lp = ListPagerLab.shared.getPhaseItem(phase: phase, id: id)
        let stringUrl = URL.absoluteString
        if stringUrl.hasPrefix("rg2://ytplay?") {
            // stringUrl like "rg2://ytplay?time=2:12&link=0TvO_rpG_aM"
            let videoID = stringUrl.substringAfterLast(char: "=")
            let time = stringUrl.substringAfter(char: "=").substringBefore(char: "&")
            let minutes = time.substringBefore(char: ":")
            let seconds = time.substringAfter(char: ":")
            let timeInSec = "\(Int(60 * (Float(minutes) ?? 0) + (Float(seconds) ?? 0)))"
            print ("VideID = \(videoID) min = \(minutes) sec = \(seconds) timeInSec = \(timeInSec)")
            
            if let keyWindow = UIApplication.shared.keyWindow {
                let view = UIView(frame: keyWindow.frame)
                view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
                //view.alpha = 0.7
                view.tag = 101
                view.isUserInteractionEnabled = true
                
                //Соотношение сторон видео 16/9
                let height = (keyWindow.frame.width-20) * 9 / 16
                let yAnchor = keyWindow.frame.height/2 - (height / 2)
                let videoPlayerFrame = CGRect(x: 10, y: yAnchor, width: keyWindow.frame.width-20, height: height)
//                let videoPlayerView = YouTubePlayerView(frame: videoPlayerFrame)
                let videoPlayerView = YTPlayerView(frame: videoPlayerFrame)
                videoPlayerView.delegate = self
                videoPlayerView.loadVideo(videoId: videoID, startTime: timeInSec)
                videoPlayerView.autoPlay = true
                //let videoPlayerView = UIView(frame: videoPlayerFrame)
                
                //videoPlayerView.backgroundColor = .black
//                videoPlayerView.
                
                view.addSubview (videoPlayerView)
                //videoPlayerView.loadVideoID("l6V7517N_lQ")
                //videoPlayerView.load(withVideoId: videoID)
                //videoPlayerView.loadVideo(byId: videoID, startSeconds: 0, suggestedQuality: .auto )
                self.view.addSubview(view)
                
                let aSelector : Selector = #selector(self.removeSubview)
                let tapGesture = UITapGestureRecognizer(target:self, action: aSelector)
                view.addGestureRecognizer(tapGesture)
            }
            
            //            let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
            //            testView.backgroundColor = .blue
            //            testView.alpha = 0.5
            //            testView.tag = 100
            //            testView.isUserInteractionEnabled = true
            //            self.view.addSubview(testView)

//            let aSelector : Selector = #selector(self.removeSubview)
//            let tapGesture = UITapGestureRecognizer(target:self, action: aSelector)
//            testView.addGestureRecognizer(tapGesture)
           
            
            // чтобы не открывать ссылку в браузере возвращаем false
            return false
        }
        else {
            return true
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    

    
    @objc func removeSubview(){
        //print("Start remove sibview")
        if let viewWithTag = self.view.viewWithTag(101) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
    
}


extension YTPlayerView {
    
    func loadVideo(videoId:String, startTime: String) {
        //https://developers.google.com/youtube/player_parameters
        let playerVars:[String: Any] = [
            "controls" : "1",       //0 – элементы управления не отображаются, 1-2 - отображаются
            "showinfo" : "1",       //начении 0 проигрыватель перед началом воспроизведения не выводит информацию о видео
            "autoplay": "0",        //начинается ли воспроизведение исходного видео сразу после загрузки проигрывателя.
            "rel": "0",             //будут ли воспроизводиться похожие видео после завершения показа исходного видео.
            "modestbranding": "1",  //начение 1, чтобы логотип YouTube не отображался на панели управления
            "iv_load_policy" : "3", // 1 аннотации видео по умолчанию будут отображаться, а при значении 3 – будут скрыты.
            "fs": "1",              //1 отображает кнопку полноэкранного режима.
            "playsinline" : "1",    //полноэкранный режим 1 - нет, 0 - да
            "start" : startTime     //Начальное время в секундах
        ]
        _ = self.load(videoId: videoId, playerVars: playerVars)
        //Если ставим свои кнопки play/pause, то можно использовать вместе с "controls" : "0"
        //ytPlayer.isUserInteractionEnabled = false
    }
    
    func loadVideo(videoId: String) {
        self.loadVideo(videoId: videoId, startTime: "0")
    }
}


//WKYTPlayerViewDelegate
extension ListPagerViewController: YTPlayerViewDelegate  {
    
//    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
//        ytPlayer.playVideo(at: 0)
//    }

//    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
//        playerView.cueVideo(byId: self.videoId, startSeconds: 0, suggestedQuality: .highRes)
//        playerView.playVideo()
//    }
    
//    func playerViewPreferredWebViewBackgroundColor(_ playerView: WKYTPlayerView) -> UIColor {
//        return .clear
//    }
//
    func playerViewDidBecomeReady(_ playerView: YTPlayerView){
        loadingMovieIndicator.stopAnimating()
        if playerView.autoPlay {
            playerView.playVideo()
        }
//        btnPlayPause.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 0.5104880137)
//        btnPlayPause.setImage(UIImage(named:"play_icon"), for:.normal)
    }
    
    func playerViewPreferredWebViewBackgroundColor(_ playerView: YTPlayerView) -> UIColor{
        return .clear
    }
    
    func playerViewPreferredInitialLoadingView(_ playerView: YTPlayerView) -> UIView?{
        return UIImageView(image:UIImage(named:"not_found"))
    }

    
}
