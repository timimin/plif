package util;

import java.util.*;

public class LinkedProperties extends Properties {
    private static final long serialVersionUID = 1L;
    private final Set<Object> keySet = new LinkedHashSet<>();

    @Override
    public synchronized Object put(Object key, Object value) {
        keySet.add(key);
        return super.put(key, value);
    }

    @Override
    public Set<Object> keySet() {
        return keySet;
    }
}