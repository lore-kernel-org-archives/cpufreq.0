From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patchin.sh,1.1.1.3,1.1.1.4
Date: Thu, 28 Aug 2003 17:16:41 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19sPRx-0006I7-1Q@flint.arm.linux.org.uk>
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
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv24180

Modified Files:
      Tag: LINUX_2_4
	patchin.sh 
Log Message:
update link for speedstep-piix4

Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.1.1.3
retrieving revision 1.1.1.4
diff -u -r1.1.1.3 -r1.1.1.4
--- patchin.sh	27 Aug 2003 14:14:32 -0000	1.1.1.3
+++ patchin.sh	28 Aug 2003 16:16:38 -0000	1.1.1.4
@@ -32,6 +32,7 @@
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-ich.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.h $1/arch/i386/kernel
+ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c $1/arch/i386/kernel
 
 cd $1
 patch -p1 -i $cpufreq/patch
