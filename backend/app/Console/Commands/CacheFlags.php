<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Http;
use App\Models\Flashcard;

class CacheFlags extends Command
{
    protected $signature = 'flags:cache {--force : Re-download even if file exists}';
    protected $description = 'Download country flag SVGs into public/flags';

    public function handle()
    {
        $destDir = public_path('flags');

        if (!File::exists($destDir)) {
            File::makeDirectory($destDir, 0755, true);
        }

        $force = (bool) $this->option('force');
        $cards = Flashcard::all();
        $downloaded = 0;
        $skipped = 0;
        $failed = 0;

        foreach ($cards as $card) {
            $code = strtolower((string) $card->code);
            $url = $card->flag;

            if (!$code || !$url) {
                $skipped++;
                continue;
            }

            $dest = $destDir . DIRECTORY_SEPARATOR . "{$code}.svg";

            if (!$force && File::exists($dest)) {
                $skipped++;
                continue;
            }

            try {
                $res = Http::timeout(15)->get($url);

                if ($res->ok()) {
                    File::put($dest, $res->body());
                    $downloaded++;
                    $this->info("Saved {$code}.svg");
                } else {
                    $failed++;
                    $this->warn("Failed {$card->country} ({$code})");
                }
                usleep(150000);
            } catch (\Throwable $e) {
                $failed++;
                $this->warn("Error {$card->country} ({$code}): {$e->getMessage()}");
            }
        }
        $this->line("Downloaded: {$downloaded}");
        $this->line("Skipped (exists): {$skipped}");
        $this->line("Failed: {$failed}");

        return self::SUCCESS;
    }
}
