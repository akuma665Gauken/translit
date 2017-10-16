#!/bin/bash
# Перекодирует рекурсивно в текущем каталоге имена
# файлов и каталогов в транслит.

shopt -s nullglob
for NAME in * ; do
 TRS=`echo $NAME | sed "y/ абвгдезийклмнопрстуфхцы/_abvgdezijklmnoprstufxcy/"`
# TRS=`echo $TRS | sed "y/АБВГДЕЗИЙКЛМНОПРСТУФХЦЫ/ABVGDEZIJKLMNOPRSTUFXCY/"`
 TRS=`echo $TRS | sed "y/ АБВГДЕЗИЙКЛМНОПРСТУФХЦЫ/_abvgdezijklmnoprstufxcy/"`
 TRS=${TRS//ч/ch};
 TRS=${TRS//Ч/ch} TRS=${TRS//ш/sh};
 TRS=${TRS//Ш/sh} TRS=${TRS//ё/jo};
 TRS=${TRS//Ё/jo} TRS=${TRS//ж/zh};
 TRS=${TRS//Ж/zh} TRS=${TRS//щ/sh\'};
 TRS=${TRS///SH\'} TRS=${TRS//э/je};
 TRS=${TRS//Э/je} TRS=${TRS//ю/ju};
 TRS=${TRS//Ю/ju} TRS=${TRS//я/ja};
 TRS=${TRS//Я/ja} TRS=${TRS//ъ/_};
 TRS=${TRS//ъ/_} TRS=${TRS//ь/_};
 TRS=${TRS//№/N};
 TRS=${TRS//Ь/\'}
 if [[ `file -b "$NAME"` == directory ]]; then
 mv -v "$NAME" "$TRS"
 cd "$TRS"
 "$0"
 cd ..
 else
 mv -v "$NAME" "$TRS"
 fi
done
