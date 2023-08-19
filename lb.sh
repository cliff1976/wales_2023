#/bin/sh

# build a nice little lightbox page for all the images in a directory
# expect thumbnails in a thumbnail directory

# (web-accessible) path to the lightbox script
LBPATH="./";

MAXHEIGHT="700";
MAXWIDTH="900";

# use the directory we're in as the name of the lightbox group.
# variable representing the directory
MYDIR=${PWD##*/};

echo "<html>" > lb.html;
echo "<head>" >> lb.html;
echo "<link rel=\"stylesheet\" href=\"${LBPATH}lightbox2-master/dist/css/lightbox.min.css\">" >> lb.html;

echo "</head>" >> lb.html;
echo "<body>" >> lb.html;

for i in *.jpg; 
do
    echo "processing $i";
    echo "<a class=\"\" href=\"$i\" data-lightbox=\"$MYDIR\" data-title=\"$MYDIR &rarr; $i\"><img class=\"example-image\" src=\"thumbnail/$i\" alt=\"\"/></a> 
    " >> lb.html;
done

echo "<script src=\"$LBPATH/lightbox2-master/dist/js/lightbox-plus-jquery.js\"></script>" >> lb.html;

echo "<script>
    lightbox.option({
      'fitImagesInViewport': true , 
      'showImageNumberLabel': true /*, 
      'maxHeight': $MAXHEIGHT ,
      'maxWidth': $MAXWIDTH */
    })
</script>" >> lb.html;

echo "</body>" >> lb.html;
echo "</html>" >> lb.html;
