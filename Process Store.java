    protected Object processStore(
        final String schemaName,
        final String storeName,
        final Object[] params,
        final int outputType) throws Exception {

        Object ret = null;
        final Datasource database = Datasource.fromString(schemaName);

        if (database == null) {
            throw new Exception(String.format(
                "Cannot resolve datasource from name [%s]",
                schemaName));
        }

        final Connection connection = DBConnectionManager.instance()
            .getConnection(database);

        if (connection == null) {
            throw new Exception(String.format(
                "Failed to establish connection from datasource [%s]",
                database.name()));
        }

        CallableStatement proc = null;
        try {
            // TODO -- Need to be replace with other implementation using some facility library such as: apache jdbc util

            String strparam = "";
            if (params != null) {
                for (int i = 1; i <= params.length; i++) {
                    strparam += "?,";
                }
            }

            if (strparam.length() > 0) {
                strparam = strparam.substring(0, strparam.lastIndexOf(","));
            }
            strparam = "(" + strparam + ")";

            proc = connection.prepareCall(
                "{ ? = call " + schemaName + "." + storeName + strparam + "}");
            proc.registerOutParameter(1, outputType);

            if (params != null) {
                for (int i = 0; i < params.length; i++) {

                    final Object obj = params[i];
                    if (obj instanceof Integer) {
                        this.setInt(proc, i + 2, (Integer) params[i]);
                    }
                    else if (obj instanceof Long) {
                        this.setLong(proc, i + 2, (Long) params[i]);
                    }
                    else if (obj instanceof String) {
                        this.setString(proc, i + 2, (String) params[i]);
                    }
                    else if (obj instanceof Date) {
                        this.setDate(proc, i + 2, (Date) params[i]);
                    }
                    else if (obj instanceof Timestamp) {
                        this.setTimestamp(proc, i + 2, (Timestamp) params[i]);
                    }
                    else if (obj instanceof Time) {
                        this.setTime(proc, i + 2, (Time) params[i]);
                    }
                    else if (obj instanceof Double) {
                        this.setDouble(proc, i + 2, (Double) params[i]);
                    }
                    else if (obj instanceof Float) {
                        this.setFloat(proc, i + 2, (Float) params[i]);
                    }
                    else if (obj instanceof Boolean) {
                        this.setBoolean(proc, i + 2, (Boolean) params[i]);
                    }
                    else if (obj instanceof FileInputStream) {
                        final FileInputStream fi = (FileInputStream) obj;
                        proc.setBinaryStream(i + 2, fi);
                    }
                    else if (obj instanceof Integer[]) {
                        final Array array = connection
                            .createArrayOf("int4", (Integer[]) obj);
                        proc.setArray(i + 2, array);
                    }
                    else {
                        proc.setObject(i + 2, params[i]);
                    }
                }
            }
            proc.execute();

            ret = proc.getObject(1);

            if (connection != null) {
                connection.commit();
            }
        }
        catch (final SQLException ex) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            }
            catch (final Exception e) {
                throw e;
            }
            throw ex;
        }
        finally {
            if (connection != null) {
                connection.close();
            }
        }

        return ret;
    }