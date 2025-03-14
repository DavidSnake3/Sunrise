/* eslint-disable prettier/prettier */
import React from "react";
import {
  Table,
  TableHeader,
  TableColumn,
  TableBody,
  TableRow,
  TableCell,
  Input,
  Pagination,
  SortDescriptor,
  Button,
} from "@heroui/react";
import { Key } from "@react-types/shared";

interface DataTableProps<T> {
  columns: Column[];
  className: string;
  data: T[];
  renderCell: (item: T, columnKey: keyof T) => React.ReactNode;
  rowKey: keyof T;
  searchPlaceholder?: string;
  nombre?: string;
  initialVisibleColumns?: string[];
  selectionMode?: "single" | "multiple";
  selectedKeys?: Set<Key> | "all";
  edit: (id: number) => void;
  remove: (id: number) => void;
  add: (id: number) => void;
  onSelectionChange?: (keys: Set<Key> | "all") => void;
  topRightContent?: React.ReactNode;
  topContent?: React.ReactNode; // nuevo prop para contenido superior personalizado
}

interface Column {
  uid: string;
  name: string;
  sortable?: boolean;
}

export const DataTable = <T extends Record<string, any>>({
  columns,
  data,
  renderCell,
  rowKey,
  searchPlaceholder = "Search...",
  initialVisibleColumns,
  nombre = "",
  selectionMode,
  selectedKeys,
  topRightContent,
  topContent,
  className,
  edit,
  add,
  remove,

}: DataTableProps<T>) => {
  const [selectedItem, setSelectedItem] = React.useState(-1)
  const [filterValue, setFilterValue] = React.useState("");
  const [visibleColumns] = React.useState<Set<string>>(
    new Set(initialVisibleColumns || columns.map((c) => c.uid)),
  );
  const [rowsPerPage, setRowsPerPage] = React.useState(5);
  const [sortDescriptor, setSortDescriptor] = React.useState<SortDescriptor>({
    column: "id",
    direction: "ascending",
  });
  const [page, setPage] = React.useState(1);

  const headerColumns = React.useMemo(() => {
    return columns.filter((column) => visibleColumns.has(column.uid));
  }, [visibleColumns, columns]);

  const filteredItems = React.useMemo(() => {
    return data.filter((item) =>
      Object.values(item).some((value) =>
        String(value).toLowerCase().includes(filterValue.toLowerCase()),
      ),
    );
  }, [data, filterValue]);

  const pages = Math.ceil(filteredItems.length / rowsPerPage);

  const items = React.useMemo(() => {
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    return filteredItems.slice(start, end);
  }, [page, filteredItems, rowsPerPage]);

  const sortedItems = React.useMemo(() => {
    return [...items].sort((a, b) => {
      const column = sortDescriptor.column as keyof T;
      const first = a[column];
      const second = b[column];
      const cmp = String(first).localeCompare(String(second));

      return sortDescriptor.direction === "descending" ? -cmp : cmp;
    });
  }, [sortDescriptor, items]);

  const onSearchChange = (value: string) => {
    setFilterValue(value);
    setPage(1);
  };

  const onClear = () => setFilterValue("");

  // Contenido por defecto si no se pasa topContent personalizado
  const defaultTopContent = (
    <div className="flex flex-col gap-4">
      <div className="flex justify-between">
        <div className="flex items-center gap-5 flex-grow w-[100%]">
          <h1 className="text-2xl font-bold">{nombre}</h1>
          <Input
            isClearable
            className="w-full sm:max-w-[35%]"
            placeholder={searchPlaceholder}
            startContent={<i className="fi fi-rr-search" />}
            value={filterValue}
            onClear={onClear}
            onValueChange={onSearchChange}
          />
        </div>
        <div className="flex items-center gap-5">
          <Button
            className="w-[110px] h-[45px]"
            color="success"
            size="md"
            onPress={() => add(selectedItem)}
          >
            <i className="fi fi-rr-plus" />Agregar
          </Button>
          <Button
            className="w-[110px] h-[45px]"
            color="primary"
            isDisabled={selectedItem === -1}
            size="md"
            onPress={() => edit(selectedItem)}
          >
            <i className="fi fi-rr-pencil" />Editar
          </Button>
          <Button
            className="w-[110px] h-[45px]"
            color="danger"
            isDisabled={selectedItem === -1}
            size="md"
            onPress={() => remove(selectedItem)}
          >
            <i className="fi fi-rr-trash" />Eliminar
          </Button>
        </div>
      </div>
      <div className="flex justify-between items-center">
        <span className="text-default-400 text-small">
          Total {data.length} registros
        </span>
        <div className="flex items-center gap-2">
          <label className="flex items-center text-default-400 text-small">
            Filas por página:
            <select
              className="bg-transparent outline-none text-default-400 text-small"
              onChange={(e) => {
                setRowsPerPage(Number(e.target.value));
                setPage(1);
              }}
            >
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="15">15</option>
            </select>
          </label>
          {topRightContent}
        </div>
      </div>
    </div>
  );

  return (
    <Table
      isHeaderSticky
      aria-label="Data Table"
      bottomContent={
        <div className="py-2 px-2 flex justify-between items-center">
          <Pagination
            isCompact
            showControls
            showShadow
            color="primary"
            page={page}
            total={pages}
            onChange={setPage}
          />
        </div>
      }
      className={className}
      classNames={{ wrapper: "" }}
      color="primary"
      selectedKeys={selectedKeys}
      selectionMode={selectionMode}
      sortDescriptor={sortDescriptor}
      topContent={topContent || defaultTopContent}
      onSelectionChange={(key) => {
        const item = [...key.values()][0];

        (typeof item === "undefined" ? setSelectedItem(-1) : setSelectedItem(Number(item)))
      }}
      onSortChange={setSortDescriptor}
    >
      <TableHeader columns={headerColumns}>
        {(column) => (
          <TableColumn
            key={column.uid}
            align="center"
            allowsSorting={column.sortable}
          >
            {column.name}
          </TableColumn>
        )}
      </TableHeader>
      <TableBody items={sortedItems} >
        {(item: T) => (
          <TableRow key={String(item[rowKey])}>
            {(columnKey) => (
              <TableCell>{renderCell(item, columnKey as keyof T)}</TableCell>
            )}
          </TableRow>
        )}
      </TableBody>
    </Table>
  );
};
