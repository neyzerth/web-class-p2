let currentPage = 1;
        const rowsPerPage = 10;

        function toggleAllCheckboxes(masterCheckbox, tableId) {
            const checkboxes = document.querySelectorAll(`#${tableId} input[type="checkbox"]`);
            checkboxes.forEach(checkbox => {
                checkbox.checked = masterCheckbox.checked;
            });
        }

        function toggleInfo(td) {
            const row = td.parentElement;
            const nextRow = row.nextElementSibling;
            const extraInfoRows = document.querySelectorAll('.extra-info');

            if (nextRow && nextRow.classList.contains('extra-info')) {
                if (nextRow.style.display === 'table-row') {
                    nextRow.style.display = 'none';
                } else {
                    // Oculta todas las filas extra antes de mostrar la seleccionada
                    extraInfoRows.forEach(row => row.style.display = 'none');
                    nextRow.style.display = 'table-row';
                }
            }
        }

        function changeTable(direction) {
            const totalTables = 2; // Cambia esto si agregas más tablas
            currentPage += direction;

            if (currentPage < 1) {
                currentPage = 1;
            } else if (currentPage > totalTables) {
                currentPage = totalTables;
            }

            updateTables();
        }

        function updateTables() {
            const tables = document.querySelectorAll('table');
            tables.forEach((table, index) => {
                if (index + 1 === currentPage) {
                    table.style.display = 'table'; // Muestra la tabla actual
                } else {
                    table.style.display = 'none'; // Oculta las demás tablas
                }
            });

            document.getElementById('pageIndicator').innerText = `Página ${currentPage} de 2`;
        }

        function refreshPage() {
            // Mantiene la página actual en el local storage antes de recargar
            localStorage.setItem('currentPage', currentPage);
            window.location.reload(); // Recarga la página
        }

        // Mantenemos la página al recargar
        window.onload = function () {
            const page = localStorage.getItem('currentPage') || 1;
            currentPage = parseInt(page, 10);
            updateTables();
        };

        window.onbeforeunload = function () {
            localStorage.setItem('currentPage', currentPage);
        };