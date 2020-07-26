##1 My notes
# add: detect previous installation
# update: remove versions of package except current version
# update: paths when I change any version numbers

##1 installer functions
function pause(){
   read -p "==> Please press [enter] to continue..."
}

function pauseError(){
   read -p "==> To check the installation, press [enter] and check for errors..."
}

if [ ! -d "$HOME/bin" ]; then
    mkdir $HOME/bin
fi
if [ ! -d "$HOME/logs" ]; then
    mkdir $HOME/logs
fi

##1 Imaging
###2 Master setup
git clone https://github.com/fiji/fiji ~/bin/fiji
cd ~/bin/fiji
mvn
pause


##1 Bioinformatics
###2 Master setup
samtools_installer="1.10"  # updated 18/12/2019
hisat2_installer="2.1.0"  # updated 18/12/2019
stringtie_installer="2.0.6"  # updated 18/12/2019
gffcompare_installer="0.10.6"  # updated 18/12/2019
htseqcount_installer="0.11.0"  # updated 18/12/2019
tophat_installer="2.1.1"  # updated 18/12/2019
kallisto_installer="0.46.1"  # updated 18/12/2019
fastqc_installer="0.11.8"  # updated 18/12/2019
picard_installer="2.21.4"  # updated 18/12/2019
flexbar_installer="3.5.0"  # updated 18/12/2019
multiqc_installer=""  # not needed
multiqc_installer=""  # not needed
regtools_installer=""  # not needed
rseqc_installer=""  # not needed
bamreadcounts_installer=""  # not needed

#grep -q "PATH=~/bin/samtools-" ~/.zshrc || echo PATH=~/bin/samtools-"$samtools_installer":~/bin/bam-readcount/bin:~/bin/hisat2-"$hisat2_installer":~/bin/stringtie-"$stringtie_installer".Linux_x86_64:~/bin/gffcompare-"$gffcompare_installer".Linux_x86_64:~/bin/htseq-release_"$htseqcount_installer"/scripts:~/bin/tophat-"$tophat_installer".Linux_x86_64:~/bin/kallisto_linux-v"$kallisto_installer":~/bin/FastQC:~/bin/flexbar-"$flexbar_installer"-linux:~/bin/regtools/build:/home/ubuntu/bin/bedtools2/bin:$PATH >> ~/.zshrc

# <----------------------------------->
###2 samtools
cd $HOME/bin
wget https://github.com/samtools/samtools/releases/download/"$samtools_installer"/samtools-"$samtools_installer".tar.bz2
bunzip2 samtools-"$samtools_installer".tar.bz2
tar -xvf samtools-"$samtools_installer".tar
cd samtools-"$samtools_installer"
make
pauseError			# Checks if system works
./samtools
pause
#export SAMTOOLS_ROOT=~/bin/samtools-"$samtools_installer"
# grep -q "export SAMTOOLS_ROOT" ~/.zshrc || echo export SAMTOOLS_ROOT=~/bin/samtools-"$samtools_installer" >> ~/.zshrc
rm $HOME/bin/samtools-"$samtools_installer".tar

# <----------------------------------->
###2 bam-readcounts
git clone https://github.com/genome/bam-readcount.git $HOME/bin/bam-readcount
cd $HOME/bin/bam-readcount
cmake -Wno-dev $HOME/bin/bam-readcount
make
pauseError			# Checks if system works
./bin/bam-readcount
pause

# <----------------------------------->
###2 Hisat2
cd $HOME/bin
wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-"$hisat2_installer"-Linux_x86_64.zip
unzip hisat2-"$hisat2_installer"-Linux_x86_64.zip
cd hisat2-"$hisat2_installer"
pauseError			# Checks if system works
./hisat2
pause
rm $HOME/bin/hisat2-"$hisat2_installer"-Linux_x86_64.zip

# <----------------------------------->
###2 StringTie
cd $HOME/bin
wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-"$stringtie_installer".Linux_x86_64.tar.gz
tar -xzvf stringtie-"$stringtie_installer".Linux_x86_64.tar.gz
cd stringtie-"$stringtie_installer".Linux_x86_64
pauseError			# Checks if system works
./stringtie
pause
rm $HOME/bin/stringtie-"$stringtie_installer".Linux_x86_64.tar.gz

# <----------------------------------->
###2 gffcompare
cd $HOME/bin
wget http://ccb.jhu.edu/software/stringtie/dl/gffcompare-"$gffcompare_installer".Linux_x86_64.tar.gz
tar -xzvf gffcompare-"$gffcompare_installer".Linux_x86_64.tar.gz
cd gffcompare-"$gffcompare_installer".Linux_x86_64
pauseError			# Checks if system works
./gffcompare
pause
rm $HOME/bin/gffcompare-"$gffcompare_installer".Linux_x86_64.tar.gz

