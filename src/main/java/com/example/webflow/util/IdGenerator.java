package com.example.webflow.util;

import java.util.UUID;

public class IdGenerator {
    // Private constructor to prevent instantiation of utility class
    private IdGenerator() {}

    /**
     * Generates a unique, positive numerical identifier bounded for SQL INT/BIGINT columns.
     */
    public static long generateUniqueNumericId() {
        UUID uuid = UUID.randomUUID();

        // XOR the upper 64 bits and lower 64 bits of the UUID to squeeze maximum entropy
        long uniqueLong = uuid.getMostSignificantBits() ^ uuid.getLeastSignificantBits();

        // Bitwise AND with Long.MAX_VALUE clears the sign bit, making it strictly positive
        return uniqueLong & Long.MAX_VALUE;
    }
}
