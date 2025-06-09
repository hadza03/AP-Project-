<?php

class Config {
    public static function DB_HOST(): string { return getenv('DB_HOST') ?: '127.0.0.1'; }
    public static function DB_PORT(): int { return getenv('DB_PORT') ?: 3306; }
    public static function DB_NAME(): string { return getenv('DB_NAME') ?: 'audioprojekt'; }
    public static function DB_USER(): string { return getenv('DB_USER') ?: 'root'; }
    public static function DB_PASSWORD(): string { return getenv('DB_PASSWORD') ?: ''; }

    public static function JWT_SECRET() {
        return 'tajni_kljuc_za_token123';
    }
}