# <----------------------------------->
###2 htseq-count
#!! as described on https://htseq.readthedocs.io/en/release_0.11.1/install.html#installation-on-linux
#!! alternative installation
# sudo pacman -S python python-numpy python-matplotlib
# yay -S python-pysam python-htseq
# pause

#!! try this installation first
cd $HOME/bin
wget https://github.com/simon-anders/htseq/archive/release_"$htseqcount_installer".tar.gz
tar -zxvf release_"$htseqcount_installer".tar.gz
cd htseq-release_"$htseqcount_installer"/
echo '* Please run the following in the appropiate py env:' >> $HOME/logs/bioinformatics-log.txt
echo 'python setup.py install' >> $HOME/logs/bioinformatics-log.txt
chmod +x scripts/htseq-count
echo 'if nothing else works, in the appropiate py env:' >> $HOME/logs/bioinformatics-log.txt
echo 'pip install HTseq' >> $HOME/logs/bioinformatics-log.txt
echo '<----------------------------------->' >> $HOME/logs/bioinformatics-log.txt
pause
rm $HOME/bin/release_"$htseqcount_installer".tar.gz

#!! if nothing else works, 'pip install HTseq'

# <----------------------------------->
###2 TopHat
#!! Note, this tool is currently only installed for the gtf_to_fasta tool used in kallisto section
cd $HOME/bin
wget https://ccb.jhu.edu/software/tophat/downloads/tophat-"$tophat_installer".Linux_x86_64.tar.gz
tar -zxvf tophat-"$tophat_installer".Linux_x86_64.tar.gz
cd tophat-"$tophat_installer".Linux_x86_64/
pauseError			# Checks if system works
./gtf_to_fasta
pause
rm $HOME/bin/tophat-"$tophat_installer".Linux_x86_64.tar.gz

# <----------------------------------->
###2 kallisto
cd $HOME/bin
wget https://github.com/pachterlab/kallisto/releases/download/v"$kallisto_installer"/kallisto_linux-v"$kallisto_installer".tar.gz
tar -zxvf kallisto_linux-v"$kallisto_installer".tar.gz
cd kallisto/
pauseError			# Checks if system works
./kallisto
pause
echo PATH=~/bin/kallisto_linux-v"$kallisto_installer":'$PATH' >> ~/.zshrc
#rm $HOME/bin/kallisto_linux-v"$kallisto_installer".tar.gz

# <----------------------------------->
###2 FastQC
#!! In addition to installing on the cloud you should also install FastQC on your own laptop/desktop
cd $HOME/bin
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v"$fastqc_installer".zip --no-check-certificate
unzip fastqc_v"$fastqc_installer".zip
cd FastQC/
chmod 755 fastqc
pauseError			# Checks if system works
./fastqc --help
pause
rm $HOME/bin/fastqc_v"$fastqc_installer".zip

# <----------------------------------->
###2 MultiQC
echo '* please run the following in the appropiate py env' >> $HOME/logs/bioinformatics-log.txt
echo 'pip3 install multiqc' >> $HOME/logs/bioinformatics-log.txt
echo '<----------------------------------->' >> $HOME/logs/bioinformatics-log.txt
pauseError			# Checks if system works
multiqc --help
pause

# <----------------------------------->
###2 Picard
cd $HOME/bin
wget https://github.com/broadinstitute/picard/releases/download/"$picard_installer"/picard.jar -O picard.jar
java -jar $HOME/bin/picard.jar
pause

# <----------------------------------->
###2 Flexbar
cd $HOME/bin
wget https://github.com/seqan/flexbar/releases/download/v"$flexbar_installer"/flexbar-"$flexbar_installer"-linux.tar.gz
tar -xzvf flexbar-"$flexbar_installer"-linux.tar.gz
cd flexbar-"$flexbar_installer"-linux/
pauseError			# Checks if system works
./flexbar
pause
rm $HOME/bin/flexbar-"$flexbar_installer"-linux.tar.gz

# <----------------------------------->
###2 Regtools
git clone https://github.com/griffithlab/regtools $HOME/bin/regtools
cd regtools/
mkdir build
cd build/
cmake ..
make
pauseError			# Checks if system works
./regtools
pause

# <----------------------------------->
###2 RSeQC
echo '* to install RSeQC, first activate a py-env, then run:' >> $HOME/logs/bioinformatics-log.txt
echo 'pip install RSeQC' >> $HOME/logs/bioinformatics-log.txt
echo 'read_GC.py' >> $HOME/logs/bioinformatics-log.txt
echo '<----------------------------------->' >> $HOME/logs/bioinformatics-log.txt
pause
