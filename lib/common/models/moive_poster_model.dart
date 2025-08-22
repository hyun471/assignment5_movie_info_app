// "results": [
//   {
//     "adult": false,
//     "backdrop_path": "/1RgPyOhN4DRs225BGTlHJqCudII.jpg",
//     "genre_ids": [
//       16,
//       28,
//       14,
//       53
//     ],
//     "id": 1311031,
//     "original_language": "ja",
//     "original_title": "劇場版「鬼滅の刃」無限城編 第一章 猗窩座再来",
//     "overview": "혈귀로 변해버린 여동생 네즈코를 인간으로 되돌리기 위해 혈귀를 사냥하는 조직인 《귀살대》에 입대한 카마도 탄지로. 입대 후 동료인 아가츠마 젠이츠, 하시비라 이노스케와 함께 많은 혈귀와 싸우고, 성장하면서 세 사람의 우정과 유대는 깊어진다. 탄지로는 《귀살대》 최고위 검사인 《주》와도 함께 싸웠다. 「무한열차」에서는 염주・렌고쿠 쿄쥬로, 「유곽」에서는 음주・우즈이 텐겐, 「도공 마을」에서는 하주・토키토 무이치로, 연주・칸로지 미츠리와 함께 혈귀를 상대로 격렬한 전투를 벌였다. 그 후 다가올 혈귀와의 결전에 대비해 귀살대원들과 함께 《주》가 주도하는 합동 강화 훈련에 참가해 훈련을 받던 도중 《귀살대》의 본부인 우부야시키 저택에 나타난 키부츠지 무잔. 어르신의 위기에 달려온 《주》들과 탄지로였지만, 무잔의 술수로 의문의 공간으로 떨어지고 말았는데. 탄지로 일행이 떨어진 곳, 그곳은 혈귀의 본거지 《무한성》─ “귀살대”와 “혈귀”의 최종 결전의 포문이 열린다.",
//     "popularity": 299.5512,
//     "poster_path": "/m6Dho6hDCcL5KI8mOQNemZAedFI.jpg",
//     "release_date": "2025-07-18",
//     "title": "극장판 귀멸의 칼날: 무한성편",
//     "video": false,
//     "vote_average": 7.127,
//     "vote_count": 83
//   },

class MoivePosterModel {
  MoivePosterModel({required this.id, required this.posterPath});
  final String id;
  final String posterPath;

  MoivePosterModel.fromJson(Map<String, dynamic> map)
    : this(id: map['id'], posterPath: map['poster_path']);

  Map<String, dynamic> toJson() {
    return {'id': id, 'poster_path': posterPath};
  }
}
