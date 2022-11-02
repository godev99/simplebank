-- name: CreateTransfer :one
INSERT INTO transfers (
    from_account_id,
    to_account_id,
    ammount
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: GetTransfer :one
SELECT * FROM transfers
WHERE id = $1 LIMIT 1;

-- name: ListTransfers :many
SELECT * FROM transfers
ORDER BY id
    LIMIT $1
OFFSET $2;

-- name: UpdateTransfer :one
UPDATE transfers
SET ammount = $4
WHERE id = $1 AND from_account_id = $2 AND to_account_id = $3
RETURNING *;

-- name: DeleteTransfer :exec
DELETE FROM transfers
WHERE id = $1;