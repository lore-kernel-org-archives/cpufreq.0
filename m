From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patchin.sh,1.1.1.6,1.1.1.7
Date: Thu, 26 Aug 2004 17:11:30 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C0MqY-0008Uz-JG@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv32608

Modified Files:
      Tag: LINUX_2_4
	patchin.sh 
Log Message:
rewrite 'patchin.sh' so that it's a litle more easy to apply to kernel sources
with an already patched kernel.


Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.1.1.6
retrieving revision 1.1.1.7
diff -u -r1.1.1.6 -r1.1.1.7
--- patchin.sh	30 Sep 2003 11:25:51 -0000	1.1.1.6
+++ patchin.sh	26 Aug 2004 16:11:27 -0000	1.1.1.7
@@ -4,38 +4,39 @@
 #
 
 if [ "$1" = "" ]; then
-  echo "Syntax: $0 KERNELDIR"
-  exit 1
+	echo "Syntax: $0 KERNELDIR"
+	exit 1
 fi
 cpufreq=$PWD
 
 if [ ! -f $cpufreq/patchin.sh ]; then
-  echo "Please run me in the cpufreq directory"
-  exit 1
+	echo "Please run me in the cpufreq directory"
+	exit 1
 fi
 
-ln -sf $cpufreq/linux/Documentation/cpufreq $1/Documentation/cpu-freq
-ln -sf $cpufreq/linux/Documentation/cpufreq-old $1/Documentation/cpufreq-old
-ln -sf $cpufreq/linux/include/linux/cpufreq.h $1/include/linux/
-ln -sf $cpufreq/linux/drivers/cpufreq $1/drivers/cpufreq
+rm -rf $cpufreq/linux/Docmuentation/cpu-freq
+ln -sf cpufreq $cpufreq/linux/Documentation/cpu-freq
 
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/elanfreq.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/gx-suspmod.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.h $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/longrun.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/p4-clockmod.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k6.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.h $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.h $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-centrino.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-ich.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.h $1/arch/i386/kernel
-ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c $1/arch/i386/kernel
+diff -Nur -x"*CVS*" $1/Documentation/cpu-freq linux/Documentation/cpu-freq > patch_core
+diff -Nu $1/Documentation/cpufreq-old linux/Documentation/cpufreq-old >> patch_core
+diff -Nu $1/include/linux/cpufreq.h linux/include/linux/cpufreq.h >> patch_core
+if [ -f $1/kernel/cpufreq.c ]; then
+	diff -Nu $1/kernel/cpufreq.c linux/kernel/cpufreq.c >> patch_core
+fi
+diff -Nur -x"*CVS*" $1/drivers/cpufreq/ linux/drivers/cpufreq/ >> patch_core
+
+rm -f patch_x86
+# note that acpi.c must not be included..
+for f in elanfreq.c gx-suspmod.c longhaul.c longhaul.h longrun.c \
+		p4-clockmod.c powernow-k6.c powernow-k7.c powernow-k7.h \
+		powernow-k8.c powernow-k8.h speedstep-centrino.c \
+		speedstep-ich.c speedstep-lib.c speedstep-lib.h \
+		speedstep-piix4.c speedstep-smi.c; do
+	ln -sf cpufreq/$f linux/arch/i386/kernel/
+	diff -Nu $1/arch/i386/kernel/$f linux/arch/i386/kernel/$f >> patch_x86
+done
 
 cd $1
 patch -p1 -i $cpufreq/patch
+patch -p1 -i $cpufreq/patch_core
+patch -p1 -i $cpufreq/patch_x86
