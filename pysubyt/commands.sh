# Path: pysubyt\commands.sh
rm ./output/sediment_samples_sheet.ttl
python -m pysubyt -t ./templates/ -i ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ sampling.csv -n lod_course_emobon.ttl -s col_md ./input/EMO\ BON\ logsheet\ metadata\ -\ For\ LOD\ project.csv -s emo_obs ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ observatory.csv -o ./output/sediment_samples_sheet.ttl
#v1 observatory
rm ./output/v1_observatory_output.ttl
python -m pysubyt -t ./templates/ -i ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ observatory.csv -n v1_observatory.ttl -o ./output/v1_observatory_output.ttl
# v1 events
rm ./output/v1_event_output.ttl
python -m pysubyt -t ./templates/ -i ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ sampling.csv -n v1_event.ttl -o ./output/v1_event_output.ttl -s emo_obs ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ observatory.csv
python cleanup_ttl.py ./output/v1_event_output.ttl schema:range emobon:sedimentSample .
# v1 material samples
rm ./output/v1_material_sample_output.ttl
python -m pysubyt -t ./templates/ -i ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ sampling.csv -n v1_material_sample.ttl -o ./output/v1_material_sample_output.ttl -s col_md ./input/EMO\ BON\ logsheet\ metadata\ -\ For\ LOD\ project.csv

#concatinate ./output/prefixes.ttl with all v1 files into one ttl file
cat ./output/prefixes.ttl ./output/v1_project.ttl ./output/v1_observatory_output.ttl ./output/cleaned_v1_event_output.ttl ./output/v1_material_sample_output.ttl > ./output/v1_combined_output.ttl

#v2 material samples
rm ./output/v2_material_sample_output.ttl
python -m pysubyt -t ./templates/ -i ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ sampling.csv -n v2_material_sample.ttl -o ./output/v2_material_sample_output.ttl

#v2 environmental measurements
rm ./output/v2_environmental_measurement_output.ttl
python -m pysubyt -t ./templates/ -i ./input/EMO_BON_Metadata_Soft_Sediment_BPNS_Belgium\ -\ sampling.csv -n v2_environmental_measurement.ttl -o ./output/v2_environmental_measurement_output.ttl -s col_md ./input/EMO\ BON\ logsheet\ metadata\ -\ For\ LOD\ project.csv

#concatinate ./output/prefixes.ttl with all v2 files into one ttl file with an empty line as seperator
cat ./output/prefixes.ttl ./output/v1_project.ttl ./output/v1_observatory_output.ttl ./output/cleaned_v1_event_output.ttl  ./output/v2_material_sample_output.ttl ./output/v2_environmental_measurement_output.ttl > ./output/v2_combined_output.ttl