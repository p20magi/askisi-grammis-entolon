for a_dir in pdf html docx txt odt ipynb
do 
  if [ ! -d "${a_dir}" ]; then
    echo "Creating a ${a_dir} directory"
    mkdir "${a_dir}" || {
      echo "  Error creating directory: ${a_dir}"
      exit 1
    }
  fi
done 

while true 
do
  clear
  echo "Searching for MarkDown files in the local directory: "
  COUNT=0
  for n in *.md
  do 
    MCOUNT=$((COUNT+1))
    F+=( "$n" )
    echo "    ${MCOUNT}. ${F[$COUNT]}"
    ((COUNT++))
  done

  echo -n "Select a file to be converted: "
  read ANS
  if [ -z "$ANS" ]; then ANS="2020";fi

  ((ANS--))
  FILE_NAME="${F[$ANS]}"
  if [ ! -z "${FILE_NAME}" ]
  then
    break
  fi 
done

while true
do
  clear
  echo -n "Select which output you wish the .md file to be converted into:
  a) .pdf
  b) .html
