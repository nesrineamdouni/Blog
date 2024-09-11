<?php

namespace App\Form;

use Symfony\Component\Form\DataTransformerInterface;
use Symfony\Component\Form\Exception\TransformationFailedException;

class DateTimeToImmutableTransformer implements DataTransformerInterface
{
    public function transform($value)
    {
        // Vérifier si la valeur est null
        if ($value === null) {
            return null;
        }

        // Transformer DateTimeImmutable à DateTime
        if ($value instanceof \DateTimeImmutable) {
            return $value->setTimezone(new \DateTimeZone(date_default_timezone_get()));
        }

        // Transformer DateTime à DateTimeImmutable
        return \DateTimeImmutable::createFromMutable($value);
    }

    public function reverseTransform($value)
    {
        // Transformer DateTime à DateTimeImmutable
        return $value;
    }
}