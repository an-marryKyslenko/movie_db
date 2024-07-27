# Mermaid ER Diagram

```mermaid
erDiagram
    USERS {
        int user_id PK
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
        int avatar_file_id FK
        timestamp created_at
        timestamp updated_at
    }
    FILES {
        int file_id PK
        varchar file_name
        varchar mime_type
        varchar file_key
        varchar file_url
        timestamp created_at
        timestamp updated_at
    }
    MOVIES {
        int movie_id PK
        varchar title
        text description
        decimal budget
        date release_date
        int duration
        int director_id FK
        int country_id FK
        int poster_file_id FK
        timestamp created_at
        timestamp updated_at
    }
    PERSONS {
        int person_id PK
        varchar first_name
        varchar last_name
        text biography
        date date_of_birth
        enum gender
        int home_country_id FK
        int primary_photo_file_id FK
        timestamp created_at
        timestamp updated_at
    }
    COUNTRIES {
        int country_id PK
        varchar name
    }
    GENRES {
        int genre_id PK
        varchar genre_name
    }
    MOVIEGENRES {
        int movie_id FK
        int genre_id FK
    }
    CHARACTERS {
        int character_id PK
        varchar name
        text description
        enum role
        int movie_id FK
        int person_id FK
        boolean is_background
        timestamp created_at
        timestamp updated_at
    }
    FAVORITES {
        int user_id FK
        int movie_id FK
    }

    USERS ||--o{ FILES : avatar_file
    MOVIES ||--o| PERSONS : director
    MOVIES ||--o| COUNTRIES : country
    MOVIES ||--o{ FILES : poster_file
    MOVIES ||--o{ CHARACTERS : has
    MOVIES ||--o{ MOVIEGENRES : has
    MOVIEGENRES ||--o| GENRES : belongs_to
    PERSONS ||--o{ FILES : primary_photo
    CHARACTERS ||--o| PERSONS : played_by
    FAVORITES ||--o| USERS : belongs_to
    FAVORITES ||--o| MOVIES : likes
    PERSONS ||--o| COUNTRIES : home_country
