function inverse_matrix = inverseGaussJordan(matrix)
    % Check if the matrix is square
    [m, n] = size(matrix);
    if m ~= n
        error('The matrix is not square. The inverse is only defined for square matrices.');
    end

    % Create an augmented matrix [matrix | eye]
    augmented_matrix = [matrix, eye(n)];

    % Apply the Gauss-Jordan method to obtain [eye | inverse_matrix]
    for i = 1:n
        % Normalize row i
        augmented_matrix(i, :) = augmented_matrix(i, :) / ...
                                 augmented_matrix(i, i);
        
        % Eliminate other entries in column i
        for j = 1:n
            if i ~= j
                augmented_matrix(j, :) = augmented_matrix(j, :) ...
                - augmented_matrix(j, i) * augmented_matrix(i, :);
            end
        end
    end

    % Extract the inverse matrix from the right-hand side
    inverse_matrix = augmented_matrix(:, n+1:end);
end




