(ns com.tomekw.random.core
  (:gen-class))

(defn -main [& args]
  (println (. Math (random))))

