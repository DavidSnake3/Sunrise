<?php
use Hashids\Hashids;

trait HasHashId
{
    public function getHashIdAttribute()
    {
        $hashids = new Hashids(env('HASHIDS_SALT'), 10);
        return $hashids->encode($this->getKey());
    }

    public static function decodeHashId($hash)
    {
        $hashids = new Hashids(env('HASHIDS_SALT'), 10);
        $decoded = $hashids->decode($hash);
        return $decoded[0] ?? null;
    }
}