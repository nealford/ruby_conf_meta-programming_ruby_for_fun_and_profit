class EmployeeSorter {
    private String _selectionCriteria;
    private Method method;

    public void sort(List<Employee> employees) {
        Collections.sort(employees, getComparatorFor(_selectionCriteria));
    }


    public EmployeeSorter(String methodName) {
        methodName = "get" + methodName.substring(0, 1).toUpperCase() + methodName.substring(1);
        try {
            this.method = Employee.class.getMethod(methodName, null);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    public Comparator<Employee> getComparatorFor(final String field) {
        return new Comparator<Employee> () {
            public int compare(Employee o1, Employee o2) {
                Object field1, field2;
                try {
                    field1 = method.invoke(o1, null);
                    field2 = method.invoke(o2, null);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                return ((Comparable) field1).compareTo(field2);
            }

        };
    }
}