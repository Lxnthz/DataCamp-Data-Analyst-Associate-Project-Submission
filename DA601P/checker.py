import pandas as pd
import os

def check_columns(output_df, output_df_name, required_columns):
    results = []
    for col in required_columns:
        exists = col in output_df.columns
        results.append({'Dataset': output_df_name, 'Column': col, 'Exists': '✅' if exists else '❌'})
    return results

def safe_check(output_df_name, required_columns, csv_file):
    results = []
    try:
        df = pd.read_csv(csv_file)
        results.extend(check_columns(df, f"{output_df_name} ({os.path.basename(csv_file)})", required_columns))
    except Exception as e:
        results.append({'Dataset': f"{output_df_name} ({os.path.basename(csv_file)})", 'Column': '—', 'Exists': f'❌ Error: {str(e)}'})
    return results

requirements = {
    'missing_year': ['missing_year'],
    'clean_data': ['product_id', 'product_type', 'brand', 'weight', 'price', 'average_units_sold', 'year_added', 'stock_location'],
    'min_max_product': ['product_type', 'min_price', 'max_price'],
    'average_price_product': ['product_id', 'price', 'average_units_sold']    
}

# Map each task to its CSV file
csv_mapping = {
    'missing_year': './exported/datalab_export_2026-02-19 01_54_13.csv',
    'clean_data': './exported/datalab_export_2026-02-19 01_53_50.csv',
    'min_max_product': './exported/datalab_export_2026-02-19 01_54_22.csv',
    'average_price_product': './exported/datalab_export_2026-02-19 01_54_31.csv'
}

all_results = []
for output_df_name, cols in requirements.items():
    if output_df_name in csv_mapping:
        csv_file = csv_mapping[output_df_name]
        all_results += safe_check(output_df_name, cols, csv_file)
    else:
        all_results.append({'Dataset': output_df_name, 'Column': '—', 'Exists': '❌ No CSV file mapped'})

check_results_df = pd.DataFrame(all_results)

print(check_results_df)