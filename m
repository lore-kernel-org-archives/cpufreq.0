From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patchin.sh,1.1.1.1,1.1.1.2
Date: Wed, 27 Aug 2003 11:27:12 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19rxWC-0007Ow-Bu@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv28440

Modified Files:
      Tag: LINUX_2_4
	patchin.sh 
Log Message:
added the missing longhaul.h (thanks to Domimik).


Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- patchin.sh	25 Aug 2003 14:58:44 -0000	1.1.1.1
+++ patchin.sh	27 Aug 2003 10:27:09 -0000	1.1.1.2
@@ -23,6 +23,7 @@
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/elanfreq.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/gx-suspmod.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c $1/arch/i386/kernel
+ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.h $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/longrun.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/p4-clockmod.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k6.c $1/arch/i386/kernel
