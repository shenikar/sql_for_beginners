CREATE TABLE
    nodes (
        point1 VARCHAR not null,
        point2 VARCHAR not null,
        cost INT not null
    );

INSERT INTO
    nodes (point1, point2, cost)
VALUES
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'c', 30);

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
ORDER BY
    total_cost,
    tour;