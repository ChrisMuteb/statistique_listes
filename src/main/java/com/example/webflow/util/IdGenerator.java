package com.example.webflow.util;

import java.util.UUID;

public class IdGenerator {
    // Private constructor to prevent instantiation of utility class
    private IdGenerator() {}

    /**
     * Generates a unique, positive numerical identifier bounded for SQL INT/BIGINT columns.
     */
    public static int generateUniqueNumericId() {
        UUID uuid = UUID.randomUUID();

        // Use the Least Significant Bits of the UUID, extract its hash code
        int uniqueId = uuid.hashCode();

        // Ensure the ID is strictly positive (Bitwise AND clears the sign bit)
        return uniqueId & Integer.MAX_VALUE;
    }
}
