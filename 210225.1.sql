SELECT
    a.nom_pais,
    COUNT(b.nom_estado) "QTD ESTADO"
FROM
    pf1788.pais   a
    LEFT JOIN pf1788.estado b ON ( a.cod_pais = b.cod_pais )
WHERE
    a.nom_pais = 'Brazil'
GROUP BY
    a.nom_pais
ORDER BY
    2 DESC;

SELECT
    b.nom_estado,
    COUNT(c.nom_cidade) "QTD CIDADE"
FROM
    pf1788.estado b
    LEFT JOIN pf1788.cidade c ON ( b.cod_estado = c.cod_estado )
GROUP BY
    b.nom_estado
HAVING COUNT(C.NOM_CIDADE) > 0
ORDER BY
    2 DESC;