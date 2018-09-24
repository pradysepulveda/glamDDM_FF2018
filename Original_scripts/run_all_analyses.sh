#!usr/bin/bash

echo "Converting notebooks to python scripts..."
for file in *.ipynb; do
    jupyter nbconvert --to 'python' $file
done

echo "Running all analyses..."

echo "\n  1. Individual Differences"
python 1_individual_differences.py
rm 1_individual_differences.py

echo "\n  2.1. Individual GLAM estimation"
python 2_1_GLAM_individual_fit.py
rm 2_1_GLAM_individual_fit.py

echo "\n  2.2  Individual model comparison (Relative model fit)"
python 2_2_relative_model_fit.py
rm 2_2_relative_model_fit.py

echo "\n  3.1. Hierarchical GLAM estimation (and out of sample prediction)"
python 3_1_GLAM_hierarchical_out_of_sample.py
rm 3_1_GLAM_hierarchical_out_of_sample.py

echo "\n  3.2. Assessment of absolute model fit"
python 3_2_absolute_model_fit.py
rm 3_2_absolute_model_fit.py

echo "\n  4. Relationship between model parameters and behavior (out of sample)"
python 4_glam_parameters_predict_behavior.py
rm 4_glam_parameters_predict_behavior.py

echo "\n  SI 1. GLAM Parameter recovery"
python SI1_GLAM_parameter_recovery.py
rm SI1_GLAM_parameter_recovery.py

echo "\n  SI 2. Individual parameter estimates (non-hierarchically estimated)"
python SI2_parameter_estimates.py
rm SI2_parameter_estimates.py
