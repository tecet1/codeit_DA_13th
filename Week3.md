## 1. Pandas `merge()` vs `join()` 차이점

한줄요약: 그냥 merge()를 쓰자

둘다 데이터프레임을 연결하는데 사용한다는 공통점이 있음.

단, merge는 열을 기준으로, join은 인덱스를 기준으로 연결함.

이때, merge는 left_on 과 right_on으로 직접 각 데이터프레임의 기준열을 지정할 수 있지만, join은 인덱스를 기준으로 연결하므로 두 인덱스 열의 이름이 같아야함.

merge 용례
```
merged_df = pd.merge(left, right, left_on='user_id', right_on='id', how='inner')
```
join 용례
```
joined_df = left_idx.join(right_idx, how='left')
```

결론: 급하게 join을 써서 빠르게 연결해야하는 게 아니라면, 더 유연하게 사용할 수 있는 merge를 사용하자.

----------

## 2. Tableau Public

태블로를 직접 경험해 보니 생각보다 직관적이지 않고 불편한 지점이 많았다. 예를 들어 변수를 행이나 열에 먼저 입력해야 특정 그래프가 활성화(해금)되는 방식이나, 여러 변수를 다룰 때 커서가 자동으로 이동하지 않는 점 등이 그랬다. 하지만 이러한 숙련도 문제는 반복적인 시각화 프로젝트를 통해 충분히 해결될 수 있다고 판단한다.

그런 맥락에서 태블로 퍼블릭의 결과물보다는 [커뮤니티 프로젝트](https://www.tableau.com/community/community-projects)에 더 눈길이 갔다. 특히 Makeover Monday나 Workout Wednesday처럼 주 단위로 연습 과제를 제공하는 프로젝트들은 실력 향상에 큰 도움이 될 것이다. 향후 데이터 시각화 전문성을 강화하는 방향으로 진로를 잡는다면, 이 리소스들을 적극적으로 활용할 계획이다.

> Written with [StackEdit](https://stackedit.io/).

