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

들어가기 앞서서, 태블로를 사용해본 결과 생각보다 간단하지 않고 불편한 점이 많았음. 이를테면 변수를 먼저 행이나 열에 입력해 두어야 그래프가 '해금'되는 경우나, 여러개의 변수를 행이나 열에 입력하는 경우 커서가 자동으로 이동되지 않는 점 등등이 있음. 이런 것들은 경험이 부족하기 때문이라고 생각하기에, 간단한 시각화 프로젝트를 반복적으로 수행할 필요가 있음. 그런 맥락에서 태블로퍼블릭에서 내가 눈길이 갔던 것은 다른 사람들의 시각화 자료들 보다는 [커뮤니티 프로젝트](https://www.tableau.com/community/community-projects) 들이었음. 아래로 내려가보면 Makeover Monday, Workout Wednesday 등의 프로젝트들을 찾아볼 수 있는데, 이들은 주단위로 태블로를 연습해볼 수 있는 프로젝트 자료를 제공하고 있음. 만약 진로방향이 태블로를 사용한 시각화를 전문적으로 수행하는 쪽으로 가게 된다면 적극 활용할 수 있을 듯.

> Written with [StackEdit](https://stackedit.io/).

