idf_component_register(
    SRCS "simulador_ruido.c"
    INCLUDE_DIRS "."
    EMBED_TXTFILES 
        "ca_cert.pem"
        "client_cert.pem"
        "client_key.pem"
)
