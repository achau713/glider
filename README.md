# glider

glider is a R utility package to streamline data query and processing. Most of 
the functions are written generally so they can be applied to many different 
datasets. There are some functions that pull data and metadata stored in 
a [Redcap](https://www.project-redcap.org/) system. The functions are divided
into useful categories below:

### Redcap API utilites:
1. `read_redcap_project`
2. `read_redcap_metadata`

### Project management
1. `check_dir_existence`
2. `create_dir`
3. `get_environment_vars`

### Data Quality Check
1. `check_column_existence`
2. `count_missing_values`
    - `count_column_missing_values`
    - `count_row_missing_values`
    - `count_total_missing_values`
3. `count_missing_values`


### Data Manipulation
1. `subset_column`
2. `subset_row`
3. `compute_summary_score`
4. `impute_value`
5. `join_multiple_data_frame`
6. `generate_similar_vars`
7. `convert_factor_to_numeric`
