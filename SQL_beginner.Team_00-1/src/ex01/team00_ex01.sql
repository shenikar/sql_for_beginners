WITH RECURSIVE
    path (passed_path, current_point, total_cost) AS (
        SELECT
            point1 || ',' || point2 AS passed_path,
            point2 AS current_point,
            cost AS total_cost
        FROM
            nodes AS n
        WHERE
            point1 = 'a'
        UNION ALL
        SELECT
            path.passed_path || ',' || n.point2,
            n.point2,
            path.total_cost + n.cost
        FROM
            path
            JOIN nodes AS n ON path.current_point = n.point1
        WHERE
            (POSITION(n.point2 IN path.passed_path) = 0)
            OR (
                LENGTH (path.passed_path) = 7
                AND POSITION(n.point2 IN path.passed_path) = 1
            )
    ),
    final_paths AS (
        SELECT
            *
        FROM
            path
        WHERE
            LENGTH (path.passed_path) = 9
    )
SELECT
    total_cost,
    ('{' || passed_path || '}') AS tour
FROM
    final_paths
WHERE
    total_cost = (
        SELECT
            MIN(total_cost)
        FROM
            final_paths
    )
    OR total_cost = (
        SELECT
            MAX(total_cost)
        FROM
            final_paths
    )
ORDER BY
    total_cost,
    tour;