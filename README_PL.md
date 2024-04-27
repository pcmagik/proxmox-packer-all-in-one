# 🚀 Packer Builder dla Proxmox - Od CentOS do Red Hat! 🌌
Odkryj nową generację automatyzacji tworzenia obrazów z tym projektem! Nasze konfiguracje Packer są zaprojektowane specjalnie dla Proxmox, oferując fundament pod bardziej zaawansowane dostosowania obrazów systemów operacyjnych takich jak CentOS, Rocky Linux, Ubuntu, Debian, AlmaLinux i Red Hat.

## 🌟 Testowane na Proxmox 8.x - teraz wspiera jeszcze szerszy zakres systemów operacyjnych!

## 🚀 Jak zacząć
### Wymagania:

- Sklonuj to repozytorium: `git clone https://github.com/pcmagik/HomeLab-Proxmox-Packer`
- Pliki ISO wybranych systemów operacyjnych, przesłane do Proxmox (linki do pobrania poniżej).
- Funkcjonalny system Proxmox.
- Packer w wersji 1.9.4.
- Maszyna zainstalująca musi być dostępna dla Proxmox, albo pliki startowe muszą być hostowane publicznie.
- Upewnij się, że plik ISO systemu operacyjnego został przesłany do systemu Proxmox.

Najprostszą metodą jest używanie opcji "Download from URL" w Proxmox na dysku/udziale przeznaczonym dla plików ISO.

## 🛠 Budowanie obrazu
Upewnij się, że Proxmox ma dostęp do hosta uruchamiającego Packer. Packer będzie na krótko uruchamiał serwer HTTP, aby umożliwić instalatorowi pobranie pliku startowego. W przeciwnym razie, hostuj pliki startowe na publicznie dostępnym serwerze.

Znajdź URL systemu Proxmox, nazwę węzła do budowania, oraz nazwę użytkownika i hasło użytkownika z uprawnieniami do tworzenia VM i szablonów. Dostosuj swoją instalację lub określ inne niż domyślne magazynowanie, jeśli jest to konieczne.

Edytuj plik `variables.pkrvars.hcl` z wszystkimi wymaganymi informacjami. Pełna lista modyfikowalnych zmiennych jest dostępna w każdym pliku `packer.pkr.hcl`.

## 🛠 Używanie Makefile
By zbudować szablony, uruchom:

- `make all`

## 🛠 Budowanie manualne
Bez użycia Makefile, użyj następujących poleceń:

Dla każdej wersji systemu operacyjnego
(Przykładowe polecenia dla almalinux8, almalinux9, centos7, itd.)

- `make almalinux8`
- `make almalinux9`
- `make centos7`
- `make centos8`
- `make debian10`
- `make debian11`
- `make debian12`
- `make redhat8`
- `make redhat9`
- `make rocky8`
- `make rocky9`
- `make ubuntu2004`
- `make ubuntu2204`

Dodaj plik `variables.pkrvars.hcl` w głównym folderze z następującą zawartością:
(Wymień zmienne, które mogą być ustawione, zgodnie z dostępnymi opcjami dla konstruktora Proxmox.)

## 🚀 Rozpoczęcie pracy z szablonem

Wszystkie kompilacje są przygotowane z niestandardową nazwą, hasłem i kluczem SSH. Szczegóły można znaleźć w pliku `template.pkr.hcl`, `ks.cfg` i pliku `user-data`.
Ta kompilacja jest All in one, więc możesz użyć jej jako szablonu dla swoich VM. Gotowe od razu do użycia. Wystarczy zmienić swoją nazwę użytkownika, hasło, klucz SSH i jesteś gotowy do działania.

## 🌟 Po zbudowaniu obrazu
Po zbudowaniu obrazu możesz dostosować pozostałe ustawienia w napędzie cloud-init. Gotowy do użycia obraz będzie dostępny w Proxmox jako szablon.


Pełna lista zmiennych, które możesz dostosować to:

- zobacz */packer.pkr.hcl dla pełnej listy możliwych wartości zmiennych do nadpisania tutaj

- `proxmox_username` # nazwa użytkownika do logowania się do Proxmox
- `proxmox_password` # hasło do logowania się do Proxmox
- `proxmox_url` # URL twojego systemu Proxmox
- `proxmox_node` # nazwa węzła Proxmox, na którym będzie budowany obraz
- `proxmox_storage_pool` # nazwa puli magazynowej, na której obraz ma być budowany
- `proxmox_storage_pool_type` # typ puli magazynowej, `lvm-thin` (domyślnie), `lvm`, `zfspool` lub `directory`
- `proxmox_storage_format` # format magazynowania, `raw` (domyślnie), `cow`, `qcow`, `qed`, `qcow2`, `vmdk` lub `cloop`
- `centos_image` lub `ubuntu_image` # Obraz systemu operacyjnego.
- `template_name` # Nazwa szablonu. Domyślnie `CentOS7-Template` lub `CentOS8-Template` w zależności od wersji
- `template_description` # Opis szablonu. Domyślnie `Szablon CentOS 7` lub `Szablon CentOS 8` w zależności od budowanego obrazu.

## 🌟 To repozytorium jest forkiem kilku repozytoriów wymienionych poniżej i to wszystko praca @pcmagik.

Oryginalne repozytorium można znaleźć tutaj:

`https://github.com/dustinrue/proxmox-packer`

`https://github.com/brockhenrie/Templates`

`https://github.com/ChristianLempa/boilerplates/tree/main/packer/proxmox`

`https://github.com/rkoosaar/packer-proxmox-iso-templates`

`https://github.com/geerlingguy/packer-boxes`

## 🌟 Co zmieniło się w stosunku do oryginalnego repozytorium?
- Zaktualizowano Packer do najnowszej wersji na ten moment, która to 1.9.4
- Zaktualizowano konstruktor Packer Proxmox-ISO do wersji, która obecnie to 1.1.6
- Wszystkie VM mają włączone hasła
- Wszystkie VM mają włączony użytkownik
- Wszystkie VM mają włączony klucz SSH
- Wszystkie VM mają włączony cloud-init
- Wszystkie VM mają włączony napęd cloud-init
- Wszystkie VM mają włączoną sieć cloud-init
- Wszystkie VM mają włączoną strefę czasową cloud-init

## 🌟 Co dalej?
- Zaktualizować Packer do najnowszej wersji która obecnie to 1.10.3
- Zaktualizować Packer Builder Proxmox-ISO do najnowszej wersji, która obecnie to 1.1.7
- Dodać więcej systemów, jak na przykład: Ubuntu 24.04 LTS

[🇬🇧 English version of this file](README.md)