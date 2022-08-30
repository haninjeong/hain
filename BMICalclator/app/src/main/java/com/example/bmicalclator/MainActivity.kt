package com.example.bmicalclator

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.bmicalclator.databinding.ActivityMainBinding
/*키와 몸무게를 메인엑티비티에서 입력하고 결과 버튼 누르면 다른화면에서
비만도 계산하고 그결과를 문자와 그림으로 표현
화면이 바귈떄 마지막 입력값은 저장되어 넘어간다.
화면 디자인 : ConstraintLayout
ShredPreferenxce : 간단한 데이터 저장

구현순서
1. 프로젝트 생성 bindFeatures를 이용하여 viewbindign
2.키와 몸무게 입력화면작성
3. 결과 보여줄 화면작성
4.인텐트를 이용한 화면전환
5.SharedPreference로 데이터 저장
 */
class MainActivity : AppCompatActivity() {
	//제일먼저 해야됨
	private val binding by lazy {
		ActivityMainBinding.inflate(layoutInflater)
	}
	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		//메인화면이 메모리에 만들어짐
		setContentView(binding.root)

		//결과버튼이 눌려짐

		binding.resultButton.setOnClickListener {
			//결과 버튼이 눌러지면 할일 작성
			//코틀린은 new 클래스명() 구문없음
			//코틀린은 클래스명() 객체생성
			//현재 객체를 다음 나열한 객체와 공유한다
			//현재 키와 몸무게가 입력되지 않은 경우는 Result화면으로 넘어가면 안됨.

			if(binding.weightEditText.text.isNotBlank() &&
				binding.weightEditText.text.isNotBlank()) {
				var intent = Intent(this, ResultActivity::class.java).apply {
					//apply 객체의 특징 : 중복된값을 제거한다.

					//ResultActivity 화면으로 데이터 보내기
					//체중데이터를 몸무게:weight , 키 : heignt
					//숫자형으로 변환해해 보냄
					putExtra(
						"weight",
						binding.weightEditText.text.toString().toFloat()
					)
					putExtra(
						"height",
						binding.weightEditText.text.toString().toFloat()
					)
				}

				startActivity(intent) //현재 intent(정보)를 ResultActivity를 시작해라..
			}
		}
	}
}


/*
	실제화면 구현순서
	1.뷰바인딩 객체 얻기
	2. 메인화면 resultButton을 누르면 결과화면이동
	3.결과 화면에서 이전 네비게이션바(=업네비게이션) 버튼을 누르면
	  메인화면으로 이동
	4.인텐트(=어떤 기능을 공유하겟다.)에 데이터를 담는다.
	5.인텐트를 결과화면으로 전송
	6.결과화면에 인텐트안의 데이터를 가져온다.
	7.비만도를 판정
	8.화면에 출력 및 토스트메세지로 간단히 알림구현


 */