From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patchin.sh,1.13,1.14
Date: Fri, 05 Sep 2003 11:55:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19vEFb-0000mr-PI@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv3022

Modified Files:
	patchin.sh 
Log Message:
when applying patchin.sh, kernel/cpufreq.c was not going to driver/cpufreq/

Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.13
retrieving revision 1.14
diff -u -r1.13 -r1.14
--- patchin.sh	7 Mar 2003 10:35:35 -0000	1.13
+++ patchin.sh	5 Sep 2003 10:55:32 -0000	1.14
@@ -43,10 +43,11 @@
 
 touch $cpufreq/core_patch
 
-echo `diff -u $1/kernel/ linux/kernel/cpufreq.c > $cpufreq/core_patch`;
-echo `diff -u $1/drivers/cpufreq/ linux/drivers/cpufreq/ >> $cpufreq/core_patch`;
-echo `diff -u $1/include/linux/cpufreq.h linux/include/linux/cpufreq.h >> $cpufreq/core_patch`;
-echo `diff -u $1/Documentation/cpu-freq/ linux/Documentation/cpufreq/ >> $cpufreq/core_patch`;
+# Still needed unless bk merge.
+echo `diff -Nu $1/kernel/cpufreq.c linux/kernel/cpufreq.c > $cpufreq/core_patch`;
+echo `diff -Nu $1/drivers/cpufreq/ linux/drivers/cpufreq/ >> $cpufreq/core_patch`;
+echo `diff -Nu $1/include/linux/cpufreq.h linux/include/linux/cpufreq.h >> $cpufreq/core_patch`;
+echo `diff -Nu $1/Documentation/cpu-freq/ linux/Documentation/cpufreq/ >> $cpufreq/core_patch`;
 
 # apply core_patch, x86_patch and patch
 # *************************************
