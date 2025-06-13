# Repository Sync Guide

이 문서는 개인 리포지토리와 2024-SQL-Practice의 리포지토리 간의 자동 동기화 설정 방법을 설명합니다. 특히, LeetHub v2 익스텐션을 통해 LeetCode에서 문제를 풀 때, 개인 리포지토리에 자동으로 생성되는 문제들을 2024-SQL-Practice의 리포지토리로 자동으로 동기화하기 위한 설정 방법을 다룹니다. 이를 위해 GitHub Actions를 사용하여 개인 리포지토리에서 2024-SQL-Practice의 리포지토리로 자동으로 변경사항을 푸시하는 방법을 안내합니다.

## 목차
- [개요](#개요)
- [Personal Access Token (PAT) 생성 및 적용](#personal-access-token-pat-생성-및-적용)
  - [PAT 생성](#pat-생성)
  - [PAT GitHub Secrets에 추가](#pat-github-secrets에-추가)
  - [워크플로우 권한 설정](#워크플로우-권한-설정)
- [GitHub Actions 워크플로우 파일 다운로드](#github-actions-워크플로우-파일-다운로드)
- [워크플로우 작동 방식](#워크플로우-작동-방식)
- [주의사항](#주의사항)

## 개요

이 가이드는 다음과 같은 상황을 가정합니다:
- LeetHub v2 익스텐션을 사용하여 LeetCode에서 문제를 풀면, 개인 리포지토리에 자동으로 문제 기록이 생성됩니다.
- 이러한 개인 리포지토리의 내용을 2024-SQL-Practice의 리포지토리로 자동으로 동기화하려고 합니다.
- GitHub Actions를 사용하여 이 작업을 자동화하고, PAT을 통해 인증을 처리합니다.

## Personal Access Token (PAT) 생성 및 적용

GitHub Actions에서 2024-SQL-Practice의 리포지토리에 푸시하기 위해서는 Personal Access Token (PAT)이 필요합니다. PAT을 생성하고 GitHub Secrets에 추가하는 방법은 다음과 같습니다:

### PAT 생성

자세한 PAT 생성 방법은 [여기](https://cpina.github.io/push-to-another-repository-docs/setup-using-personal-access-token.html#setup-personal-access-token)를 참고하세요.

### PAT GitHub Secrets에 추가

1. 개인 리포지토리로 이동하여, `Settings` 탭을 클릭합니다.
2. `Secrets and variables`를 선택한 후, `Actions`를 클릭합니다.
3. `New repository secret` 버튼을 클릭합니다.
4. `Name` 필드에 `PAT`을 입력합니다.
5. `Value` 필드에 방금 생성한 PAT 값을 붙여넣습니다.
6. `Add secret` 버튼을 클릭하여 저장합니다.
7. 2024-SQL-Practice의 리포지토리에도 동일하게 설정합니다.

### 워크플로우 권한 설정

1. 개인 리포지토리의 `Settings` 탭을 클릭합니다.
2. `Actions` 섹션으로 이동합니다.
3. `Workflow permissions` 항목에서 `Read and write permissions`를 선택합니다.
4. 변경사항을 저장합니다.
5. 2024-SQL-Practice의 리포지토리에도 동일하게 설정합니다.

이 설정을 통해 GitHub Actions가 2024-SQL-Practice의 리포지토리에 대한 읽기 및 쓰기 권한을 가지게 됩니다.

## GitHub Actions 워크플로우 파일 다운로드

PAT 설정이 완료되면, 자동화 작업을 설정하기 위해 필요한 GitHub Actions 워크플로우 YAML 파일을 다운로드할 수 있습니다.

- [sync.yml 파일 다운로드](https://github.com/2024-SQL-Practice/young2good/blob/main/.github/workflows/sync.yml)

다운로드한 `sync.yml` 파일을 개인 리포지토리의 `.github/workflows/` 디렉토리에 위치시킵니다.

## 워크플로우 작동 방식

이 워크플로우는 다음과 같은 순서로 작동합니다:

1. **개인 리포지토리의 변경사항이 푸시되면** 워크플로우가 트리거됩니다.
2. **개인 리포지토리를 클론**하여 로컬 작업 디렉토리에 복사합니다.
3. **개인 리포지토리의 내용을 2024-SQL-Practice의 리포지토리에 푸시**합니다.
4. **로컬 작업 디렉토리를 삭제**하여 클린업합니다.

## 주의사항

- GitHub Actions가 워크플로우를 실행할 수 있는 권한이 있는지 확인하세요.
- PAT은 비밀이므로 안전하게 관리하고 외부에 노출되지 않도록 주의하세요.
- 워크플로우 파일을 수정할 때는 YAML 문법에 주의하여 올바르게 작성해야 합니다.

추가적인 질문이나 도움이 필요하면 언제든지 문의해 주세요.



## 워크 플로우 중지하기
개인 리포지토리를 공용 리포지토리에 자동으로 동기화 할 수 있도록 GitHub Actions를 이용해서 설정해 두었는데, 설정을 끊어야하는 경우가 발생한다.
기본적으로 해당 프로세스는 개인 리포지토리의 `.github/workflows/sync.yml` 파일의 내용을 자동으로 수행하는 것이기 때문에, 해당 파일을 없애면 간단하게 해결된다.

하지만 나의 경우에는, 추후에 해당 작업을 다시 살릴지도 모르기 때문에 파일을 삭제하지 않고, yaml파일의 내용을 전부 주석처리를 해두었다.
그랬더니 `[young2good/leetcode] Run failed: .github/workflows/sync.yml` 이라는 메일이 계속해서 날아온다.
이는 Github Actions에 잡이 등록 되어 있는데, 이걸 수행할 파일이 없어졌다(주석처리되었다)는 의미이다.
그래서 아래와 같은 방법으로 워크플로우를 비활성화 할 수 있다.

1. 개인 리포지토리 → Actions 탭으로 이동
2. 왼쪽 사이드바에서 해당 워크플로우 선택 (예: Sync Workflow)
3. 오른쪽 상단에 ... 메뉴 클릭 → Disable workflow 선택

그러면, 짠! 워크 플로우를 중지할 수 있다.
